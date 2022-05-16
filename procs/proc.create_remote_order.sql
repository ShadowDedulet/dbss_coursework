use pc_upgrade
go

create procedure dbo.CreateRemoteOrder
    @date date = null,
    @address nvarchar(30),

    @type nvarchar(10),
    @paid bit,
    @details nvarchar(100) = NULL,
    @pc_id int = NULL,
    @customer_id int = NULL,
    @c_full_name nvarchar(40) = NULL,
    @c_phone nvarchar(10) = NULL,
    @job_id int
as
begin
    declare @transport_id int, @driver_id int, @driver_pos_id int

    -- Поиск минимальной допустимой даты 
    if @date is null
    begin
        -- Поиск транспорта без запланированных выездов
        select top 1 @transport_id = T.id 
        from dbo.remotes as R
        full outer join dbo.transports as T
        on T.id = R.transport_id
        where R.transport_id is null

        if @transport_id is not null
            set @date = getdate()
        else
        begin
            -- Выбор минимального из дат; + 1 день
            select top 1 @transport_id = I.transport_id, @date = dateadd(day, 1, I.date) 
            from (
                -- Поиск наиспозднейшних выездов для каждого транспорта
                select transport_id, max(date) as date
                from dbo.remotes
                group by transport_id
            ) as I
            order by I.date asc
        end
    end
    else
    begin
        select @transport_id = transport_id
        from dbo.remotes
        where date <> @date

        if @transport_id is null
        begin
            print 'Нет транспорта на эту дату, попробуйте дату отличную от ' + CAST(@date as varchar(20)) 
            return -1
        end
    end

    select @driver_pos_id = id from dbo.positions where name = 'driver'

    -- Выбор свободного в эту дату сотрудника с правами, водитель в приоритете
    select top 1 @driver_id = E.id
    from dbo.employees as E
    left join dbo.remotes as R
    on R.driver_id = E.id 
    where R.driver_id is null and R.date = @date and E.is_driver = 1
    order by case 
        when E.position_id = @driver_pos_id then 1
        else 2
        end asc

    -- На случай нехватки сотрудников? 
    if @driver_id is null
    begin
        print 'Нет сотрудников на найденную ближайшую дату, попробуйте даты позже ' + CAST(@date as varchar(20)) 
        return -1
    end

    -- Создаем обычный заказ 
    declare @order_id int
    exec @order_id = dbo.CreateOrder @type, @paid, @details, @pc_id, @customer_id, @c_full_name, @c_phone, @job_id

    -- Создаем удаленный заказ
    insert into dbo.remotes
    ([date], [address], [transport_id], [driver_id], [order_id])
    values
    (@date, @address, @transport_id, @driver_id, @order_id)
end

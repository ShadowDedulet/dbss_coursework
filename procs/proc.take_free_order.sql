use pc_upgrade
go

create procedure dbo.TakeFreeOrder
    @order_id int
as
begin
    declare @master_id int, @block_id int, @free_order_id int, @pos_job_id int

    exec @master_id = dbo.GetIdByLogin
    select @block_id = block_id from dbo.employees where id = @master_id

    select @free_order_id = m.order_id 
    from dbo.moves as m
    join dbo.orders as o 
    on o.id = m.order_id
    where m.block_id = @block_id and o.employee_id is NULL and o.id = @order_id
    
    if @free_order_id is null
    begin
        print 'Order unavailable'
        return -1 
    end

    select @pos_job_id = id
    from dbo.positionjobs
    where job_id = (select job_id from dbo.orders where id = @free_order_id) 
        and position_id = (select position_id from dbo.employees where id = @master_id)

    if @pos_job_id is null
    begin
        print 'Can not take the order'
        return -1 
    end

    update dbo.orders
    set employee_id = @master_id
    where id = @free_order_id
    print 'Order taken'
end

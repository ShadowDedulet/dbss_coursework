use pc_upgrade
go

create procedure dbo.CreateOrder
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
    if (@customer_id is null and @c_full_name is null) OR (@customer_id is not null and @c_full_name is not null)
    begin
        print 'New or Existing Customer'
        return -1
    end

    declare @new_c int, @order_id int, @receiver_id int, @block_id int
    set @new_c = 0

    if @customer_id is null
        begin
            insert into dbo.customers
            ([full_name], [phone])
            values
            (@c_full_name, @c_phone)
            
            if @@rowcount < 1
            begin
                return -1
                print 'Customer args error'
            end

            set @new_c = 1
            set @customer_id = scope_identity()
        end

    insert into dbo.orders
    ([type], [paid], [completed], [details], [created_at], [pc_id], [customer_id], [employee_id], [job_id])
    values
    (@type, @paid, DEFAULT, @details, DEFAULT, @pc_id, @customer_id, NULL, @job_id)

    if @@rowcount - @new_c < 1
        return -1
    
    set @order_id = scope_identity()
    exec @receiver_id = dbo.GetIdByLogin
    select @block_id = block_id from dbo.employees where id = @receiver_id
    
    exec dbo.MoveOrder @order_id, @receiver_id, @block_id

    return @order_id
end

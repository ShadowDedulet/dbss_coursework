use pc_upgrade
go

create procedure dbo.CreateUnit
    @serial_code int,
    @type nvarchar(10) = NULL,
    @name int = NULL,
    @price money,
    @order_id int = NULL,
    @pc_id int = NULL
as
begin
    if @order_id is not null and @pc_id is not NULL
    begin 
        print 'PC or Order?'
        return -1
    end

    insert into dbo.units
    ([serial_code], [type], [name], [price], [order_id], [pc_id])
    values
    (@serial_code, @type, @name, @price, @order_id, @pc_id)
    
    return scope_identity()
end

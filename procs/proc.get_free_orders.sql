use pc_upgrade
go

create procedure dbo.GetFreeOrders
    @paid bit = 0
as
begin
    declare @master_id int, @block_id int

    exec @master_id = dbo.GetIdByLogin
    select @block_id = block_id from dbo.employees where id = @master_id

    select m.order_id 
    from dbo.moves as m
    join dbo.orders as o 
    on o.id = m.order_id
    where m.block_id = @block_id and o.employee_id is NULL
end

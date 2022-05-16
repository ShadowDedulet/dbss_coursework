use pc_upgrade
go

create procedure dbo.MoveOrder
    @order_id int,
    @employee_id int,
    @block_id int
as
begin
    declare @prev_move_id int
    select @prev_move_id = id from dbo.moves where order_id = @order_id and is_last = 1

    insert into dbo.moves 
    ([is_last], [is_complete], [prev_move_id], [order_id], [employee_id], [block_id])
    values
    (DEFAULT, DEFAULT, @prev_move_id, @order_id, @employee_id, @block_id)
end

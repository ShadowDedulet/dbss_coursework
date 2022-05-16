use pc_upgrade
go

create procedure dbo.GetFullPrice
    @order_id int
as
begin
    declare @price money

    select @price = price
    from dbo.jobs
    where id = (select job_id from dbo.orders where id = @order_id)

    select @price += sum(price)
    from dbo.units
    where order_id = @order_id

    return @price
end
use pc_upgrade
go

create procedure dbo.TakeFreeUnit
    @order_id int,
    @unit_id int = NULL,
    @name nvarchar(30) = NULL
as
begin
    if (@unit_id is NULL and @name is null) or (@unit_id is not null and @name is not null)
    begin
        print('Id or Name?')
        return -1
    end

    if @order_id is null
    begin
        select top 1 @unit_id = id from dbo.units where 
            name = @name and order_id is null and pc_id is null 
    end


    update dbo.units
    set order_id = @order_id
    where id = @unit_id and order_id is null and pc_id is null 
    
    select id from dbo.units where order_id = @order_id and id = @unit_id 
    return 1
end
use pc_upgrade
go

create procedure dbo.GetFreeUnits
as
begin
    select * from dbo.units where order_id is null and pc_id is null
end
use pc_upgrade
go

create procedure dbo.CreateCustomer
    @full_name nvarchar(40),
    @phone nvarchar(10) = NULL
as
begin
    insert into dbo.customers
    ([full_name], [phone])
    values
    (@full_name, @phone)
    
    return scope_identity()
end

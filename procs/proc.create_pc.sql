use pc_upgrade
go

create procedure dbo.CreatePc
    @details nvarchar(100) = NULL
as
begin
    insert into dbo.pcs
    ([details])
    values
    (@details)
    
    return scope_identity()
end

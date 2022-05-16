use pc_upgrade
go

create procedure dbo.GetTransports
    @status nvarchar(4) = NULL
as
begin
    if @status is null
    begin
        select * from dbo.transports 
        return 1
    end

    select * from dbo.transports where status = @status
end

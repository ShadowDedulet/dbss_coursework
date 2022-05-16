use pc_upgrade
go

create procedure dbo.GetRemotes
    @date date = NULL
as
begin
    if @date is null
    begin
        select * from dbo.remotes 
        return 1
    end

    select * from dbo.remotes where date = @date
end

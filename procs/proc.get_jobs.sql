use pc_upgrade
go

create procedure dbo.GetJobs
    @job nvarchar(30) = NULL
as
begin
    if @job is null
        begin
            select * from dbo.jobs
            return 1
        end

    select * from dbo.jobs where name like @job
end

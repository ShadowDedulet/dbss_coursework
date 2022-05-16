create procedure dbo.GetIdByLogin
as
begin
    return select id from dbo.employees where login = CURRENT_USER
end
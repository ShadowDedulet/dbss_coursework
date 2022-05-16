GRANT EXECUTE ON dbo.CreateCustomer TO receiver

GRANT EXECUTE ON dbo.CreateOrder TO receiver

GRANT EXECUTE ON dbo.CreatePc TO receiver

GRANT EXECUTE ON dbo.CreateRemoteOrder TO receiver

GRANT EXECUTE ON dbo.CreateUnit TO receiver

GRANT EXECUTE ON dbo.GetFreeOrders TO w_master
GRANT EXECUTE ON dbo.GetFreeOrders TO d_master

GRANT EXECUTE ON dbo.GetFreeUnits TO receiver
GRANT EXECUTE ON dbo.GetFreeUnits TO w_master
GRANT EXECUTE ON dbo.GetFreeUnits TO d_master

GRANT EXECUTE ON dbo.GetFullPrice TO receiver

GRANT EXECUTE ON dbo.GetIdByLogin TO pub

GRANT EXECUTE ON dbo.GetJobs TO receiver

GRANT EXECUTE ON dbo.GetRemotes TO driver
GRANT EXECUTE ON dbo.GetRemotes TO w_master
GRANT EXECUTE ON dbo.GetRemotes TO d_master

GRANT EXECUTE ON dbo.GetTransports TO dispatcher

GRANT EXECUTE ON dbo.MoveOrder TO receiver
GRANT EXECUTE ON dbo.MoveOrder TO courier

GRANT EXECUTE ON dbo.TakeFreeOrder TO w_master
GRANT EXECUTE ON dbo.TakeFreeOrder TO d_master

GRANT EXECUTE ON dbo.TakeFreeUnit TO w_master
GRANT EXECUTE ON dbo.TakeFreeUnit TO d_master

-- ADMINS:
-- add_fks
-- create_tables
-- create_users
-- fill_tables
-- grants
-- select_all
-- select_filles
-- select_users






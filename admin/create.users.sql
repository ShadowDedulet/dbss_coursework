use pc_upgrade
go

BEGIN TRANSACTION

-- CREATE ROLES
create role receiver
go
create role d_master
go
create role courier
go
create role w_master
go
create role driver
go
create role dispatcher
go
create role pub
go

-- CREATE LOGINS
create login [receiver_1]
WITH PASSWORD = 'receiver_1',
DEFAULT_DATABASE = [pc_upgrade],
CHECK_POLICY = ON,
CHECK_EXPIRATION = OFF ;
go

create login [receiver_2]
WITH PASSWORD = 'receiver_2',
DEFAULT_DATABASE = [pc_upgrade],
CHECK_POLICY = ON,
CHECK_EXPIRATION = OFF ;
go

create login [d_master_1]
WITH PASSWORD = 'd_master_1',
DEFAULT_DATABASE = [pc_upgrade],
CHECK_POLICY = ON,
CHECK_EXPIRATION = OFF ;
go

create login [d_master_2]
WITH PASSWORD = 'd_master_2',
DEFAULT_DATABASE = [pc_upgrade],
CHECK_POLICY = ON,
CHECK_EXPIRATION = OFF ;
go

create login [courier_1]
WITH PASSWORD = 'courier_1',
DEFAULT_DATABASE = [pc_upgrade],
CHECK_POLICY = ON,
CHECK_EXPIRATION = OFF ;
go

create login [courier_2]
WITH PASSWORD = 'courier_2',
DEFAULT_DATABASE = [pc_upgrade],
CHECK_POLICY = ON,
CHECK_EXPIRATION = OFF ;
go

create login [w_master_1]
WITH PASSWORD = 'w_master_1',
DEFAULT_DATABASE = [pc_upgrade],
CHECK_POLICY = ON,
CHECK_EXPIRATION = OFF ;
go

create login [w_master_2]
WITH PASSWORD = 'w_master_2',
DEFAULT_DATABASE = [pc_upgrade],
CHECK_POLICY = ON,
CHECK_EXPIRATION = OFF ;
go

create login [driver_1]
WITH PASSWORD = 'driver_1',
DEFAULT_DATABASE = [pc_upgrade],
CHECK_POLICY = ON,
CHECK_EXPIRATION = OFF ;
go

create login [dispatcher_1]
WITH PASSWORD = 'dispatcher_1',
DEFAULT_DATABASE = [pc_upgrade],
CHECK_POLICY = ON,
CHECK_EXPIRATION = OFF ;
go

-- CREATE USERS
create user receiver_1 for login [receiver_1]
go
create user receiver_2 for login [receiver_2]
go
create user d_master_1 for login [d_master_1]
go
create user d_master_2 for login [d_master_2]
go
create user courier_1 for login [courier_1]
go
create user courier_2 for login [courier_2]
go
create user w_master_1 for login [w_master_1]
go
create user w_master_2 for login [w_master_2]
go
create user driver_1 for login [driver_1]
go
create user dispatcher_1 for login [dispatcher_1]
go

-- ADD ROLES TO USERS
alter role receiver add member [receiver_1]
go
alter role receiver add member [receiver_2]
go
alter role d_master add member [d_master_1]
go
alter role d_master add member [d_master_2]
go
alter role courier add member [courier_1]
go
alter role courier add member [courier_2]
go
alter role w_master add member [w_master_1]
go
alter role w_master add member [w_master_2]
go
alter role driver add member [driver_1]
go
alter role dispatcher add member [dispatcher_1]
go
alter role pub add member [receiver_1]
go
alter role pub add member [receiver_2]
go
alter role pub add member [d_master_1]
go
alter role pub add member [d_master_2]
go
alter role pub add member [courier_1]
go
alter role pub add member [courier_2]
go
alter role pub add member [w_master_1]
go
alter role pub add member [w_master_2]
go
alter role pub add member [driver_1]
go
alter role pub add member [dispatcher_1]
go

COMMIT TRANSACTION  

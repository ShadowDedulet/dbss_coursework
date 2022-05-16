CREATE TABLE [dbo].[customers] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [full_name] nvarchar(40) NOT NULL,
  [phone] nvarchar(10) NULL UNIQUE CHECK (phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)
GO

CREATE TABLE [dbo].[positions] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(20) NOT NULL UNIQUE
)
GO

CREATE TABLE [dbo].[jobs] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [name] nvarchar(30) NOT NULL UNIQUE,
  [price] money NOT NULL CHECK (price >= 0)
)
GO

CREATE TABLE [dbo].[positionjobs] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [position_id] int NOT NULL,
  [job_id] int NOT NULL
)
GO

CREATE TABLE [dbo].[blocks] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [address] nvarchar(30) NOT NULL UNIQUE,
  [type] nvarchar(20) NOT NULL DEFAULT('receive point') CHECK (type in ('receive point', 'workshop'))
)
GO

CREATE TABLE [dbo].[employees] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [full_name] nvarchar(40) NOT NULL,
  [login] nvarchar(20) NOT NULL,
  [is_driver] bit NOT NULL DEFAULT(0),
  [block_id] int NOT NULL,
  [position_id] int NOT NULL
)
GO

CREATE TABLE [dbo].[transports] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [status] nvarchar(4) NOT NULL DEFAULT ('free') CHECK (status in ('free', 'busy', 'bust'))
)
GO

CREATE TABLE [dbo].[units] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [serial_code] int NOT NULL UNIQUE,
  [type] nvarchar(10) NULL,
  [name] nvarchar(30) NULL,
  [price] money NOT NULL CHECK (price >= 0),
  [order_id] int NULL,
  [pc_id] int NULL
)
GO

CREATE TABLE [dbo].[pcs] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [details] nvarchar(100) NULL
)
GO

CREATE TABLE [dbo].[orders] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [type] nvarchar(10) NOT NULL DEFAULT ('diagnostic') CHECK (type in ('diagnostic', 'repair', 'upgrade')),
  [paid] bit NOT NULL DEFAULT (0),
  [completed] bit NOT NULL DEFAULT (0),
  [details] nvarchar(100) NULL,
  [created_at] datetime NOT NULL DEFAULT (GETDATE()),
  [pc_id] int NULL,
  [customer_id] int NOT NULL,
  [employee_id] int NULL,
  [job_id] int NOT NULL
)
GO

CREATE TABLE [dbo].[moves] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [is_last] bit DEFAULT (1),
  [is_complete] bit DEFAULT (0),
  [prev_move_id] int NULL DEFAULT(NULL),
  [employee_id] int NOT NULL,
  [block_id] int NOT NULL,
  [order_id] int NOT NULL
)
GO

CREATE TABLE [dbo].[remotes] (
  [id] int PRIMARY KEY IDENTITY(1, 1),
  [date] date NOT NULL,
  [address] nvarchar(30) NOT NULL,
  [transport_id] int NOT NULL,
  [driver_id] int NOT NULL,
  [order_id] int NOT NULL
)
GO


ALTER TABLE [dbo].[employees] ADD FOREIGN KEY ([block_id]) REFERENCES [dbo].[blocks] ([id])
GO

ALTER TABLE [dbo].[employees] ADD FOREIGN KEY ([position_id]) REFERENCES [dbo].[positions] ([id])
GO

ALTER TABLE [dbo].[orders] ADD FOREIGN KEY ([pc_id]) REFERENCES [dbo].[pcs] ([id])
GO

ALTER TABLE [dbo].[orders] ADD FOREIGN KEY ([customer_id]) REFERENCES [dbo].[customers] ([id])
GO

ALTER TABLE [dbo].[orders] ADD FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees] ([id])
GO

ALTER TABLE [dbo].[orders] ADD FOREIGN KEY ([job_id]) REFERENCES [dbo].[jobs] ([id])
GO

ALTER TABLE [dbo].[units] ADD FOREIGN KEY ([order_id]) REFERENCES [dbo].[orders] ([id])
GO

ALTER TABLE [dbo].[units] ADD FOREIGN KEY ([pc_id]) REFERENCES [dbo].[pcs] ([id])
GO

ALTER TABLE[dbo].[moves] ADD FOREIGN KEY ([prev_move_id]) REFERENCES [dbo].[moves] ([id])
GO

ALTER TABLE [dbo].[moves] ADD FOREIGN KEY ([employee_id]) REFERENCES [dbo].[employees] ([id])
GO

ALTER TABLE [dbo].[moves] ADD FOREIGN KEY ([block_id]) REFERENCES [dbo].[blocks] ([id])
GO

ALTER TABLE [dbo].[moves] ADD FOREIGN KEY ([order_id]) REFERENCES [dbo].[orders] ([id])
GO

ALTER TABLE [dbo].[remotes] ADD FOREIGN KEY ([transport_id]) REFERENCES [dbo].[transports] ([id])
GO

ALTER TABLE [dbo].[remotes] ADD FOREIGN KEY ([driver_id]) REFERENCES [dbo].[employees] ([id])
GO

ALTER TABLE [dbo].[remotes] ADD FOREIGN KEY ([order_id]) REFERENCES [dbo].[orders] ([id])
GO

ALTER TABLE [dbo].[positionjobs] ADD FOREIGN KEY ([position_id]) REFERENCES [dbo].[positions] ([id])
GO

ALTER TABLE [dbo].[positionjobs] ADD FOREIGN KEY ([job_id]) REFERENCES [dbo].[jobs] ([id])
GO

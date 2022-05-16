INSERT INTO dbo.customers
([full_name], [phone])
VALUES
('Евула Анджэй Стефанович', 9800180303),
('Першаев Никита Николаевич', 9215002020),
('Овсепян Араик Нерсесович', 9252712729)


INSERT INTO dbo.positions
([name])
VALUES
('receiver'),
('duty master'),
('courier'),
('workshop master'),
('driver'),
('transport dispatcher'),
('administrator')


DECLARE @recvr as int, @d_mst as int, @crier as int, @w_mst as int, @drivr as int, @dspth as int, @admin as int
SELECT @recvr = [id] from dbo.positions where name = 'receiver'
SELECT @d_mst = [id] from dbo.positions where name = 'duty master'
SELECT @crier = [id] from dbo.positions where name = 'courier'
SELECT @w_mst = [id] from dbo.positions where name = 'workshop master'
SELECT @drivr = [id] from dbo.positions where name = 'driver'
SELECT @dspth = [id] from dbo.positions where name = 'transport dispatcher'
SELECT @admin = [id] from dbo.positions where name = 'administrator'


INSERT INTO dbo.jobs
([name], [price])
VALUES
('Диагностика', 500),
('Выезд мастера', 1000),
('Апгрейд', 5000),
('Сложный апгрейд', 10000),
('Ремонт', 5000),
('Срочный ремонт', 12500),
('Сложный ремонт', 20000)


DECLARE @diag as int, @driv as int, @upgr as int, @up_h as int, @repr as int, @re_u as int, @re_h as int
SELECT @diag = [id] from dbo.jobs where name = 'Диагностика'
SELECT @driv = [id] from dbo.jobs where name = 'Выезд мастера'
SELECT @upgr = [id] from dbo.jobs where name = 'Апгрейд'
SELECT @up_h = [id] from dbo.jobs where name = 'Сложный апгрейд'
SELECT @repr = [id] from dbo.jobs where name = 'Ремонт'
SELECT @re_u = [id] from dbo.jobs where name = 'Срочный ремонт'
SELECT @re_h = [id] from dbo.jobs where name = 'Сложный ремонт'


INSERT INTO dbo.positionjobs
([position_id], [job_id])
VALUES
(@d_mst, @diag),
(@d_mst, @re_u),

(@w_mst, @diag),
(@w_mst, @driv),
(@w_mst, @upgr),
(@w_mst, @up_h),
(@w_mst, @repr),
(@w_mst, @re_h),

(@drivr, @driv)


INSERT INTO dbo.blocks
([address], [type])
VALUES
('Москва, Арбатская 13, стр. 1', DEFAULT),
('Москва, 2-Бауманская 10', DEFAULT),
('Москва, Гурьянова 2, к. 4', 'workshop')


DECLARE @rec1 as int, @rec2 as int, @work as int
SELECT @rec1 = [id] from dbo.blocks where address = 'Москва, Арбатская 13, стр. 1'
SELECT @rec2 = [id] from dbo.blocks where address = 'Москва, 2-Бауманская 10'
SELECT @work = [id] from dbo.blocks where address = 'Москва, Гурьянова 2, к. 4'

INSERT INTO dbo.employees
([full_name], [login], [block_id], [position_id], [is_driver])
VALUES
('Семин Семен Семенович', 'receiver_1', @rec1, @recvr, DEFAULT),
('Иванов Иван Иванович', 'receiver_2', @rec2, @recvr, DEFAULT),

('Срочных Сроч Срочнович', 'd_master_1', @rec1, @d_mst, DEFAULT),
('Быстров Быстр Быстрович', 'd_master_2', @rec2, @d_mst, DEFAULT),

('Курьеров Кур Курович', 'courier_1', @rec1, @crier, DEFAULT),
('Доставков Достан Достанович', 'courier_2', @rec2, @crier, DEFAULT),

('Заводов Завод Заводович', 'w_master_1', @work, @w_mst, 1),
('Мастеров Мастер Мастерович', 'w_master_2', @work, @w_mst, 1),

('Гоночных Гонщик Гонщикович', 'driver', @work, @drivr, 1),

('Диспатчев Диспатч Диспатчевич', 'dispatcher', @work, @dspth, DEFAULT),

('Крутой Админ', 'admin', @work, @admin, DEFAULT)


INSERT INTO dbo.transports DEFAULT VALUES

INSERT INTO dbo.transports DEFAULT VALUES

INSERT INTO dbo.units
([serial_code], [type], [name], [price])
VALUES
(100, 'cpu', 'AMD Ryzen 7 5800x', 25000),
(101, 'cpu', 'AMD Ryzen 7 5800x', 25000),
(102, 'cpu', 'AMD Ryzen 7 5800x', 25000),
(103, 'cpu', 'AMD Ryzen 7 5800x', 25000),
(110, 'cpu', 'Intel Core i9 12900F', 64000),
(111, 'cpu', 'Intel Core i9 12900F', 64000),
(112, 'cpu', 'Intel Core i9 12900F', 64000),
(113, 'cpu', 'Intel Core i9 12900F', 64000),

(200, 'gpu', 'NVIDIA RTX 3090ti', 120000),
(201, 'gpu', 'NVIDIA RTX 3090ti', 120000),
(202, 'gpu', 'NVIDIA RTX 3090ti', 120000),
(210, 'gpu', 'NVIDIA GTX 1080', 30000),
(211, 'gpu', 'NVIDIA GTX 1080', 30000),

(300, 'ram', 'Kingston Fury 2x16 @3200', 22000),
(301, 'ram', 'Kingston Fury 2x16 @3200', 22000),
(302, 'ram', 'Kingston Fury 2x16 @3200', 22000)

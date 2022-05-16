use pc_upgrade
go

SELECT * FROM dbo.customers ORDER BY id

SELECT e.*, p.name as position 
FROM dbo.employees as e
JOIN dbo.positions as p
on p.id = e.position_id
ORDER BY e.id

SELECT * FROM dbo.positions ORDER BY id

SELECT * FROM dbo.jobs ORDER BY id

SELECT pj.position_id, p.name, pj.job_id, j.name
FROM dbo.positionjobs AS pj
JOIN dbo.positions AS p
ON p.id = pj.position_id 
JOIN dbo.jobs AS j
ON j.id = pj.job_id
ORDER BY pj.position_id

SELECT * FROM dbo.blocks ORDER BY id

SELECT * FROM dbo.transports ORDER BY id

SELECT o.*, c.full_name, e.full_name, j.name
FROM dbo.orders as o
JOIN dbo.customers as c
ON c.id = o.customer_id 
JOIN dbo.employees as e
ON e.id = o.employee_id 
JOIN dbo.jobs as j
ON j.id = o.job_id 
ORDER BY o.id

SELECT * FROM dbo.units ORDER BY id

SELECT u.pc_id, count(u.id) as units_count
FROM dbo.units as u
GROUP BY u.pc_id 
ORDER BY u.pc_id

SELECT *
FROM dbo.pcs
ORDER BY id

SELECT m.*, e.full_name as emplyee_name, b.address as block_address, b.type as block_type
FROM dbo.moves as m
JOIN dbo.employees as e
ON e.id = m.employee_id
JOIN dbo.blocks as b
ON b.id = m.block_id
ORDER BY m.id

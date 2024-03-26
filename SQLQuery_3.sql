SELECT *
FROM HomePro.Customers
--1
SELECT COUNT(*) as 'customercount', AVG(age) as 'average age'
FROM HomePro.Customers
--2
SELECT COUNT(*) as 'customercount', MAX(age)as oldest, MIN(age) as youngest
FROM HomePro.Customers
WHERE NewsLetter = 1
--info
select *
FROM HomePro.Schedules
--3
select COUNT(*)
FROM HomePro.Schedules
where JobType = 'Remodeling'
--4
select COUNT(*), jobtype
FROM HomePro.Schedules
group by JobType
--5
SELECT MAX(DateNeeded) as 'earlies date', MIN(DateNeeded) as 'latest date'
FROM HomePro.Schedules
--info
SELECT *
FROM HomePro.Quotes
--6
SELECT SUM(estimation)
FROM HomePro.Quotes
WHERE [Description] LIKE '%kitchen%'
--7
SELECT MIN(Estimation)
FROM HomePro.Quotes
WHERE Estimation > 500
--8
SELECT sum(estimation) as 'summary', AVG(Estimation) AS 'ave all sum'
FROM HomePro.Quotes
--info schedules
SELECT *
FROM HomePro.Customers a
JOIN HomePro.Schedules b
on a.CustomerId = b.CustomerId
--info quotes
SELECT *
FROM HomePro.Customers a
JOIN HomePro.Quotes b
on a.CustomerId = b.CustomerId
--info
SELECT *
FROM HomePro.Customers a
JOIN HomePro.Quotes b
on a.CustomerId = b.CustomerId
--'join 1
SELECT *
FROM HomePro.Customers a
JOIN HomePro.Schedules b
on a.CustomerId = b.CustomerId
WHERE DateNeeded > '2015-01-01'
--2
SELECT a.FirstName, a.LastName, a.Email, a.Phone, b.[Description], b.Estimation
FROM HomePro.Customers a
JOIN HomePro.Quotes b
on a.CustomerId = b.CustomerId
where Estimation > 500
--3
SELECT a.FirstName, a.LastName, a.Email, a.Phone, b.CustomerId, b.[Description], b.Estimation
FROM HomePro.Customers a
JOIN HomePro.Quotes b
on a.CustomerId = b.CustomerId
where a.AltPhone is NULL
--4
SELECT a.FirstName, a.LastName, a.Email, a.Phone, a.AltPhone, b.CustomerId, b.[Description], b.Estimation, c.DateNeeded
FROM HomePro.Customers a
JOIN HomePro.Quotes b
on a.CustomerId = b.CustomerId
JOIN HomePro.Schedules c
on b.CustomerId = c.CustomerId
where DateNeeded between '2016-01-01' and '2016-12-31' and a.AltPhone is NULL
--5
SELECT a.FirstName, a.LastName, a.Email, a.Phone, a.AltPhone, b.CustomerId, b.[Description], b.Estimation, c.CustomerId, c.DateNeeded
FROM HomePro.Customers a
LEFT JOIN HomePro.Quotes b
on a.CustomerId = b.CustomerId
left JOIN HomePro.Schedules c
on b.CustomerId = c.CustomerId
WHERE b.CustomerId is NULL

-- info
SELECT *
FROM HomePro.Customers
--6
SELECT *
FROM HomePro.Customers a
LEFT JOIN HomePro.Quotes b
on a.CustomerId = b.CustomerId
LEFT JOIN HomePro.Schedules c
ON b.CustomerId = c.CustomerId
WHERE b.CustomerId is NULL and c.CustomerId is NULL
--7
SELECT *
FROM HomePro.Customers a
JOIN HomePro.Schedules b
on a.CustomerId = b.CustomerId
left JOIN HomePro.Quotes c
on b.CustomerId = c.CustomerId
where c.CustomerId is NULL
--8
select * 
from HomePro.Customers a
JOIN HomePro.Schedules b
on a.CustomerId = b.CustomerId
JOIN HomePro.Quotes c
on b.CustomerId = c.CustomerId
where JobType like 'Remodeling' and Estimation < 5000 AND a.Age < 70
--9
SELECT SUM(Estimation) as 'sum of qoutes'
FROM HomePro.Customers a
JOIN HomePro.Quotes b
ON a.CustomerId = b.CustomerId
where NewsLetter = 1
--10
SELECT SUM(Estimation) as 'sum of qoutes'
FROM HomePro.Customers a
JOIN HomePro.Quotes b
ON a.CustomerId = b.CustomerId
join HomePro.Schedules c
on b.CustomerId = c.CustomerId
where DateNeeded < '2015-01-01'
--11
 SELECT COUNT(*) as 'number of clients', SUM(b.Estimation) as 'sum of qoutes', AVG(b.Estimation) AS 'Average'
FROM HomePro.Customers a
JOIN HomePro.Quotes b
ON a.CustomerId = b.CustomerId
join HomePro.Schedules c
on b.CustomerId = c.CustomerId
WHERE c.JobType = 'Remodeling' AND b.Estimation < 5000 AND a.age < 70
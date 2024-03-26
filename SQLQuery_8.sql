-- get all data from table
SELECT * from homepro.customers
-- 2 get all customer lastname = smith
SELECT * from homepro.customers
where LastName = 'smith'
--3 get customer letter m in last name
SELECT * from homepro.customers
where LastName like 'm%'
--4 get first last name state and age customer older than 30
SELECT FirstName, LastName, [State], Age 
from homepro.customers
where LastName like '%m%' and age > 30
--5 get first last name phone zipcode with 22201
SELECT FirstName, LastName,Phone, ZipCode 
from homepro.customers
where ZipCode = 22201
--6 get first last name phone email faxnumber customer withou faxe
SELECT FirstName, LastName, Phone, Email, FaxNumber 
from homepro.customers
where FaxNumber is null
--7 first name start with m
SELECT * from homepro.customers
where FirstName like 'm%'
-- 8 first last name subscribed to newsletter
SELECT * from homepro.customers
where NewsLetter = 1
--9 phone contain 703
SELECT * from homepro.customers
where Phone like '%703%'
--10 zipcode betweem 22200 and 22300
SELECT * from homepro.customers
where ZipCode BETWEEN 22200 and 222300
-- 11
SELECT * from homepro.Schedules
where DateNeeded > '2016-01-01'
--12 schedule in 2013
SELECT * from homepro.Schedules
where DateNeeded BETWEEN '2013-01-01' and '2013-12-01'
--13 jobtype remolding
SELECT * from homepro.Schedules
where JobType like 'remodeling'
--14 description with the word kitchen
SELECT * from homepro.Schedules
where [Description] like '%kitchen%'
--15 find all qoutes wuth kitchen
SELECT * from homepro.Quotes
where [Description] like '%kitchen%'
--16 qoute bigger than 500
SELECT * from homepro.Quotes
where Estimation > 500
--17 qoute where despcripton word discount
SELECT * from homepro.Quotes
where [Description] like '%discount%'
--lesson 2
  --1 calculate number of customer and average age
  SELECT AVG(Age), COUNT(*) 
  from homepro.Customers
  --2 count customer max and min age not subscribes
SELECT MAX(age), MIN(Age), COUNT(*) 
from homepro.Customers
where NewsLetter = 0
--3 calculate number of rows jobtype remodeling
SELECT COUNT(*) 
from homepro.Schedules
WHERE JobType = 'remodeling'
--4 count each jobtype
SELECT COUNT(JobType)
from homepro.Schedules
-- test
select JobType, Count(*) as JobCounts 
from HomePro.Schedules 
group by JobType
--5 find early and latest date for worked scheduled
SELECT MAX(DateNeeded), MIN(DateNeeded) 
from homepro.Schedules
--6 calculate sum of quotes for kitchen
SELECT SUM(Estimation) 
from homepro.Quotes
where [Description] like '%kitchen%'
--7 smallest qoute bigger than 500
SELECT MIN(Estimation) 
from homepro.Quotes
WHERE Estimation > 500
--8 sum and average value esitmated
SELECT SUM(Estimation), AVG(Estimation) 
from homepro.Quotes
-- join task
    -- 1 find customer with schedule work after 2015-01-01
    SELECT * from homepro.Customers c
    join HomePro.Schedules s
    on c.CustomerId = s.CustomerId
    where s.DateNeeded > '2015-01-01'
    -- 2 get first last email phone description estimation qoutes bigger than 500 order by estimation
    SELECT c.CustomerId, c.FirstName, c.LastName, c.Email, c.Phone, q.CustomerId, q.[Description], q.Estimation 
    from homepro.Customers c
    join HomePro.Quotes q
    on c.CustomerId = q.CustomerId
    where q.Estimation > '500'
    --3 get first last name email phone altphone qoute id description estimation who did not provide a altphone
     SELECT c.CustomerId, c.FirstName, c.LastName, c.Email, c.Phone, c.AltPhone, q.CustomerId, q.[Description], q.Estimation 
     from homepro.Customers c
    left join HomePro.Quotes Q
    on c.CustomerId = q.CustomerId
    WHERE c.AltPhone is NULL
    --4 get first last name email phone altphone quoteid description estimation
      SELECT c.CustomerId, c.FirstName, c.LastName, c.Email, c.Phone, c.AltPhone, q.ID, q.[Description], q.Estimation, s.CustomerId, s.DateNeeded
      from homepro.Customers c
    join HomePro.Quotes q
    on c.CustomerId = q.CustomerId
     JOIN HomePro.Schedules s
    on c.CustomerId = s.CustomerId
    where s.DateNeeded BETWEEN '2016-01-01' and '2016-12-31' and c.AltPhone is NULL
    ORDER BY Estimation

    select C.FirstName, C.LastName, C.Email, C.Phone, C.AltPhone, Q.ID as QuoteId, Q.Description, Q.Estimation
from HomePro.Customers C
	join HomePro.Quotes Q
on C.CustomerId = Q.CustomerId
	join HomePro.Schedules S
on C.CustomerId = S.CustomerId
where C.AltPhone is NULL and S.DateNeeded between '2016-01-01' and '2016-12-31'
order by Estimation

SELECT * FROM bank.clients c
JOIN bank.Accounts a
on c.ClientId = a.ClientId
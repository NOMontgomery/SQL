--2
CREATE PROCEDURE homepro.GetCustomerNoSchedule_Nyals
AS
BEGIN
    SELECT a.CustomerId, a.FirstName, a.LastName, a.Email, a.Phone, a.ZipCode, a.Age 
    FROM homepro.Customers a
    LEFT JOIN homepro.schedules b
    on a.CustomerId = b.CustomerId
    where JobType is NULL
END

EXEC HomePro.GetCustomerNoSchedule_Nyals
--3
create PROCEDURE HomePro.GetCustomerByAge_Nyals
    @Age INT
AS
BEGIN
    select CustomerId, FirstName, LastName, Email, Phone, ZipCode, Age
        FROM HomePro.Customers
            where Age > @age
end
EXEC HomePro.getcustomerbyage_nyals @Age = 0

EXEC HomePro.getcustomerbyage_nyals @Age = 20

EXEC HomePro.getcustomerbyage_nyals @Age = 200

--4
create PROCEDURE homepro.GetSchedulesByDate_Nyals
        @dateneeded DATE
AS
BEGIN
select a.CustomerId, a.FirstName, a.LastName, a.Email, a.Phone, a.ZipCode, a.Age, b.DateNeeded
from HomePro.Customers a
JOIN HomePro.Schedules b
on a.CustomerId = b.CustomerId
where DateNeeded > @dateneeded
end
EXEC HomePro.GetSchedulesByDate_Nyals @dateneeded = '2000-12-31'

EXEC HomePro.GetSchedulesByDate_Nyals @dateneeded = '2012-10-21'

EXEC HomePro.GetSchedulesByDate_Nyals @dateneeded = '2015-10-01'
--5
ALTER PROCEDURE HomePro.GetCustomerByAge_Nyals
    @Age INT
AS
BEGIN
    IF (@Age < 10 or @Age > 100)
    BEGIN
        RAISERROR ('the parameter Age is not valid', 16,10);
        RETURN
    END
    select CustomerId, FirstName, LastName, Email, Phone, ZipCode, Age
        FROM HomePro.Customers
            where Age > @age
end

EXEC HomePro.getcustomerbyage_nyals @Age = 0

EXEC HomePro.getcustomerbyage_nyals @Age = 20

EXEC HomePro.getcustomerbyage_nyals @Age = 200
--6
ALTER PROCEDURE homepro.GetSchedulesByDate_Nyals
        @dateneeded DATE
AS
BEGIN
    IF (@dateneeded < '2010-01-01' or @dateneeded > '2020-01-10')
    BEGIN
        RAISERROR ('the parameter date is not valid', 16,10);
        RETURN
        END
        select a.CustomerId, a.FirstName, a.LastName, a.Email, a.Phone, a.ZipCode, a.Age, b.DateNeeded
        from HomePro.Customers a
        JOIN HomePro.Schedules b
        on a.CustomerId = b.CustomerId
        where DateNeeded > @dateneeded
end
EXEC HomePro.GetSchedulesByDate_Nyals @dateneeded = '2000-12-31'

EXEC HomePro.GetSchedulesByDate_Nyals @dateneeded = '2012-10-21'

EXEC HomePro.GetSchedulesByDate_Nyals @dateneeded = '2015-10-01'
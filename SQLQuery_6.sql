--task1
SELECT MIN(Age), AVG(Age)
FROM Bank.Clients
--task2
SELECT AVG(age), COUNT(*)
FROM Bank.Clients
where [Type] = 'private'
--task3
SELECT FirstName, LastName, Age
FROM Bank.Clients
where Age =
           (SELECT MAX(Age)
FROM Bank.Clients
where [State] != 'NJ')
--task4
SELECT c.FirstName, c.LastName, a.Balance as biggest_balanced
FROM Bank.Accounts a
left join Bank.Clients c
ON a.ClientId = c.ClientId
WHERE a.Balance =
                 (SELECT MAX(Balance) as biggest_balance
FROM Bank.Accounts)
--task5
SELECT MAX(Balance)
FROM Bank.Accounts
--task6
SELECT ClientId, AVG(Balance), COUNT(*)
FROM Bank.Accounts
GROUP BY ClientId
--task7
select AVG(Amount) as transaction_count
from Bank.Transactions
--task8
select AccountNumFrom, Count(*), Avg(Amount) as AverageNumberOfTransactions
from Bank.Transactions
group by AccountNumFrom
--task join 1
SELECT c.ClientId, c.FirstName, c.LastName, c.Phone, c.[State], c.Age, a.ClientId, a.Balance, a.[Type]
from Bank.Accounts A
JOIN Bank.Clients C
on a.ClientId = c.ClientId
--task2
SELECT c.ClientId, c.FirstName, c.LastName, c.Phone, c.Email, c.[State], c.Age, a.ClientId, a.Balance, a.[Type]
FROM Bank.Accounts a
join Bank.Clients c
on a.ClientId = c.ClientId
where a.[Type] = 'checking' OR a.[Type] = 'credit'
--task3
select C.FirstName, C.LastName, C.Phone, C.Email, C.State, C.Age, Acr.Balance, Acr.Type, Ach.Balance, Ach.Type 
from Bank.Clients C
	join Bank.Accounts Acr
	on C.ClientId = Acr.ClientId 
	join Bank.Accounts Ach
	on C.ClientId = Ach.ClientId 
where Ach.Type = 'CHECKING' 
	and Acr.Type = 'CREDIT'
--task4
SELECT SUM(Balance) 
FROM Bank.Clients c
join Bank.Accounts a
on c.ClientId = a.ClientId
JOIN Bank.Transactions t
ON a.ClientId = t.TransactionId
where c.[Type] = 'private'
--test
select Sum(Balance) as 'Summary balance for private customers'
from Bank.Clients C
	join Bank.Accounts A
	on C.ClientId = A.ClientId
where C.Type = 'Private'
--task5
SELECT *
FROM Bank.Clients c
    join Bank.Transactions t
        on c.ClientId = t.TransactionId
          where [Status] = 'pending'
--task6
SELECT c.ClientId, c.FirstName, c.LastName, t.TransactionId, t.TransactionTime, t.[Status] 
from Bank.Clients c
JOIN Bank.Transactions t
on c.ClientId = t.TransactionId
where t.[Status] = 'rejected'
--task7
SELECT *
FROM Bank.Clients c
join Bank.Transactions t
on c.ClientId = t.TransactionId
where t.TransactionTime > '2015-12-31' and [Status] = 'rejected'
--task8
SELECT * 
from Bank.Transactions

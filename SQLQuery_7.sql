SELECT *
FROM bank.Clients c
inner join bank.Accounts a
on c.ClientId = a.ClientId
--test
SELECT *
FROM Bank.Clients A
join HomePro.Customers B
ON a.ClientId = b.CustomerId
where a.[State] = 'va'
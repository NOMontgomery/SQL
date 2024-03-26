DROP TABLE #temptable
CREATE TABLE #temptable
(Firstn VARCHAR(100), lastN VARCHAR(100), Age INT)
INSERT into #temptable
EXEC HomePro.GetAllCustomers

SELECT AVG(age) FROM #temptable
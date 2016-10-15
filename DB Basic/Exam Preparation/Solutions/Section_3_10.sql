SELECT c.CustomerID,
	c.FirstName,
	a.StartDate
FROM Customers AS c
INNER JOIN Accounts AS a
	ON a.CustomerID = c.CustomerID
WHERE a.StartDate = (SELECT MIN(a.StartDate) AS [MinStartDate]
					 FROM Accounts AS a)

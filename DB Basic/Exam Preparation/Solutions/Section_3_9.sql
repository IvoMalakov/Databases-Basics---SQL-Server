SELECT TOP 5 c.CustomerID,
	L.Amount
FROM Customers AS c
INNER JOIN Loans AS l
	ON l.CustomerID = c.CustomerID
WHERE l.Amount > (SELECT AVG(l.Amount) AS [AverageAmount]
				  FROM Customers AS c
				  INNER JOIN Loans AS l
					ON l.CustomerID = c.CustomerID
				  WHERE c.Gender LIKE 'M')
ORDER BY c.LastName ASC

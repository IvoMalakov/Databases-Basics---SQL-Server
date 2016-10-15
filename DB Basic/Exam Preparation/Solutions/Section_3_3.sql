SELECT c.CustomerID,
	c.FirstName,
	c.LastName,
	c.Gender,
	ct.CityName
FROM Customers AS c
INNER JOIN Cities as ct
	ON ct.CityID = c.CityID
WHERE (c.FirstName LIKE '%a'
	OR c.LastName LIKE 'Bu%')
	AND (LEN(ct.CityName) >= 8)
ORDER BY c.CustomerID ASC
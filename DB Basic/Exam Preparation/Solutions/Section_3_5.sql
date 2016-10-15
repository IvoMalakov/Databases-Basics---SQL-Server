SELECT c.CityName,
	b.Name,
	COUNT(e.EmployeeID) AS [EmployeesCount]
FROM Cities AS c
INNER JOIN Branches AS b
	ON b.CityID = c.CityID
INNER JOIN Employees AS e
	ON e.BranchID = b.BranchID
WHERE C.CityID NOT IN (4, 5)
GROUP BY c.CityName,
	b.Name
HAVING COUNT(e.EmployeeID) >= 3
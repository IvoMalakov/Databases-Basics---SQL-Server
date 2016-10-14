SELECT e.EmployeeID,
	e.FirstName,
	e.ManagerID,
	ep.FirstName AS [ManagerName]
FROM Employees AS e
INNER JOIN Employees AS ep
	ON e.ManagerID = ep.EmployeeID
WHERE e.ManagerID IN (3, 7)
USE SoftUni
GO

SELECT TOP 3 e.EmployeeID,
	e.FirstName
	FROM Employees AS e
	LEFT OUTER JOIN EmployeesProjects AS ep
		ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID is NULL
ORDER BY e.EmployeeID ASC
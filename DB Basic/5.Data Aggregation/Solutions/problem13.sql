USE SoftUni
GO

SELECT e.DepartmentID,
	MIN(e.Salary) AS [AverageSalary]
FROM Employees AS e
	WHERE e.DepartmentID IN (2, 5, 7)
		AND e.HireDate > '2000-01-01'
GROUP BY e.DepartmentID
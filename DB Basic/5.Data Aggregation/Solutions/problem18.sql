USE SoftUni
GO

SELECT TOP 10 e.FirstName,
	e.LastName,
	e.DepartmentID
FROM Employees AS e
JOIN (SELECT e.DepartmentID,
	AVG(e.Salary) AS [AverageSalary]
FROM Employees AS e
GROUP BY e.DepartmentID) AS avgSal
ON e.DepartmentID = avgSal.DepartmentID
WHERE e.Salary > avgSal.AverageSalary
ORDER BY e.DepartmentID ASC
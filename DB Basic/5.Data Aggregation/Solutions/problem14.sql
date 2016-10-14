SELECT *
	INTO RichEmployees
FROM Employees AS e
	WHERE e.Salary > 30000

DELETE FROM RichEmployees
	WHERE ManagerID = 42

UPDATE RichEmployees
	SET Salary += 5000
	WHERE DepartmentID = 1

SELECT r.DepartmentID,
	AVG(r.Salary) AS [AverageSalary]
FROM RichEmployees AS r
GROUP BY r.DepartmentID
USE SoftUni
GO

SELECT Emp.FirstName, Emp.LastName
FROM Employees AS Emp
WHERE SUBSTRING(Emp.FirstName, 1, 2) LIKE 'SA'
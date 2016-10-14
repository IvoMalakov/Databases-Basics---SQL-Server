SELECT Emp.FirstName, Emp.LastName
FROM Employees AS Emp
WHERE Emp.JobTitle NOT LIKE '%engineer%'
SELECT Emp.FirstName
FROM Employees AS Emp
WHERE (Emp.DepartmentID = 3 OR Emp.DepartmentID = 10)
	OR (Emp.HireDate BETWEEN 1995 AND 2005)
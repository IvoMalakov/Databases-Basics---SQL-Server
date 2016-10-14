SELECT Emp.FirstName + ' ' + Emp.MiddleName + ' ' + Emp.LastName AS [Full Name]
FROM Employees AS Emp
WHERE Emp.Salary = 25000
	OR Emp.Salary = 14000
	OR Emp.Salary = 12500
	OR Emp.Salary = 23600
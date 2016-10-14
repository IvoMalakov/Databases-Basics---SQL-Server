SELECT Emp.FirstName, Emp.LastName, Emp.Salary
FROM Employees AS Emp
WHERE Emp.Salary >= 50000
ORDER BY Emp.Salary DESC
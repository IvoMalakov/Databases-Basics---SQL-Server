UPDATE [Employees]
	SET Salary *= 1.12
FROM [Employees] as Emp
	JOIN [Departments] as D
	ON Emp.DepartmentId = D.DepartmentId
	WHERE D.Name IN ('Engineering', 'Tool Design', 'Marketing', 'Information Services')

SELECT Emp.Salary
FROM [Employees] AS Emp

--------------------------------For Judge to HERE---------------------------

UPDATE [Employees]
	SET Salary = Salary - (0.12 * Salary)
	WHERE DepartmentId IN (1, 2, 4, 11)
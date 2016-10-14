CREATE VIEW V_EmployeesHiredAfter2000 AS
	SELECT Emp.FirstName, Emp.LastName
	FROM Employees AS Emp
	WHERE Emp.HireDate >= '01-01-2001'
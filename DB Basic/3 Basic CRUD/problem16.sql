CREATE VIEW V_EmployeesSalaries AS
	SELECT Emp.FirstName, Emp.LastName, Emp.Salary
	FROM Employees AS Emp
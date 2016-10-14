CREATE VIEW V_EmployeeNameJobTitle AS
	SELECT CONCAT (Emp.FirstName, ' ', Emp.MiddleName, ' ', Emp.LastName) AS [Full Name],
		Emp.JobTitle
	FROM Employees AS Emp
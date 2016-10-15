CREATE TRIGGER tr_HireNewEmployee
ON [dbo].[Employees]
AFTER INSERT
AS
BEGIN
	UPDATE [dbo].[EmployeesLoans]
		SET EmployeeID = i.EmployeeID
	FROM [dbo].[EmployeesLoans] AS el
	INNER JOIN inserted AS i
		ON i.EmployeeID = el.EmployeeID + 1
END
CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber (@EmployeesMinSalary MONEY)
AS
BEGIN
	BEGIN TRAN
		SELECT e.FirstName, e.LastName
		FROM Employees AS e
		WHERE e.Salary >= @EmployeesMinSalary
		COMMIT
END

EXEC dbo.usp_GetEmployeesSalaryAboveNumber 40000
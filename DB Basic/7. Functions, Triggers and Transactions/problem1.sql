CREATE PROCEDURE usp_GetEmployeesSalaryAbove35000
AS
BEGIN
	DECLARE @employeeMaxSalary FLOAT(2) = 35000.00

	BEGIN TRAN
		SELECT e.FirstName, E.LastName
		FROM Employees AS e
		WHERE e.Salary > @employeeMaxSalary
		COMMIT
END

EXEC dbo.usp_GetEmployeesSalaryAbove35000
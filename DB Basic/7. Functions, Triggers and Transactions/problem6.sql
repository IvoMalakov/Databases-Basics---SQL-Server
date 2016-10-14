CREATE PROCEDURE usp_EmployeesBySalaryLevel (@SalaryLevel VARCHAR(50))
AS
BEGIN
	DECLARE @salaryLowLimit MONEY
	DECLARE @salaryAverageLimit MONEY

	SET @salaryLowLimit = 30000
	SET @salaryAverageLimit = 50000

	IF (@SalaryLevel LIKE 'Low')
	BEGIN
		SELECT e.FirstName, e.LastName
		FROM Employees AS e
		WHERE e.Salary < @salaryLowLimit
	END

	ELSE IF (@SalaryLevel LIKE 'Average')
	BEGIN
		SELECT e.FirstName, e.LastName
		FROM Employees AS e
		WHERE e.Salary BETWEEN @salaryLowLimit AND @salaryAverageLimit
	END

	ELSE
	BEGIN
		SELECT e.FirstName, e.LastName
		FROM Employees AS e
		WHERE e.Salary > @salaryAverageLimit
	END

END

EXEC dbo.usp_EmployeesBySalaryLevel High
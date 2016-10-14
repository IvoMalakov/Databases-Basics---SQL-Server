CREATE FUNCTION ufn_GetSalaryLevel (@Salary MONEY)
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @salaryLevel VARCHAR(50)
	DECLARE @salaryLowLimit MONEY
	DECLARE @salaryAverageLimit MONEY

	SET @salaryLowLimit = 30000
	SET @salaryAverageLimit = 50000

	IF (@Salary < @salaryLowLimit)
	BEGIN
		SET @salaryLevel = 'Low'
	END

	ELSE IF (@Salary BETWEEN @salaryLowLimit AND @salaryAverageLimit)
	BEGIN
		SET @salaryLevel = 'Average'
	END

	ELSE
	BEGIN
		SET @salaryLevel = 'High'
	END

	RETURN @salaryLevel
END
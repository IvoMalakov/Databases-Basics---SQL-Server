CREATE FUNCTION ufn_CalculateFutureValue (@Sum DECIMAL(20, 8), 
	@YearlyInterestRate DECIMAL(20, 8), 
	@NumberOfYears INT)
RETURNS DECIMAL(20, 4)
AS
BEGIN
	DECLARE @result DECIMAL(20, 4)

	SET @result = @Sum * (POWER((1 + @YearlyInterestRate), @NumberOfYears))

	RETURN @result
END

SELECT dbo.ufn_CalculateFutureValue(1500, 34, 5) AS [Output]
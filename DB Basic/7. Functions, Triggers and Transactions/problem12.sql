CREATE PROCEDURE usp_CalculateFutureValueAccount (@AccountId INT, @YearlyInterestRate DECIMAL(20, 8))
AS
BEGIN
	SELECT ah.Id AS [Account Id],
		ah.FirstName AS [First Name],
		ah.LastName AS [Last Name],
		a.Balance AS [Current Balance],
		dbo.ufn_CalculateFutureValue(a.Balance, @YearlyInterestRate, 5) AS [Balance in 5 years]
	FROM [dbo].[AccountHolders] AS ah
	INNER JOIN [dbo].[Accounts] AS a
		ON a.AccountHolderId = ah.Id
	WHERE ah.Id = @AccountId
END

EXEC dbo.usp_CalculateFutureValueAccount 1, 0.5
CREATE PROCEDURE usp_DepositMoney(@AccountId INT, @MoneyAmount DECIMAL(20, 8))
AS
BEGIN
	UPDATE [dbo].[Accounts]
		SET Balance += @MoneyAmount
	WHERE Id = @AccountId

	BEGIN TRAN
		COMMIT
END

EXEC dbo.usp_DepositMoney 1, 3000
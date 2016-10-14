CREATE PROCEDURE usp_WithdrawMoney(@AccountId INT, @MoneyAmount DECIMAL(20, 8))
AS
BEGIN
	DECLARE @moneyAfterWithDraw DECIMAL(20,8)

	BEGIN TRAN

		UPDATE [dbo].[Accounts]
			SET Balance -= @MoneyAmount
		WHERE Id = @AccountId

		SET @moneyAfterWithDraw = (SELECT a.Balance
							   FROM [dbo].[Accounts] AS a
							   WHERE a.Id = @AccountId)

		IF (@moneyAfterWithDraw < 0)
		BEGIN
			RAISERROR('This account has not enought money to withdraw', 16, 1)
			ROLLBACK
		END

		ELSE
		BEGIN
			COMMIT
		END
END

EXEC dbo.usp_WithdrawMoney 1, 4000

SELECT *
FROM Accounts AS a
WHERE a.Id = 1
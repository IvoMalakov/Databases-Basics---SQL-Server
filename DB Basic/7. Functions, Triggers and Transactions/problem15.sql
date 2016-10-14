CREATE PROCEDURE usp_MoneyTransfer (@AccounIdFrom INT, @AccountIdInto INT, @MoneyForTransfer DECIMAL(20,8))
AS
BEGIN
	DECLARE @numberOfAllAccounts INT;
	DECLARE @moneyInAccountFrom DECIMAL(20,8);

	SET @numberOfAllAccounts = (SELECT COUNT(*)
								FROM [dbo].[Accounts] AS a)

	SET @moneyInAccountFrom = (SELECT a.Balance
							   FROM [dbo].[Accounts] AS a
							   WHERE a.Id = @AccounIdFrom)

	BEGIN TRAN
		IF ((@AccounIdFrom NOT BETWEEN 1 AND @numberOfAllAccounts)
			OR (@AccountIdInto NOT BETWEEN 1 AND @numberOfAllAccounts)
			OR (@MoneyForTransfer < 0)
			OR (@MoneyForTransfer > @moneyInAccountFrom))
		BEGIN
			RAISERROR('This operation can not be done', 16, 1)
			ROLLBACK
		END

		ELSE
		BEGIN
			COMMIT
		END
END

EXEC dbo.usp_MoneyTransfer 1, 2, 100
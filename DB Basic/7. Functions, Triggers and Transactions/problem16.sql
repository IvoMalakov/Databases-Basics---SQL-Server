CREATE TRIGGER tr_LogsAfterRecords
	ON [dbo].[Accounts]
INSTEAD OF UPDATE
AS
BEGIN
	IF OBJECT_ID('[Logs]') IS NULL
	BEGIN
		CREATE TABLE Logs
		(
			Id INT IDENTITY PRIMARY KEY,
			AccountId INT,
			OldSum DECIMAL(20, 8),
			NewSum DECIMAL(20,8),
			CONSTRAINT FK_Logs_Account FOREIGN KEY (AccountId)
				REFERENCES Accounts(Id)
		)
	END

	DECLARE @AccountId INT = (SELECT i.Id
							  FROM inserted AS i)

	DECLARE @OldSum DECIMAL(20,8) = (SELECT a.Balance
									FROM Accounts As a
									WHERE a.Id = @AccountId)

	DECLARE @NewSum DECIMAL(20,8) = (SELECT i.Balance
									 FROM inserted AS i)

	INSERT INTO Logs (AccountId, OldSum, NewSum)
		VALUES (@AccountId, @OldSum, @NewSum)

	UPDATE [dbo].[Accounts]
		SET Balance = @NewSum
	WHERE Id = @AccountId
	
	PRINT 'AFTER INSERT TRIGGER FIRED'
END

UPDATE [dbo].[Accounts]
	SET Balance = 10000
WHERE Id = 1
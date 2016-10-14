CREATE TRIGGER tr_NotificatioEmail
	ON [dbo].[Logs]
AFTER INSERT
AS
BEGIN
	IF OBJECT_ID('[NotificationEmails]') IS NULL
	BEGIN
		CREATE TABLE NotificationEmails
		(
			Id INT IDENTITY PRIMARY KEY,
			Recipient INT,
			Subject VARCHAR(50),
			Body VARCHAR(50),
			CONSTRAINT FK_NotificationEmails_Accounts FOREIGN KEY (Recipient)
				REFERENCES [dbo].[Accounts] (Id)
		)
	END

	DECLARE @AccountId INT;
	DECLARE @Subject VARCHAR(50);
	DECLARE @Body VARCHAR(50);
	DECLARE @OldSum DECIMAL(20,2);
	DECLARE @NewSum DECIMAL(20,2);

	SET @AccountId = (SELECT i.AccountId
					 FROM inserted AS i)

	SET @OldSum = (SELECT l.OldSum
				   FROM [dbo].[Logs] AS l)

	SET @NewSum = (SELECT l.NewSum
				   FROM [dbo].[Logs] AS l)

	SET @Subject = 'Balance changed for account: ' + CAST(@AccountId AS VARCHAR(50))

	SET @Body = 'On ' 
					  + CAST(GETDATE() AS VARCHAR(50)) 
					  + ' your balance was changed from ' 
					  + CAST(@OldSum AS VARCHAR(50))
					  + ' to '
					  + CAST(@NewSum AS VARCHAR(50))
					  + '.'
	
	INSERT INTO NotificationEmails (Recipient, Subject, Body)
		VALUES(@AccountId, @Subject, @Body)

PRINT 'After insert trigged fired for the table [dbo].[Logs]'
END

UPDATE [dbo].[Accounts]
	SET Balance = 15000
WHERE Id = 1
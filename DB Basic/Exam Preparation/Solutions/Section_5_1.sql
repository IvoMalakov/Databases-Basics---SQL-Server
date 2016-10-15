CREATE TRIGGER tr_LogDeletedAccounts
ON [dbo].[Accounts]
INSTEAD OF DELETE
AS
BEGIN
	IF OBJECT_ID('[AccountLogs]') IS NULL
	BEGIN
		CREATE TABLE AccountLogs
		(
			AccountID INT PRIMARY KEY,
			AccountNumber CHAR(12),
			StartDate DATE,
			CustomerID INT,
			CONSTRAINT FK_AccountLogs_Customers FOREIGN KEY (CustomerID)
				REFERENCES Customers (CustomerID)
		)
	END

	DECLARE @DeletedAccountID INT = (SELECT d.AccountID
									 FROM deleted AS d)

	DECLARE @DeletedAccountNumber CHAR(12) = (SELECT d.AccountNumber
									 FROM deleted AS d)

	DECLARE @DeletedStartDate DATE = (SELECT d.StartDate
									 FROM deleted AS d)

	DECLARE @DeletedCustomerID INT = (SELECT d.CustomerID
									 FROM deleted AS d)

	INSERT INTO AccountLogs (AccountID, AccountNumber, StartDate, CustomerID)
		VALUES (@DeletedAccountID, @DeletedAccountNumber, @DeletedStartDate, @DeletedCustomerID)

	DELETE FROM [dbo].[EmployeesAccounts]
		WHERE AccountID = @DeletedAccountID

	DELETE FROM [dbo].[Accounts]
		WHERE AccountID = @DeletedAccountID
END

SELECT *
FROM [dbo].[Accounts]
WHERE CustomerID = 4

DELETE FROM [dbo].[Accounts]
	WHERE CustomerID = 4
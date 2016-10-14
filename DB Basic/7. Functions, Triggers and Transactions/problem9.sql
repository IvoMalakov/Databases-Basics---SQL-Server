CREATE DATABASE Bank2
GO

USE Bank2
GO

CREATE TABLE AccountHolders
(
	Id INT PRIMARY KEY,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	SSN INT
)

CREATE TABLE Accounts
(
	Id INT PRIMARY KEY,
	AccountHolderId INT,
	Balance Money,
	CONSTRAINT FK_Accounts_AccountHolders FOREIGN KEY (AccountHolderId)
		REFERENCES AccountHolders(Id)
)

INSERT INTO AccountHolders(Id, FirstName, LastName, SSN)
	VALUES (1, 'Susan', 'Cane', 000),
		(2, 'Kim', 'Novac', 111),
		(3, 'Jimmy', 'Henderson', 222)

------------------FOR JUDGE FROM HERE--------------------

CREATE PROCEDURE usp_GetHoldersFullName
AS
BEGIN
	SELECT a.FirstName + ' ' + a.LastName AS [Full Name]
	FROM AccountHolders AS a
END

------------------------TO HERE------------------------

EXEC dbo.usp_GetHoldersFullName
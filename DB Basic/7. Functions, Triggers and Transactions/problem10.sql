SELECT *
FROM AccountHolders

INSERT INTO Accounts (Id, AccountHolderId, Balance)
	VALUES (1, 3, 1000),
		(2, 1, 2000),
		(3, 2, 1000000)

-------------FOR JUDGE FROM HERE--------------------------

CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan (@MoneyLowLimit MONEY)
AS
BEGIN
	SELECT ah.FirstName,
		ah.LastName
	FROM AccountHolders AS ah
	INNER JOIN Accounts AS a
		ON a.AccountHolderId = ah.Id
	GROUP BY ah.FirstName,
		ah.LastName
	HAVING SUM(a.Balance) > @MoneyLowLimit
END

---------------------------TO HERE---------------------------

EXEC dbo.usp_GetHoldersWithBalanceHigherThan 1500
USE Gringotts
GO

SELECT DepositGroup
	FROM (SELECT w.DepositGroup,
		AVG(w.MagicWandSize) AS [AverageWandSize]
			FROM WizzardDeposits AS w
		GROUP BY w.DepositGroup) AS avgm
	WHERE AverageWandSize = (SELECT MIN(AverageWandSize) MinAverageWantSize
	FROM (SELECT w.DepositGroup,
		AVG(w.MagicWandSize) AS [AverageWandSize]
			FROM WizzardDeposits AS w
		GROUP BY w.DepositGroup) AS av)
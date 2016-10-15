INSERT INTO DepositTypes (DepositTypeID, Name)
	VALUES (1, 'Time Deposit'),
		(2, 'Call Deposit'),
		(3, 'Free Deposit')

INSERT INTO Deposits (Amount, StartDate, EndDate, DepositTypeID, CustomerID)
	SELECT CASE
				WHEN c.DateOfBirth > '1980-01-01' THEN 1000
				ELSE 1500
	       END
		   +
		   CASE
				WHEN c.Gender LIKE 'M' THEN 100
				ELSE 200
		   END AS Amount,
		   GETDATE() AS StartDate,
		   NULL AS EndDate,
		   CASE
				WHEN c.CustomerID > 15 THEN 3
				ELSE
					CASE
						WHEN c.CustomerID % 2 = 0 THEN 2
						ELSE 1
					END
		   END AS DepositTypeID,
		   c.CustomerID
	FROM Customers AS c
	WHERE c.CustomerID < 20


INSERT INTO EmployeesDeposits (EmployeeID, DepositID)
	VALUES (15, 4),
		(20, 15),
		(8, 7),
		(4, 8),
		(3, 13),
		(3, 8),
		(4, 10),
		(10, 1),
		(13, 4),
		(14, 9)
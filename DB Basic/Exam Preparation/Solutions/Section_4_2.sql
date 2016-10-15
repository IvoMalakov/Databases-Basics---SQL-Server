CREATE PROCEDURE usp_CustomersWithUnexpiredLoans (@CustomerID INT)
AS
BEGIN
	SELECT c.CustomerID,
		c.FirstName,
		l.LoanID
	FROM Customers AS c
	INNER JOIN Loans AS l
		ON l.CustomerID = c.CustomerID
	WHERE c.CustomerID = @CustomerID
		AND l.ExpirationDate IS NULL
END

EXEC dbo.usp_CustomersWithUnexpiredLoans 1
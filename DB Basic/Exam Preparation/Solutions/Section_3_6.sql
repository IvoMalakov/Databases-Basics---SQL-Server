SELECT SUM(l.Amount) AS [TotalAmountSum],
	MAX(l.Interest) AS [MaxInterest],
	MIN(e.Salary) AS [MinEmployeeSalary]
FROM Employees AS e
INNER JOIN EmployeesLoans AS el
	ON el.EmployeeID = e.EmployeeID
INNER JOIN Loans AS l
	ON l.LoanID = el.LoanID
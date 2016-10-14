CREATE TABLE People
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50),
	Birthdate DATE
)

INSERT INTO People (Name, Birthdate)
	VALUES ('Victor', '2000-12-07 00:00:00.000'),
		('Steven', '1992-09-10 00:00:00.000'),
		('Stephen', '1910-09-19 00:00:00.000'),
		('John', '2010-01-06 00:00:00.000')

SELECT P.Name,
	DATEDIFF(YEAR, P.Birthdate, GETDATE()) AS [Age in Years],
	DATEDIFF(MONTH, P.Birthdate, GETDATE()) AS [Age in Months],
	DATEDIFF(DAY, P.Birthdate, GETDATE()) AS [Age in Days],
	DATEDIFF(MINUTE, P.Birthdate, GETDATE()) AS [Age in Minutes]
	FROM People AS P
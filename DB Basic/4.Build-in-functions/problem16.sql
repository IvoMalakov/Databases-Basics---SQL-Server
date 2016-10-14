USE Test
GO

INSERT INTO Orders (ProductName, OrderDate)
	VALUES ('Butter', '2016-09-19 00:00:00.000'),
		('Milk', '2016-09-30 00:00:00.000'),
		('Cheese', '2016-09-04 00:00:00.000'),
		('Bread', '2015-12-20 00:00:00.000'),
		('Tomatoes', '2015-12-30 00:00:00.000')

---------------------For Judge:------------------------------------

SELECT Ord.ProductName,
	Ord.OrderDate,
	DATEADD(DAY, 3, Ord.OrderDate) AS [Pay Due],
	DATEADD(MONTH, 1, Ord.OrderDate) AS [Deliver Due]
FROM Orders AS Ord
SELECT C.CountryName, 
	C.CountryCode,
	CASE
		WHEN C.CurrencyCode LIKE 'EUR' THEN 'Euro'
		ELSE 'Not Euro'
	END AS [Currency]
FROM [Countries] AS C
ORDER BY C.CountryName ASC
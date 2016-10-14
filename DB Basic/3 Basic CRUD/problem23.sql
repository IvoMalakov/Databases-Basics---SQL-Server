SELECT TOP 30 C.CountryName, C.Population
FROM [Countries] AS C
	JOIN [Continents] AS Con
	ON C.ContinentCode = Con.ContinentCode
WHERE Con.ContinentName LIKE 'Europe'

ORDER BY C.Population DESC,
	C.CountryName ASC
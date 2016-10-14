SELECT G.Name,
	CASE 
		WHEN (DATEPART(HOUR, G.Start) >= 0)
			AND (DATEPART(HOUR, G.Start) < 12) THEN 'Morning'
		WHEN (DATEPART(HOUR, G.Start) >= 12)
			AND (DATEPART(HOUR, G.Start) < 18) THEN 'Afternoon'
		ELSE 'Evening'
	END AS [Part of the Day],
	CASE
		WHEN G.Duration <= 3 THEN 'Extra Short'
		WHEN G.Duration BETWEEN 4 AND 6 THEN 'Short'
		WHEN G.Duration IS NULL THEN 'Extra Long'
		ELSE 'Long'
	END AS [Duration]
FROM Games AS G
ORDER BY G.Name ASC,
	[Duration],
	[Part of the Day]
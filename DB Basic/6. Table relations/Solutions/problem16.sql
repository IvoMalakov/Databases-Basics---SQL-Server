SELECT c.CountryCode,
	COUNT(m.MountainRange) AS [MountainRanges]
FROM Countries AS c
INNER JOIN MountainsCountries AS mc
	ON c.CountryCode LIKE mc.CountryCode
LEFT OUTER JOIN Mountains AS m
	ON mc.MountainId = m.Id
WHERE c.CountryName IN ('Bulgaria', 'United States', 'Russia')
GROUP BY c.CountryCode
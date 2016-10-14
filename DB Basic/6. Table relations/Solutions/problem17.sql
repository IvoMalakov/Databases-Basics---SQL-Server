SELECT TOP 5 c.CountryName,
	R.RiverName
FROM Countries AS c
INNER JOIN Continents AS con
	ON c.ContinentCode = con.ContinentCode
LEFT OUTER JOIN CountriesRivers AS cr
	ON c.CountryCode LIKE cr.CountryCode
LEFT OUTER JOIN Rivers as r
	ON cr.RiverId = r.Id
WHERE con.ContinentName LIKE 'Africa'
ORDER BY c.CountryName ASC

SELECT TOP 5 c.CountryName,
	MAX(p.Elevation) AS [HigestPeakElevation],
	MAX(r.Length) AS [LongestRiverLength]
FROM Countries AS c
LEFT OUTER JOIN MountainsCountries AS mc
	ON c.CountryCode LIKE mc.CountryCode
LEFT OUTER JOIN Mountains AS m
	ON mc.MountainId = m.Id
LEFT OUTER JOIN Peaks AS p
	ON m.Id = p.MountainId
LEFT OUTER JOIN CountriesRivers AS cr
	ON c.CountryCode LIKE cr.CountryCode
LEFT OUTER JOIN Rivers AS r
	ON cr.RiverId = r.Id
GROUP BY c.CountryName
ORDER BY HigestPeakElevation DESC,
	LongestRiverLength DESC
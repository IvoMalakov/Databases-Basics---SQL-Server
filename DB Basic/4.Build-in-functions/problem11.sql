SELECT P.PeakName, 
	R.RiverName,
	LOWER(CONCAT(P.PeakName, SUBSTRING(R.RiverName, 2, LEN(R.RiverName)))) AS [Mix]
FROM Peaks AS P, Rivers AS R
WHERE LEFT(R.RiverName, 1) LIKE RIGHT(P.PeakName, 1)
ORDER BY Mix
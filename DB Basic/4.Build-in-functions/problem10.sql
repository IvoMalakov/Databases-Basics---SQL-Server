USE Geography
GO

SELECT C.CountryName, C.IsoCode
FROM Countries AS C
WHERE C.CountryName LIKE '%A%A%A%'
ORDER BY C.IsoCode ASC
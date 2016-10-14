SELECT U.Username, U.IpAddress
FROM Users AS U
WHERE U.IpAddress LIKE '___.1%.%.___'
ORDER BY U.Username ASC
SELECT U.Username, 
	RIGHT(U.Email, LEN(U.Email) - CHARINDEX('@', U.Email)) AS [Email Provider]
FROM Users AS U
ORDER BY [Email Provider] ASC,
	U.Username ASC
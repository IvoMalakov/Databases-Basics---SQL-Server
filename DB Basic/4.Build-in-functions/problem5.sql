SELECT T.Name
FROM Towns AS T
WHERE (LEN(T.Name) = 5)
	OR (LEN(T.Name) = 6)
ORDER BY T.Name ASC
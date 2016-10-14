CREATE PROCEDURE usp_GetTownsStartingWith (@FirstLetter VARCHAR(50))
AS
BEGIN
	BEGIN TRAN
		SELECT t.Name
		FROM Towns AS t
		WHERE LOWER(t.Name) LIKE LOWER(@FirstLetter + '%')
	COMMIT
END

EXEC dbo.usp_GetTownsStartingWith 'b'
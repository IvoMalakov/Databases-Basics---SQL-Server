CREATE FUNCTION ufn_IsWordComprised (@SetOfLetters VARCHAR(50), @Word VARCHAR(50))
RETURNS BIT
AS
BEGIN
	DECLARE @result BIT
	DECLARE @startIndex INT = 1
	DECLARE @foundedChars INT = 0

	WHILE (@startIndex <= LEN(@Word))
	BEGIN
		DECLARE @currentChar VARCHAR(1) = SUBSTRING(@Word, @startIndex, 1)

		IF (CHARINDEX(@currentChar, @SetOfLetters) > 0)
		BEGIN
			SET @foundedChars += 1
		END

		SET @startIndex += 1
	END

	IF (LEN(@Word) = @foundedChars)
	BEGIN
		SET @result = 1
	END

	ELSE
	BEGIN
		SET @result = 0
	END

	RETURN @result
END
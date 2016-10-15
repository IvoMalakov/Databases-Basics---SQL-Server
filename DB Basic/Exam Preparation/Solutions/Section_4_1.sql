CREATE FUNCTION udf_ConcatString (@FirstString VARCHAR(MAX), @SecondString VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @ResultString VARCHAR(MAX);
	DECLARE @FirstStringReversed VARCHAR(MAX);
	DECLARE @SecondStringReversed VARCHAR(MAX);

	SET @FirstStringReversed = REVERSE(@FirstString);
	SET @SecondStringReversed = REVERSE(@SecondString);
	SET @ResultString = CONCAT(@FirstStringReversed, @SecondStringReversed)

	RETURN @ResultString
END
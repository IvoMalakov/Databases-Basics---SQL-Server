USE Minions
GO

CREATE TABLE People
(
	Id INT IDENTITY PRIMARY KEY CHECK (Id < 2147483648),
	Name VARCHAR(200) NOT NULL,
	Picture VARBINARY,
	Height FLOAT(2),
	Weight FLOAT(2),
	Gender CHAR(1) NOT NULL CHECK (Gender LIKE 'm' or Gender LIKE 'f'),
	Birthdate DATE NOT NULL,
	Biography VARCHAR(MAX)
)

SET IDENTITY_INSERT People ON

INSERT INTO People (Id, Name, Height, Weight, Gender, Birthdate, Biography)
	VALUES ('1', 'Pesho', '2.55', '200', 'm', '1980-12-05', 'Pesho e kaput')

INSERT INTO People (Id, Name, Height, Weight, Gender, Birthdate, Biography)
	VALUES ('2', 'Gosho', '1.78', '45.566', 'm', '1980-12-06', 'Gosho e kaput')

INSERT INTO People (Id, Name, Height, Weight, Gender, Birthdate, Biography)
	VALUES ('3', 'Tosho', '1.9055', '100.555', 'm', '1980-12-07', 'Tosho e kaput')

INSERT INTO People (Id, Name, Height, Weight, Gender, Birthdate, Biography)
	VALUES ('4', 'Galia', '1.655', '30', 'f', '1980-12-08', 'Neznam')

INSERT INTO People (Id, Name, Height, Weight, Gender, Birthdate, Biography)
	VALUES ('5', 'Fikret', '2.55', '200', 'f', '1980-12-09', 'NEEEE')

USE Minions
GO

CREATE TABLE Users
(
	Id INT IDENTITY PRIMARY KEY CHECK (Id < 9223372036854775808),
	Username NVARCHAR(30) NOT NULL UNIQUE,
	Password NVARCHAR(26) NOT NULL,
	ProfilePicture VARBINARY(MAX),
	LastLoginTime DATETIME,
	IsDeleted BIT NOT NULL
)

SET IDENTITY_INSERT Users ON


INSERT INTO Users (Id, Username, Password, LastLoginTime, IsDeleted)
	VALUES ('1', 'pesho', 'parola1', '2016-08-26 20:30:00', 'true')

INSERT INTO Users (Id, Username, Password, LastLoginTime, IsDeleted)
	VALUES ('2', 'gosho',  'parola2', '2016-08-27 20:30:00', 'true')

INSERT INTO Users (Id, Username, Password, LastLoginTime, IsDeleted)
	VALUES ('3', 'tosho', 'parola3', '2016-08-28 20:30:00', 'false')

INSERT INTO Users (Id, Username, Password, LastLoginTime, IsDeleted)
	VALUES ('4', 'sasho', '1234', '2016-08-29 20:30:00', 'false')

INSERT INTO Users (Id, Username, Password, LastLoginTime, IsDeleted)
	VALUES ('5', 'penka', '4321', '2016-08-30 20:30:00', 'false')
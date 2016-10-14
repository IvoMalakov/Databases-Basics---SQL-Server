CREATE DATABASE Movies

USE Movies
GO

CREATE TABLE Directors
(
	Id INT IDENTITY PRIMARY KEY,
	DirectorName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

SET IDENTITY_INSERT Directors ON

INSERT INTO Directors (Id, DirectorName, Notes)
	VALUES ('1', 'Boiko Borisov', 'Dolo Boiko')

INSERT INTO Directors (Id, DirectorName, Notes)
	VALUES ('2', 'Sergei Stanishev', 'Dolo Stanishev')

INSERT INTO Directors (Id, DirectorName, Notes)
	VALUES ('3', 'Rosen Plevneliev', 'Obesete Roskata')

INSERT INTO Directors (Id, DirectorName, Notes)
	VALUES ('4', 'Cecka Cacheva', 'Izgonete Klasnata')

INSERT INTO Directors (Id, DirectorName, Notes)
	VALUES ('5', 'Mustafa Karadaia', 'Mangal Nauche Se Da Govorish Na Bulgarski')

SET IDENTITY_INSERT Directors OFF

CREATE TABLE Genres
(
	Id INT IDENTITY PRIMARY KEY,
	GenreName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

SET IDENTITY_INSERT Genres ON

INSERT INTO Genres(Id, GenreName, Notes)
	VALUES ('1', 'Podkupen Diktor', 'Dolo Boiko')

INSERT INTO Genres (Id, GenreName, Notes)
	VALUES ('2', 'Obraten', 'Dolo Stanishev')

INSERT INTO Genres (Id, GenreName, Notes)
	VALUES ('3', 'Oste po obraten', 'Obesete Roskata')

INSERT INTO Genres (Id, GenreName, Notes)
	VALUES ('4', 'Ochilata babka', 'Izgonete Klasnata')

INSERT INTO Genres (Id, GenreName, Notes)
	VALUES ('5', 'turski manaf', 'Mangal Nauche Se Da Govorish Na Bulgarski')

SET IDENTITY_INSERT Genres OFF

CREATE TABLE Categories
(
	Id INT IDENTITY PRIMARY KEY,
	CategoryName NVARCHAR(50) NOT NULL,
	Notes NVARCHAR(MAX)
)

SET IDENTITY_INSERT Categories ON

INSERT INTO Categories(Id, CategoryName, Notes)
	VALUES ('1', 'psiho', 'Dolo Boiko')

INSERT INTO Categories (Id, CategoryName, Notes)
	VALUES ('2', 'porno', 'Dolo Stanishev')

INSERT INTO Categories (Id, CategoryName, Notes)
	VALUES ('3', 'porno za obratni', 'Obesete Roskata')

INSERT INTO Categories (Id, CategoryName, Notes)
	VALUES ('4', 'retro', 'Izgonete Klasnata')

INSERT INTO Categories (Id, CategoryName, Notes)
	VALUES ('5', 'chuzdestrano musolmansko', 'Mangal Nauche Se Da Govorish Na Bulgarski')

SET IDENTITY_INSERT Categories OFF

CREATE TABLE Movies
(
	Id INT IDENTITY PRIMARY KEY,
	Title NVARCHAR(50),
	DirectorId INT FOREIGN KEY REFERENCES Directors(Id),
	CopyrightYear INT,
	Length TIME,
	GenreId INT FOREIGN KEY REFERENCES Genres(Id),
	CategoryId INT FOREIGN KEY REFERENCES Categories(Id),
	Notes NVARCHAR(MAX)
)

SET IDENTITY_INSERT Movies ON

INSERT INTO Movies(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Notes)
	VALUES ('1', 'Boiko Lud', '1', '2001', NULL, '1', '1', 'Dolo Boiko')

INSERT INTO Movies(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Notes)
	VALUES ('2', 'Stanishev gey', '2', '2005', NULL, '2', '2', 'Dolo Stanishev')

INSERT INTO Movies(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Notes)
	VALUES ('3', 'Roskata po golqm gei', '3', '2011', NULL, '3', '3', 'Dolo Roskata')

INSERT INTO Movies(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Notes)
	VALUES ('4', 'Klasnata vun', '4', '2009', NULL, '4', '4', 'Dolo Klasnata')

INSERT INTO Movies(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Notes)
	VALUES ('5', 'Smurt za turskiq manaf', '5', '2016', NULL, '5', '5', 'Obesente manafa')

SET IDENTITY_INSERT Movies OFF
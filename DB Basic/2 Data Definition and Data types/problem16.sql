CREATE DATABASE SoftUni

USE SoftUni
GO

CREATE TABLE Towns
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
)

CREATE TABLE Adresses
(
	Id INT IDENTITY PRIMARY KEY,
	AdressesText NVARCHAR(MAX) NOT NULL,
	TownId INT FOREIGN KEY REFERENCES Towns(Id)
)

CREATE TABLE Departments
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL
)

CREATE TABLE Employees
(
	Id INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	MiddleName NVARCHAR(50),
	LastName NVARCHAR(50) NOT NULL,
	JobTitle NVARCHAR(50) NOT NULL,
	DepartamentId INT FOREIGN KEY REFERENCES Departments(Id),
	HireDate DATE,
	Salary FLOAT(2) NOT NULL,
	AdressId INT FOREIGN KEY REFERENCES Adresses(Id)
)
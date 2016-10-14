CREATE DATABASE CarRental

USE CarRental
GO

CREATE TABLE Categories
(
	Id INT IDENTITY PRIMARY KEY,
	Category NVARCHAR(50) NOT NULL,
	DailyRate FLOAT(2) NOT NULL,
	WeeklyRate FLOAT(2) NOT NULL,
	MonthlyRate FLOAT(2) NOT NULL,
	WeekendRate FLOAT(2) NOT NULL
)

SET IDENTITY_INSERT Categories ON

INSERT INTO Categories (Id, Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
	VALUES ('1', 'Pikap', '20.55' , '130.00', '2000.45', '22.33') 

INSERT INTO Categories (Id, Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
	VALUES ('2', 'Hadchback', '19.55' , '120.00', '1800.45', '21.33')

INSERT INTO Categories (Id, Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
	VALUES ('3', 'Stara ruska kola', '5.22' , '20', '150', '7.00')

SET IDENTITY_INSERT Categories OFF

CREATE TABLE Cars
(
	Id INT IDENTITY PRIMARY KEY,
	PlatenNumber NVARCHAR(50) NOT NULL,
	Make NVARCHAR(50),
	Model NVARCHAR(50) NOT NULL,
	CarYear INT NOT NULL,
	CategoryID INT FOREIGN KEY REFERENCES Categories(Id),
	Doors INT,
	Picture VARBINARY,
	Condition NVARCHAR(50),
	Aviable NVARCHAR(3) NOT NULL CHECK(Aviable LIKE 'YES' OR Aviable LIKE 'NO')
)

SET IDENTITY_INSERT Cars ON

INSERT INTO Cars (Id, PlatenNumber, Model, CarYear, CategoryID, Aviable)
	VALUES ('1', 'CH 0000 KA', 'Toyota' , '2000', '1', 'YES')

INSERT INTO Cars (Id, PlatenNumber, Model, CarYear, CategoryID, Aviable)
	VALUES ('2', 'CA 1234 AA', 'Reno' , '2005', '2', 'NO')

INSERT INTO Cars (Id, PlatenNumber, Model, CarYear, CategoryID, Aviable)
	VALUES ('3', 'B 54321 AK', 'Moskvich' , '1980', '3', 'NO')

SET IDENTITY_INSERT Cars OFF

CREATE TABLE Employees
(
	Id INT IDENTITY PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	Title NVARCHAR(50),
	Notes NVARCHAR(MAX)
)

SET IDENTITY_INSERT Employees ON

INSERT INTO Employees (Id, FirstName, LastName)
	VALUES ('1', 'Ivan', 'Ivanov')

INSERT INTO Employees (Id, FirstName, LastName)
	VALUES ('2', 'Georgi', 'Georgiev')

INSERT INTO Employees (Id, FirstName, LastName)
	VALUES ('3', 'Penka', 'Penkova')

SET IDENTITY_INSERT Employees OFF

CREATE TABLE Customers
(
	Id INT IDENTITY PRIMARY KEY,
	DriveLicenceNumber INT NOT NULL,
	FullName NVARCHAR(200) NOT NULL,
	Adress NVARCHAR(200),
	City NVARCHAR(50),
	ZIPCode INT,
	Notes NVARCHAR(MAX)
)

SET IDENTITY_INSERT Customers ON

INSERT INTO Customers (Id, DriveLicenceNumber, FullName)
	VALUES ('1', '123456', 'Ivan Ivanov Penkov')

INSERT INTO Customers (Id, DriveLicenceNumber, FullName)
	VALUES ('2', '654321', 'Georgi Georgiev Georgiev')

INSERT INTO Customers (Id, DriveLicenceNumber, FullName)
	VALUES ('3', '000000', 'Penka Peneva Dimova')

SET IDENTITY_INSERT Customers OFF

CREATE TABLE RentalOrders
(
	Id INT IDENTITY PRIMARY KEY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id),
	CarId INT FOREIGN KEY REFERENCES Cars(Id),
	CarCondition NVARCHAR(50) NOT NULL,
	TankLevel FLOAT(2) NOT NULL,
	KilometrageStart INT,
	KilometrageEnd INT,
	TotalKilometrage INT NOT NULL,
	StartDate DATE,
	EndDate DATE,
	TotalDays INT NOT NULL,
	RateApplied FLOAT(2),
	TaxRate FLOAT(2),
	OrderStatus NVARCHAR(50),
	Notes NVARCHAR(MAX)
)

SET IDENTITY_INSERT RentalOrders ON

INSERT INTO RentalOrders (Id, EmployeeId, CustomerId, CarId, CarCondition, TankLevel, TotalKilometrage, TotalDays)
	VALUES ('1', '1', '1', '1', 'Good', '20.55', '168345', '2')

INSERT INTO RentalOrders (Id, EmployeeId, CustomerId, CarId, CarCondition, TankLevel, TotalKilometrage, TotalDays)
	VALUES ('2', '2', '2', '2', 'Not so good', '30.00', '170000', '3')

INSERT INTO RentalOrders (Id, EmployeeId, CustomerId, CarId, CarCondition, TankLevel, TotalKilometrage, TotalDays)
	VALUES ('3', '3', '3', '3', 'Very Bad', '10.05', '1357239', '1')

SET IDENTITY_INSERT RentalOrders OFF
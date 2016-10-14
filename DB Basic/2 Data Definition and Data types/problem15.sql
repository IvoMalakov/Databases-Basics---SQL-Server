CREATE DATABASE Hotel

USE Hotel
GO

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
	AccountNumber INT PRIMARY KEY,
	FirstName NVARCHAR(50) NOT NULL,
	LastName NVARCHAR(50) NOT NULL,
	PhoneNumber NVARCHAR(10) NOT NULL CHECK (LEN(PhoneNumber) = 10),
	EmergancyName NVARCHAR(50) NOT NULL,
	EmergancyPhone NVARCHAR(10) NOT NULL CHECK (LEN(EmergancyPhone) = 10),
	Notes NVARCHAR(MAX)
)

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergancyName, EmergancyPhone)
	VALUES ('123456', 'Pencho', 'Kunchev', '+123456789', 'Ivan Ivanov', '+987654321')

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergancyName, EmergancyPhone)
	VALUES ('654321', 'Kuncho', 'Penchev', '+000000000', 'Pencho Kunchev', '+123456789')

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergancyName, EmergancyPhone)
	VALUES ('000000', 'Mariika', 'Obstova', '+696969696', 'Ivan Ivanov', '+987654321')

CREATE TABLE RoomStatus
(
	RoomStatus NVARCHAR(50) PRIMARY KEY,
	Notes NVARCHAR(MAX)
)

INSERT INTO RoomStatus (RoomStatus, Notes)
	VALUES ('Aviable', 'This room is aviable')

INSERT INTO RoomStatus (RoomStatus, Notes)
	VALUES ('Not aviable', 'This room is not aviable')

INSERT INTO RoomStatus (RoomStatus, Notes)
	VALUES ('Taken', NULL)

CREATE TABLE RoomTypes
(
	RoomType NVARCHAR(50) PRIMARY KEY,
	Notes NVARCHAR(MAX)
)

INSERT INTO RoomTypes (RoomType, Notes)
	VALUES ('with 2 beds', '2 beds in this room')

INSERT INTO RoomTypes (RoomType, Notes)
	VALUES ('with 1 bed', '1 bed in this room')

INSERT INTO RoomTypes (RoomType, Notes)
	VALUES ('without any beds', NULL)

CREATE TABLE BedTypes
(
	BedType NVARCHAR(50) PRIMARY KEY,
	Notes NVARCHAR(MAX)
)

INSERT INTO BedTypes (BedType, Notes)
	VALUES ('single bed', 'Very good room')

INSERT INTO BedTypes (BedType, Notes)
	VALUES ('double bed', 'I dont know')

INSERT INTO BedTypes (BedType, Notes)
	VALUES ('on the floar', NULL)

CREATE TABLE Rooms
(
	RoomNumber INT PRIMARY KEY,
	RoomType NVARCHAR(50) FOREIGN KEY REFERENCES RoomTypes(RoomType),
	BedType NVARCHAR(50) FOREIGN KEY REFERENCES BedTypes(BedType),
	Rate FLOAT(2) NOT NULL,
	RoomStatus NVARCHAR(50) FOREIGN KEY REFERENCES RoomStatus(RoomStatus),
	Notes NVARCHAR(MAX)
)

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
	VALUES ('100', 'with 2 beds', 'single bed', '100.00', 'Aviable', NULL)

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
	VALUES ('202', 'with 1 bed', 'double bed', '110.00', 'Not aviable', NULL)

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
	VALUES ('303', 'without any beds', 'on the floar', '10.00', 'Taken', 'You must sleep on the floar')

CREATE TABLE Payments
(
	Id INT IDENTITY PRIMARY KEY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id),
	PaymentDate DATE NOT NULL,
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber),
	FirstDateOccupied DATE,
	LastDateOccupied DATE,
	TotalDays INT NOT NULL,
	AmountCharged FLOAT(2),
	TaxRate FLOAT(2),
	TaxAmount FLOAT(2),
	PaymentTotal FLOAT(2) NOT NULL,
	Notes NVARCHAR(MAX)
)

SET IDENTITY_INSERT Payments ON

INSERT INTO Payments (Id, EmployeeId, PaymentDate, AccountNumber, TotalDays, PaymentTotal)
	VALUES ('1', '2', '2016-10-01', '123456', '3', '1200.00')

INSERT INTO Payments (Id, EmployeeId, PaymentDate, AccountNumber, TotalDays, PaymentTotal)
	VALUES ('2', '1', '2016-10-03', '654321', '2', '800.00')

INSERT INTO Payments (Id, EmployeeId, PaymentDate, AccountNumber, TotalDays, PaymentTotal)
	VALUES ('3', '3', '2016-09-29', '123456', '1', '400.00')

SET IDENTITY_INSERT Payments OFF

CREATE TABLE Occupancies
(
	Id INT IDENTITY PRIMARY KEY,
	EmployeeId INT FOREIGN KEY REFERENCES Employees(Id) NOT NULL,
	DateOccupied DATE,
	AccountNumber INT FOREIGN KEY REFERENCES Customers(AccountNumber) NOT NULL,
	RoomNumber INT FOREIGN KEY REFERENCES Rooms(RoomNumber) NOT NULL,
	RateApplied FLOAT(2),
	PhoneCharge FLOAT(2),
	Notes NVARCHAR(MAX)
)

SET IDENTITY_INSERT Occupancies ON

INSERT INTO Occupancies (Id, EmployeeId, AccountNumber, RoomNumber)
	VALUES ('1', '3', '000000', '100')

INSERT INTO Occupancies (Id, EmployeeId, AccountNumber, RoomNumber)
	VALUES ('2', '2', '123456', '202')

INSERT INTO Occupancies (Id, EmployeeId, AccountNumber, RoomNumber)
	VALUES ('3', '1', '654321', '303')

SET IDENTITY_INSERT Occupancies OFF
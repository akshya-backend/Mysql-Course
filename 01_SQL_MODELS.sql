-- 📦 Create and Use Database
CREATE DATABASE IF NOT EXISTS HotelDB;
USE HotelDB;

-- 🔄 Drop Tables for Clean Re-Run
DROP TABLE IF EXISTS ServiceUsage, Service, Payment, Booking, Room, RoomType, Staff, Customer, Hotel;

-- 🏨 Hotel Table
CREATE TABLE IF NOT EXISTS Hotel (
    HotelID INT PRIMARY KEY AUTO_INCREMENT,
    HotelName VARCHAR(100),
    Location VARCHAR(100),
    Rating DECIMAL(2,1)
);

-- 🛏 Room Type Table
CREATE TABLE IF NOT EXISTS RoomType (
    RoomTypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR(50),
    Description TEXT,
    BasePrice DECIMAL(10,2)
);

-- 🛌 Room Table
CREATE TABLE IF NOT EXISTS Room (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    HotelID INT,
    RoomNumber VARCHAR(10),
    RoomTypeID INT,
    Status ENUM('Available', 'Booked', 'Maintenance') DEFAULT 'Available',
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID),
    FOREIGN KEY (RoomTypeID) REFERENCES RoomType(RoomTypeID)
);

-- 👤 Customer Table
CREATE TABLE IF NOT EXISTS Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone BIGINT,
    Nationality VARCHAR(50),
    IDProof VARCHAR(100)
);

-- 📅 Booking Table
CREATE TABLE IF NOT EXISTS Booking (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    RoomID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    BookingDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    NumberOfGuests INT,
    Status ENUM('Booked', 'CheckedIn', 'CheckedOut', 'Cancelled') DEFAULT 'Booked',
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID)
);

-- 💵 Payment Table
CREATE TABLE IF NOT EXISTS Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10,2),
    Method ENUM('Cash', 'Card', 'UPI', 'NetBanking'),
    Status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);

-- 🧍 Staff Table
CREATE TABLE IF NOT EXISTS Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100),
    Role VARCHAR(50),
    Phone BIGINT,
    Salary DECIMAL(10,2),
    JoinDate DATE,
    HotelID INT,
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

-- 🧺 Services Table
CREATE TABLE IF NOT EXISTS Service (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(100),
    Price DECIMAL(10,2)
);

-- 📋 Service Usage Table
CREATE TABLE IF NOT EXISTS ServiceUsage (
    UsageID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ServiceID INT,
    DateUsed DATE,
    Quantity INT DEFAULT 1,
    TotalCost DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ServiceID) REFERENCES Service(ServiceID)
);

-- ✅ Insert Dummy Data

-- 🔽 Hotel
INSERT INTO Hotel (HotelName, Location, Rating) VALUES
('The Grand Royal', 'Mumbai', 4.5),
('Ocean Breeze', 'Goa', 4.0),
('Hilltop View', 'Manali', 4.7);

-- 🔽 Room Type
INSERT INTO RoomType (TypeName, Description, BasePrice) VALUES
('Single', 'Single bed with basic amenities', 1500.00),
('Double', 'Double bed with TV and Wi-Fi', 2500.00),
('Suite', 'Luxury suite with ocean view', 5000.00);

-- 🔽 Room
INSERT INTO Room (HotelID, RoomNumber, RoomTypeID, Status) VALUES
(1, '101', 1, 'Available'),
(1, '102', 2, 'Booked'),
(2, '201', 3, 'Maintenance'),
(3, '301', 2, 'Available'),
(3, '302', 1, 'Booked');

-- 🔽 Customer
INSERT INTO Customer (FullName, Email, Phone, Nationality, IDProof) VALUES
('Akshay Kumar', 'akshay@gmail.com', 9876543210, 'Indian', 'AADHAR123'),
('Priya Sharma', 'priya@gmail.com', 9876500001, 'Indian', 'PAN567'),
('John Doe', 'john@example.com', 8765432190, 'American', 'PASSPORT890');

-- 🔽 Booking
INSERT INTO Booking (CustomerID, RoomID, CheckInDate, CheckOutDate, NumberOfGuests, Status) VALUES
(1, 2, '2025-08-01', '2025-08-05', 2, 'Booked'),
(2, 5, '2025-08-02', '2025-08-04', 1, 'CheckedIn'),
(3, 4, '2025-07-28', '2025-08-02', 3, 'CheckedOut');

-- 🔽 Payment
INSERT INTO Payment (BookingID, Amount, Method, Status) VALUES
(1, 10000.00, 'Card', 'Completed'),
(2, 5000.00, 'UPI', 'Pending'),
(3, 7500.00, 'NetBanking', 'Completed');

-- 🔽 Staff
INSERT INTO Staff (FullName, Role, Phone, Salary, JoinDate, HotelID) VALUES
('Ravi Verma', 'Manager', 9999988888, 50000.00, '2022-01-15', 1),
('Anita Rao', 'Receptionist', 9999977777, 30000.00, '2023-05-10', 2),
('David Smith', 'Housekeeping', 9999966666, 25000.00, '2024-03-20', 3);

-- 🔽 Service
INSERT INTO Service (ServiceName, Price) VALUES
('Laundry', 300.00),
('Room Service', 500.00),
('Spa', 1500.00);

-- 🔽 Service Usage
INSERT INTO ServiceUsage (CustomerID, ServiceID, DateUsed, Quantity, TotalCost) 
SELECT c.CustomerID, s.ServiceID, '2025-08-02', 2, s.Price * 2
FROM Customer c, Service s
WHERE c.FullName = 'Akshay Kumar' AND s.ServiceName = 'Laundry'
UNION ALL
SELECT c.CustomerID, s.ServiceID, '2025-08-03', 1, s.Price
FROM Customer c, Service s
WHERE c.FullName = 'Priya Sharma' AND s.ServiceName = 'Room Service'
UNION ALL
SELECT c.CustomerID, s.ServiceID, '2025-07-30', 1, s.Price
FROM Customer c, Service s
WHERE c.FullName = 'John Doe' AND s.ServiceName = 'Spa'
UNION ALL
SELECT c.CustomerID, s.ServiceID, '2025-07-30', 1, s.Price
FROM Customer c, Service s
WHERE c.FullName = 'John Doe' AND s.ServiceName = 'Spa';
 USE HotelDB;
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
INSERT INTO ServiceUsage (CustomerID, ServiceID, DateUsed, Quantity, TotalCost) VALUES
(1, 1, '2025-08-02', 2, 600.00),
(2, 2, '2025-08-03', 1, 500.00),
(3, 3, '2025-07-30', 1, 1500.00);

-- 📘 Use the HotelDB database
USE HotelDB;

-- 🧾 1. Total payment amount collected per payment method
SELECT Method, SUM(Amount) AS TotalAmount
FROM Payment
GROUP BY Method;

-- 🧾 2. Number of bookings per status
SELECT Status, COUNT(*) AS TotalBookings
FROM Booking
GROUP BY Status;

-- 🧾 3. Total services used by each customer
SELECT c.FullName, COUNT(su.UsageID) AS TotalServicesUsed
FROM ServiceUsage su
JOIN Customer c ON su.CustomerID = c.CustomerID
GROUP BY c.FullName;

-- 🧾 4. Total revenue generated from each service
SELECT s.ServiceName, SUM(su.TotalCost) AS Revenue
FROM ServiceUsage su
JOIN Service s ON su.ServiceID = s.ServiceID
GROUP BY s.ServiceName;

-- 🧾 5. Number of rooms per status in each hotel
SELECT h.HotelName, r.Status, COUNT(*) AS RoomCount
FROM Room r
JOIN Hotel h ON r.HotelID = h.HotelID
GROUP BY h.HotelName, r.Status;

-- 🧾 6. Average salary by staff role
SELECT Role, AVG(Salary) AS AvgSalary
FROM Staff
GROUP BY Role;

-- 🧾 7. Total payment collected per hotel
SELECT h.HotelName, SUM(p.Amount) AS TotalCollected
FROM Payment p
JOIN Booking b ON p.BookingID = b.BookingID
JOIN Room r ON b.RoomID = r.RoomID
JOIN Hotel h ON r.HotelID = h.HotelID
GROUP BY h.HotelName;

-- 🧾 8. Total guests served by hotel
SELECT h.HotelName, SUM(b.NumberOfGuests) AS TotalGuests
FROM Booking b
JOIN Room r ON b.RoomID = r.RoomID
JOIN Hotel h ON r.HotelID = h.HotelID
GROUP BY h.HotelName;

-- 🧾 9. Count of bookings per customer
SELECT c.FullName, COUNT(*) AS TotalBookings
FROM Booking b
JOIN Customer c ON b.CustomerID = c.CustomerID
GROUP BY c.FullName;

-- 🧾 10. Average room base price by room type
SELECT TypeName, AVG(BasePrice) AS AvgPrice
FROM RoomType
GROUP BY TypeName;

-- 📘 PURPOSE: Demonstrate usage of AS, BETWEEN, and IN in HotelDB

-- 📌 Use the HotelDB
USE HotelDB;

-- 🔍 1. Using AS (Alias for columns and tables)
-- ➕ Gives a temporary name to columns or tables for better readability

SELECT 
    FullName AS CustomerName,
    Nationality AS Country,
    Email AS ContactEmail
FROM Customer;

-- 🔍 2. Using BETWEEN (for range queries)
-- ➕ Shows customers who have bookings with check-in dates between 2025-08-01 and 2025-08-05

SELECT 
    BookingID AS ID,
    CustomerID AS CustID,
    CheckInDate,
    CheckOutDate
FROM Booking
WHERE CheckInDate BETWEEN '2025-08-01' AND '2025-08-05';

-- 🔍 3. Using IN (to match values in a list)
-- ➕ Shows all staff working in hotel IDs 1 and 3

SELECT 
    FullName AS StaffName,
    Role,
    HotelID
FROM Staff
WHERE HotelID IN (1, 3);

-- 🔍 BONUS: Combine IN + AS + BETWEEN in a single query
-- ➕ Shows bookings made by customers whose IDs are in (1, 3) and between a certain date range

SELECT 
    BookingID AS BookingCode,
    CustomerID AS Customer,
    CheckInDate AS StartDate,
    CheckOutDate AS EndDate,
    Status
FROM Booking
WHERE 
    CustomerID IN (1, 3)
    AND CheckInDate BETWEEN '2025-07-28' AND '2025-08-02';

-- ====================================================
-- MySQL ANY and ALL Operator Examples for Hotel Management System
-- ====================================================

USE HotelDB;

-- ====================================================
-- Explanation:
-- ANY compares a value to each value returned by a subquery.
-- The condition is true if it is true for ANY (at least one) value.
-- 
-- ALL compares a value to every value returned by a subquery.
-- The condition is true only if it is true for ALL values.
-- ====================================================

-- ====================================================
-- Example 1: Find bookings where NumberOfGuests is greater than ANY booking in the hotel
-- i.e., bookings that have more guests than at least one other booking
-- ====================================================
SELECT BookingID, NumberOfGuests
FROM Booking
WHERE NumberOfGuests > ANY (
    SELECT NumberOfGuests FROM Booking WHERE HotelID IS NOT NULL
);

-- Note: Since Booking does not have HotelID directly,
-- we need to join to Room to get HotelID

-- Improved Example:
SELECT b.BookingID, b.NumberOfGuests, r.HotelID
FROM Booking b
JOIN Room r ON b.RoomID = r.RoomID
WHERE b.NumberOfGuests > ANY (
    SELECT NumberOfGuests
    FROM Booking b2
    JOIN Room r2 ON b2.RoomID = r2.RoomID
    WHERE r2.HotelID = r.HotelID
);

-- This finds bookings where the NumberOfGuests is greater than at least one other booking in the same hotel.

-- ====================================================
-- Example 2: Find rooms where BasePrice is less than ALL room types' BasePrice
-- i.e., rooms with the lowest price compared to all room types
-- ====================================================
SELECT RoomID, RoomNumber, rt.BasePrice
FROM Room r
JOIN RoomType rt ON r.RoomTypeID = rt.RoomTypeID
WHERE rt.BasePrice < ALL (
    SELECT BasePrice FROM RoomType
);

-- This will likely return no rows since no price is less than all prices.
-- Let's find rooms priced equal to the minimum BasePrice instead:

SELECT RoomID, RoomNumber, rt.BasePrice
FROM Room r
JOIN RoomType rt ON r.RoomTypeID = rt.RoomTypeID
WHERE rt.BasePrice = (
    SELECT MIN(BasePrice) FROM RoomType
);

-- ====================================================
-- Example 3: Find payments where Amount is greater than ALL payments with 'Pending' status
-- i.e., payments larger than every pending payment
-- ====================================================
SELECT PaymentID, Amount, Status
FROM Payment
WHERE Amount > ALL (
    SELECT Amount FROM Payment WHERE Status = 'Pending'
);

-- ====================================================
-- Example 4: Find customers who have made bookings with NumberOfGuests >= ALL their bookings
-- i.e., bookings that have the maximum guests count for that customer
-- ====================================================
SELECT b.CustomerID, b.BookingID, b.NumberOfGuests
FROM Booking b
WHERE b.NumberOfGuests >= ALL (
    SELECT NumberOfGuests FROM Booking WHERE CustomerID = b.CustomerID
);

-- ====================================================
-- Example 5: Find staff whose Salary is less than ANY staff in hotel 1
-- ====================================================
SELECT StaffID, FullName, Salary, HotelID
FROM Staff
WHERE Salary < ANY (
    SELECT Salary FROM Staff WHERE HotelID = 1
);

-- ====================================================
-- Notes:
-- - ANY and SOME are synonyms in MySQL.
-- - Use ANY when you want to check if a value compares true with any of the returned subquery values.
-- - Use ALL when the comparison must hold true for every subquery value.
-- ====================================================

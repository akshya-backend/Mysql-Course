/* 

🔍 Definitions:

✅ AND:
   - Used to combine multiple conditions.
   - All conditions must be TRUE for the row to be returned.

✅ OR:
   - Returns rows if at least one condition is TRUE.

✅ NOT:
   - Reverses a condition, returning rows where the condition is FALSE.

📌 These operators are essential for filtering data in SELECT queries.
===========================================================
*/

USE HotelDB;

-- 1️⃣ Customers who are Indian AND their phone number starts with 9876
SELECT * FROM Customer
WHERE Nationality = 'Indian' AND Phone LIKE '9876%';

-- 2️⃣ Rooms that are either Available OR under Maintenance
SELECT * FROM Room
WHERE Status = 'Available' OR Status = 'Maintenance';

-- 3️⃣ Staff who are NOT in HotelID = 2
SELECT * FROM Staff
WHERE NOT HotelID = 2;

-- 4️⃣ Payments that are Completed AND made using Card
SELECT * FROM Payment
WHERE Status = 'Completed' AND Method = 'Card';

-- 5️⃣ Rooms that are NOT Booked
SELECT * FROM Room
WHERE NOT Status = 'Booked';

-- 6️⃣ Bookings where status is CheckedIn AND number of guests is greater than 1
SELECT * FROM Booking
WHERE Status = 'CheckedIn' AND NumberOfGuests > 1;

-- 7️⃣ Customers who are NOT Indian
SELECT * FROM Customer
WHERE NOT Nationality = 'Indian';

-- 8️⃣ Staff who joined before 2024 OR have a salary greater than 40000
SELECT * FROM Staff
WHERE JoinDate < '2024-01-01' OR Salary > 40000;

-- 9️⃣ Bookings where NOT status is Cancelled AND guest count is more than 2
SELECT * FROM Booking
WHERE NOT Status = 'Cancelled' AND NumberOfGuests > 2;

-- 🔟 Payments where amount is more than 7000 OR status is NOT Completed
SELECT * FROM Payment
WHERE Amount > 7000 OR NOT Status = 'Completed';

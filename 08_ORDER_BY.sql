/* 

🔍 ORDER BY:

✅ Purpose:
   - Used to **sort query results** by one or more columns.

✅ Default:
   - ASCENDING (ASC) order by default.
   - Use `DESC` for DESCENDING order.

📌 You can sort by columns not selected, or use multiple columns.
📌 ORDER BY should be the **last clause** in a SELECT statement.

===========================================================
*/

USE HotelDB;

-- 1️⃣ List all rooms ordered by RoomNumber (A-Z)
SELECT * FROM Room
ORDER BY RoomNumber ASC;

-- 2️⃣ List all hotels sorted by rating (highest to lowest)
SELECT * FROM Hotel
ORDER BY Rating DESC;

-- 3️⃣ Show all customers sorted by name in alphabetical order
SELECT * FROM Customer
ORDER BY FullName ASC;

-- 4️⃣ List staff ordered by salary (highest first)
SELECT * FROM Staff
ORDER BY Salary DESC;

-- 5️⃣ List bookings ordered by CheckInDate (earliest first)
SELECT * FROM Booking
ORDER BY CheckInDate ASC;

-- 6️⃣ List payments ordered by amount (lowest first)
SELECT * FROM Payment
ORDER BY Amount ASC;

-- 7️⃣ List room types sorted by BasePrice descending
SELECT * FROM RoomType
ORDER BY BasePrice DESC;

-- 8️⃣ Show bookings sorted first by Status (A-Z), then by CheckOutDate
SELECT * FROM Booking
ORDER BY Status ASC, CheckOutDate DESC;

-- 9️⃣ List staff sorted by JoinDate (oldest staff first)
SELECT * FROM Staff
ORDER BY JoinDate ASC;

-- 🔟 Show services ordered by price (cheapest to most expensive)
SELECT * FROM Service
ORDER BY Price ASC;

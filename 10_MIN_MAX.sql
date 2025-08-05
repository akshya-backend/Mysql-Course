/* 
===========================================================
📂 File: 06_min_max_examples.sql
📘 Topic: SQL Aggregate Functions - MIN() and MAX()
🛠  Purpose: Retrieve smallest or largest values from a column
===========================================================

🔍 Definitions:

✅ MIN():
   - Returns the **smallest (minimum)** value in a column.
   - Commonly used with numeric, date, or text columns.

✅ MAX():
   - Returns the **largest (maximum)** value in a column.

✅ Syntax:
   SELECT MIN(column) FROM table;
   SELECT MAX(column) FROM table;

📌 These are **aggregate functions**, meaning they return a **single value**.
📌 Use with `GROUP BY` to apply MIN/MAX per group (not covered here).

===========================================================
*/

USE HotelDB;

-- 1️⃣ Get the cheapest service price
SELECT MIN(Price) AS CheapestService FROM Service;

-- 2️⃣ Get the most expensive service price
SELECT MAX(Price) AS CostliestService FROM Service;

-- 3️⃣ Find the highest hotel rating
SELECT MAX(Rating) AS BestHotelRating FROM Hotel;

-- 4️⃣ Find the earliest staff join date
SELECT MIN(JoinDate) AS FirstJoined FROM Staff;

-- 5️⃣ Find the latest check-in date from bookings
SELECT MAX(CheckInDate) AS LatestCheckIn FROM Booking;

-- 6️⃣ Get the minimum base price among room types
SELECT MIN(BasePrice) AS LowestRoomRate FROM RoomType;

-- 7️⃣ Find the maximum number of guests in any booking
SELECT MAX(NumberOfGuests) AS MaxGuests FROM Booking;

-- 8️⃣ Find the lowest and highest customer phone numbers (for validation)
SELECT MIN(Phone) AS SmallestPhone, MAX(Phone) AS LargestPhone FROM Customer;

-- 9️⃣ Get the max salary in Staff table
SELECT MAX(Salary) AS HighestSalary FROM Staff;

-- 🔟 Get the booking with the earliest check-out date
SELECT * FROM Booking
WHERE CheckOutDate = (SELECT MIN(CheckOutDate) FROM Booking);

-- Bonus: Get the hotel with the best rating
SELECT * FROM Hotel
WHERE Rating = (SELECT MAX(Rating) FROM Hotel);
SELECT HotelID, MIN(Price) AS CheapestPrice
FROM Service
GROUP BY HotelID;

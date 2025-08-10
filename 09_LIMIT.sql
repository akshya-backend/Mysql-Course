/* 
===========================================================
📂 File: 05_limit_examples.sql
📘 Topic: SQL LIMIT Clause
🛠  Purpose: Restrict the number of rows returned in a query
===========================================================

🔍 LIMIT:

✅ What is LIMIT?
   - LIMIT is used to **restrict the number of rows** returned by a `SELECT` query.

✅ Why use LIMIT?
   - It helps optimize performance and quickly preview data (e.g., in large tables).
   - Often used with `ORDER BY` for pagination or top results.

✅ Syntax:
   SELECT columns FROM table
   [WHERE condition]
   ORDER BY column
   LIMIT number;

📌 Note:
   - LIMIT always appears at the **end** of the query.
   - Supported in MySQL, PostgreSQL, SQLite, etc.
   - For MS SQL Server, use `TOP` or `FETCH NEXT`.

===========================================================
*/

USE HotelDB;

-- 1️⃣ Get only the first 5 customers (arbitrary order)
SELECT * FROM Customer
LIMIT 5;

-- 2️⃣ Show top 3 most expensive rooms (using RoomType price)
SELECT * FROM RoomType
ORDER BY BasePrice DESC
LIMIT 3;

-- 3️⃣ Show the 2 most recently joined staff
SELECT * FROM Staff
ORDER BY JoinDate DESC
LIMIT 2;

-- 4️⃣ Show top 1 highest rated hotel
SELECT * FROM Hotel
ORDER BY Rating DESC
LIMIT 1;

-- 5️⃣ Show 2 cheapest services
SELECT * FROM Service
ORDER BY Price ASC
LIMIT 2;

-- 6️⃣ Get only 1 latest booking
SELECT * FROM Booking
ORDER BY BookingDate DESC
LIMIT 1;

-- 7️⃣ Show 4 rooms that are currently available
SELECT * FROM Room
WHERE Status = 'Available'
LIMIT 4;

-- 8️⃣ Show any 5 payments made (no sorting)
SELECT * FROM Payment
LIMIT 5;

-- 9️⃣ Show 3 customers whose nationality is Indian
SELECT * FROM Customer
WHERE Nationality = 'Indian'
LIMIT 3;

-- 🔟 Show top 3 highest salaries in staff
SELECT * FROM Staff
ORDER BY Salary DESC
LIMIT 3;

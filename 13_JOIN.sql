-- 🔑 What is a JOIN in SQL?
-- A JOIN combines rows from two or more tables based on a related column between them. This is like saying:

-- “Hey, combine this row from table A with matching rows from table B where their keys match.”

-- 🔧 Why JOIN is used?
-- To:

-- Access data across multiple tables

-- Avoid redundancy (normalization)

-- Combine related info (e.g., customers + orders)

-- 🧠 Understanding with Tables (Visual)
-- Imagine you have two tables:

-- 👤 Table: students
-- student_id	name
-- 1	Akshay
-- 2	Aditi
-- 3	Raj

-- 📚 Table: marks
-- student_id	subject	score
-- 1	Math	90
-- 1	English	85
-- 2	Math	88

-- 🔍 INNER JOIN (Most common)
-- 🔑 Keyword used:

-- sql
-- Copy
-- Edit
-- FROM table1
-- JOIN table2 ON table1.column = table2.column
-- 🎯 Output: Only matching records
-- sql
-- Copy
-- Edit
-- SELECT students.name, marks.subject, marks.score
-- FROM students
-- JOIN marks ON students.student_id = marks.student_id;
-- ✅ Result:
-- name	subject	score
-- Akshay	Math	90
-- Akshay	English	85
-- Aditi	Math	88



-- SQL JOIN PRACTICE QUERIES ONLY

-- INNER JOIN: Show all bookings with customer names
SELECT bookings.booking_id, customers.name AS customer_name, bookings.check_in_date
FROM bookings
INNER JOIN customers ON bookings.customer_id = customers.customer_id;

-- LEFT JOIN: Show all customers and their bookings (if any)
SELECT customers.name, bookings.booking_id, bookings.check_in_date
FROM customers
LEFT JOIN bookings ON customers.customer_id = bookings.customer_id;

-- RIGHT JOIN: Show all bookings and customer names (even if customer info is missing)
SELECT bookings.booking_id, customers.name AS customer_name
FROM bookings
RIGHT JOIN customers ON bookings.customer_id = customers.customer_id;

-- FULL OUTER JOIN: (Not supported in MySQL directly, but can be simulated)
SELECT customers.name, bookings.booking_id
FROM customers
LEFT JOIN bookings ON customers.customer_id = bookings.customer_id
UNION
SELECT customers.name, bookings.booking_id
FROM customers
RIGHT JOIN bookings ON customers.customer_id = bookings.customer_id;

-- JOIN with WHERE: Show bookings for customers from a specific city
SELECT bookings.booking_id, customers.name, customers.city
FROM bookings
INNER JOIN customers ON bookings.customer_id = customers.customer_id
WHERE customers.city = 'Delhi';

-- JOIN multiple tables: booking + customer + rooms
SELECT bookings.booking_id, customers.name AS customer_name, rooms.room_number, rooms.room_type
FROM bookings
JOIN customers ON bookings.customer_id = customers.customer_id
JOIN rooms ON bookings.room_id = rooms.room_id;

-- JOIN with aggregate: total bookings by each customer

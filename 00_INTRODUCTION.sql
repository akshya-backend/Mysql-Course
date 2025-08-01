-- =====================================================
-- 📘 INTRODUCTION TO RELATIONAL DATABASES AND MYSQL
-- =====================================================

-- 🔷 1. WHAT IS A DATABASE?
-- A database is an organized collection of data.
-- It allows storing, retrieving, updating, and managing data efficiently.

-- 🔷 2. WHAT IS A RELATIONAL DATABASE?
-- A relational database stores data in TABLES (also called RELATIONS).
-- Each table has:
--   - ROWS (records/tuples)
--   - COLUMNS (fields/attributes)
-- Tables can be related using KEYS (PRIMARY KEY, FOREIGN KEY).

-- 🔷 3. WHAT IS MYSQL?
-- MySQL is the most popular open-source Relational Database Management System (RDBMS).
-- It uses SQL (Structured Query Language) to interact with data.
-- Developed by Oracle, free to use, and supports millions of records.

-- ✅ MySQL is:
--   - Open-source and free
--   - Fast and efficient
--   - Cross-platform (Windows, Linux, Mac)
--   - Suitable for small to large-scale applications

-- 🔷 4. WHY USE MYSQL?
-- ✅ Benefits:
--   - Structured storage of data in tables
--   - Powerful querying using SQL
--   - Relationships between tables
--   - ACID-compliant (Atomicity, Consistency, Isolation, Durability)
--   - Secure and scalable

-- 🔷 5. EXAMPLE: USERS AND ORDERS DATABASE

-- Users Table (Structure)
-- +----+--------+----------------------+
-- | id | name   | email                |
-- +----+--------+----------------------+
-- | 1  | Akshya | akshya@mail.com      |
-- | 2  | Rahul  | rahul@mail.com       |
-- +----+--------+----------------------+

-- Orders Table (Structure)
-- +----+---------+----------+--------+
-- | id | user_id | product  | amount |
-- +----+---------+----------+--------+
-- | 1  | 1       | Laptop   | 55000  |
-- | 2  | 2       | Phone    | 15000  |
-- +----+---------+----------+--------+

-- FOREIGN KEY: user_id in Orders references id in Users (relationship between tables)

-- 🔷 6. MYSQL VS OTHER RDBMS

-- | Feature      | MySQL     | PostgreSQL | SQL Server  |
-- |--------------|-----------|------------|-------------|
-- | License      | Free      | Free       | Paid        |
-- | Focus        | Speed     | Features   | Enterprise  |
-- | Use Cases    | Web Apps  | Analytics  | Enterprise  |

-- 🔷 7. ACID PROPERTIES

-- A = Atomicity      → All steps in a transaction succeed or none
-- C = Consistency    → DB moves from one valid state to another
-- I = Isolation      → Concurrent transactions don’t interfere
-- D = Durability     → Once committed, data remains even after crash



-- 🔷 9. MYSQL ARCHITECTURE (Simplified)

-- CLIENT (You/VS Code)
--    ↓
-- SQL PARSER → QUERY OPTIMIZER → EXECUTOR
--    ↓
-- STORAGE ENGINE (e.g., InnoDB)
--    ↓
-- DISK (Your data is saved here)

-- 🔷 10. REAL-LIFE USES OF MYSQL

-- Facebook    → User data, messages
-- WordPress   → Blog posts, users
-- Netflix     → Customer preferences
-- Uber        → Drivers and riders

-- =====================================================
-- ✅ SUMMARY

-- ✅ MySQL is a powerful open-source relational database.
-- ✅ It organizes data in tables and supports SQL.
-- ✅ Enforces data integrity with ACID compliance.
-- ✅ Used by small to large applications (e.g., Facebook, Uber).
-- ✅ Easy to connect with apps via Node.js, Python, Java, etc.

-- Want to practice? Try creating a database and inserting some sample data!

-- End of file: intro_to_mysql.sql

-- =============================================
-- MySQL UNION Examples
-- =============================================

-- Create example tables for demonstration

DROP TABLE IF EXISTS employees_us;
CREATE TABLE employees_us (
    id INT,
    name VARCHAR(50)
);

DROP TABLE IF EXISTS employees_uk;
CREATE TABLE employees_uk (
    id INT,
    name VARCHAR(50)
);

-- Insert sample data into employees_us
INSERT INTO employees_us (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(6, 'Frank');

-- Insert sample data into employees_uk
INSERT INTO employees_uk (id, name) VALUES
(3, 'Charlie'),
(4, 'David'),
(5, 'Emma'),
(7, 'Grace');

-- =============================================
-- 1. Basic UNION: combines rows from two tables and removes duplicates
-- This will return all unique employees from both tables
SELECT id, name FROM employees_us
UNION
SELECT id, name FROM employees_uk;

-- =============================================
-- 2. UNION ALL: combines rows from two tables and keeps duplicates
-- This will return all employees from both tables including duplicates
SELECT id, name FROM employees_us
UNION ALL
SELECT id, name FROM employees_uk;

-- =============================================
-- 3. UNION with WHERE filters: get employees with id < 5 from both tables
SELECT id, name FROM employees_us WHERE id < 5
UNION
SELECT id, name FROM employees_uk WHERE id < 5;

-- =============================================
-- 4. UNION with ORDER BY: combine and sort by name alphabetically
SELECT id, name FROM employees_us
UNION
SELECT id, name FROM employees_uk
ORDER BY name;

-- =============================================
-- 5. UNION with different columns aliased
-- Select employee names only from both tables (same number and type of columns)
SELECT name AS employee_name FROM employees_us
UNION
SELECT name FROM employees_uk;

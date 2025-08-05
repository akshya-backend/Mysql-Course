-- 📘 FILE: count_avg_sum.sql
-- 🔍 Understanding COUNT, AVG, and SUM in MySQL
-- These are **aggregate functions** used to perform calculations on data columns.
-- They return **a single value** (unless used with GROUP BY).

-- -------------------------------------------------------
-- 🧮 1. COUNT() - Count the number of non-NULL rows
-- -------------------------------------------------------

-- Example 1: Count total employees
SELECT COUNT(*) AS TotalEmployees
FROM employees;

-- Example 2: Count how many employees have bonuses (non-NULL only)
SELECT COUNT(bonus) AS EmployeesWithBonus
FROM employees;

-- NOTE: COUNT(*) counts all rows.
--       COUNT(column) skips NULLs in that column.

-- -------------------------------------------------------
-- 📊 2. AVG() - Get the average (mean) value
-- -------------------------------------------------------

-- Example: Average salary of all employees
SELECT AVG(salary) AS AverageSalary
FROM employees;

-- NOTE: AVG() ignores NULL values automatically.

-- You can also use a WHERE condition:
SELECT AVG(salary) AS AverageManagerSalary
FROM employees
WHERE role = 'Manager';

-- -------------------------------------------------------
-- ➕ 3. SUM() - Get the total sum of a column
-- -------------------------------------------------------

-- Example: Total salary paid
SELECT SUM(salary) AS TotalSalary
FROM employees;

-- With a filter:
SELECT SUM(bonus) AS TotalBonusForHR
FROM employees
WHERE department = 'HR';

-- -------------------------------------------------------
-- 📌 Using all three together
-- -------------------------------------------------------

SELECT 
  COUNT(*) AS Total,
  AVG(salary) AS Average,
  SUM(salary) AS TotalSalary
FROM employees
WHERE active = 1;

-- -------------------------------------------------------
-- ✅ Summary
-- -------------------------------------------------------

-- COUNT(*)        → Total rows
-- COUNT(column)   → Rows where column is NOT NULL
-- AVG(column)     → Average of non-NULL numeric values
-- SUM(column)     → Total of numeric values (excluding NULL)

-- All these return a **single value**, unless grouped.

-- You can use them in combination with GROUP BY to get per-department stats, etc.

-- Example with GROUP BY (optional):
SELECT department, COUNT(*) AS Total, AVG(salary) AS AvgSal
FROM employees
GROUP BY department;

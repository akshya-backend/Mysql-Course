-- 📘 FILE: like_operator.sql
-- 🔍 Understanding LIKE operator in MySQL
-- ✅ LIKE is used in WHERE clause to search for a specified pattern in a column.

-- -------------------------------------------------------
-- ✅ 1. Basic Syntax
-- -------------------------------------------------------

-- SELECT * FROM table_name
-- WHERE column_name LIKE 'pattern';

-- 🎯 Pattern can use two wildcards:
-- ▪ % → represents zero, one, or many characters
-- ▪ _ → represents a single character

-- -------------------------------------------------------
-- ✅ 2. Starts With
-- -------------------------------------------------------

-- 👇 Find all names that start with 'A'
SELECT *
FROM employees
WHERE name LIKE 'A%';

-- Matches: 'Aman', 'Akshay', 'Anita'
-- Doesn’t match: 'Brij', 'karan'

-- -------------------------------------------------------
-- ✅ 3. Ends With
-- -------------------------------------------------------

-- 👇 Find all names that end with 'n'
SELECT *
FROM employees
WHERE name LIKE '%n';

-- Matches: 'Arun', 'Karan', 'Nitin'
-- Doesn’t match: 'Mohan', 'Amit'

-- -------------------------------------------------------
-- ✅ 4. Contains (Anywhere)
-- -------------------------------------------------------

-- 👇 Find names that contain 'sh'
SELECT *
FROM employees
WHERE name LIKE '%sh%';

-- Matches: 'Akshay', 'Ashok'
-- Doesn’t match: 'Ravi', 'Mohan'

-- -------------------------------------------------------
-- ✅ 5. Single Character Wildcard `_`
-- -------------------------------------------------------

-- 👇 Find 4-letter names where 2nd letter is 'a'
SELECT *
FROM employees
WHERE name LIKE '_a__';

-- Matches: 'Ravi', 'Karan'
-- Doesn’t match: 'Amit', 'Raju' (if not exactly 4 letters)

-- -------------------------------------------------------
-- ✅ 6. Case Sensitivity
-- -------------------------------------------------------
-- By default, LIKE is case-insensitive in MySQL with utf8 charset.
-- So 'A%' matches 'Akshay' and 'akshay'.

-- -------------------------------------------------------
-- ✅ 7. NOT LIKE
-- -------------------------------------------------------

-- 👇 Find all employees whose name does NOT contain 'a'
SELECT *
FROM `Customer`
WHERE FULLName  LIKE '%a%';

-- -------------------------------------------------------
-- ✅ 8. LIKE with ESCAPE character
-- -------------------------------------------------------

-- 👇 Find data that literally contains % or _ (rare case)
-- For example: match "50% bonus"
SELECT *
FROM bonuses
WHERE comment LIKE '50!%%' ESCAPE '!';

-- `!` is the escape character here.


-- -------------------------------------------------------
-- 📌 Summary
-- -------------------------------------------------------

-- LIKE is used for pattern matching.
-- Use % for multiple characters, _ for single character.
-- Use NOT LIKE to exclude patterns.
-- LIKE works best on VARCHAR / TEXT fields.

-- ✅ Great for flexible text filtering in WHERE clauses!

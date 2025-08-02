 USE HotelDB;

-- SELECT column1, column2, ...
-- FROM table_name;
 SELECT FullName, Email FROM Customer;
SELECT FullName, Email
FROM Customer
WHERE Nationality = 'Indian';


-- 1. = Equal to
SELECT FullName FROM Customer WHERE Nationality = 'Indian';

-- 2. >, <, >=, <= (Greater or Less Than)
SELECT * FROM Room WHERE PricePerNight > 1000;

-- 3. <> or != (Not Equal)
SELECT * FROM Customer WHERE Nationality != 'Indian'; -- or use <>

-- 4. LIKE (Pattern Matching)
SELECT * FROM Customer WHERE FullName LIKE 'A%';  -- Names starting with 'A'

-- 5. BETWEEN (Range Check)
SELECT * FROM Room WHERE Rating BETWEEN 3 AND 5;

-- 6. IN (Check for multiple values)
SELECT * FROM Payment WHERE Method IN ('Card', 'UPI');

-- 7. IS NULL (Check if a field is NULL)
SELECT * FROM Customer WHERE IDProof IS NULL;




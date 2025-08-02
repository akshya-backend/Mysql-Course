-- 🔁 1. Basic UPDATE without JOIN: Change customer name
UPDATE Customer
SET FullName = 'Jonathan Doe'
WHERE FullName = 'John Doe';

-- 🔁 2. UPDATE with a condition: Increase Spa service price by ₹200
UPDATE `Hotel`
SET `Rating` = 0.1
WHERE `HotelName` = 'Ocean Breeze';

-- 🔁 3. UPDATE with JOIN: Update TotalCost in ServiceUsage based on new Service Price
UPDATE ServiceUsage su
JOIN Service s ON su.ServiceID = s.ServiceID
SET su.TotalCost = su.Quantity * s.Price
WHERE s.ServiceName = 'Spa';

-- 🔁 4. UPDATE with multiple columns: Change email and name together
UPDATE Customer
SET FullName = 'Alice Johnson', Email = 'alice.j@example.com'
WHERE Email = 'alice@example.com';

-- 🔁 5. Conditional UPDATE with range: Add ₹50 to all services priced below ₹1000
UPDATE Service
SET Price = Price + 50
WHERE Price < 1000;

-- 🔁 6. Use of DATE in condition: Give discount to usage before 2025-08-01
UPDATE ServiceUsage
SET TotalCost = TotalCost * 0.9
WHERE DateUsed < '2025-08-01';

-- 🔁 7. SET one column from subquery: Set Quantity = 3 where service is Room Cleaning
UPDATE ServiceUsage
SET Quantity = 3
WHERE ServiceID = (
    SELECT ServiceID FROM Service WHERE ServiceName = 'Room Cleaning'
);

-- 🔁 8. Update using IN condition
UPDATE Service
SET Price = Price + 100
WHERE ServiceName IN ('Spa', 'Room Cleaning');

-- 🔁 9. UPDATE with LIMIT (some SQL engines support it like MySQL)
UPDATE ServiceUsage
SET Quantity = 5
WHERE ServiceID = 1
LIMIT 1;

-- 🔁 10. Use CASE inside UPDATE for conditional logic
UPDATE Service
SET Price = CASE
    WHEN ServiceName = 'Spa' THEN Price + 100
    WHEN ServiceName = 'Room Cleaning' THEN Price + 50
    ELSE Price
END;

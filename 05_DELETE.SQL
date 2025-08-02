-- =======================================
-- 🔴 DELETE SERVICE USAGE WITHOUT JOIN
-- =======================================
USE HotelDB;

-- ✅ Example 1: Delete all service usages for a customer by full name
DELETE FROM ServiceUsage
WHERE CustomerID = (
    SELECT CustomerID FROM Customer WHERE FullName = 'Priya Sharma'
);

-- ✅ Example 2: Delete all usages of a specific service by service name
DELETE FROM ServiceUsage
WHERE ServiceID = (
    SELECT ServiceID FROM Service WHERE ServiceName = 'Laundry'
);

-- ✅ Example 3: Delete all service usages before a certain date
DELETE FROM ServiceUsage
WHERE DateUsed < '2025-08-01';

-- ✅ Example 4: Delete service usages where quantity used is greater than 2
DELETE FROM ServiceUsage
WHERE Quantity > 2;

-- ✅ Example 5: Delete specific record by known UsageID
DELETE FROM ServiceUsage
WHERE UsageID = 10; -- Replace with actual ID if needed

-- ✅ Optional: Verify with SELECT
-- SELECT * FROM ServiceUsage;

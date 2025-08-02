-- ============================================
-- 🔥 DELETE STATEMENTS USING ONLY WHERE CLAUSES
-- ============================================
USE HotelDB;

-- ✅ Delete by exact match (CustomerID = ...)
DELETE FROM ServiceUsage
WHERE CustomerID = 1;

-- ✅ Delete by multiple conditions (ServiceID and Quantity)
DELETE FROM ServiceUsage
WHERE ServiceID = 2 AND Quantity = 1;

-- ✅ Delete using IN (multiple customers by IDs)
DELETE FROM ServiceUsage
WHERE CustomerID IN (2, 3);

-- ✅ Delete using NOT IN (exclude certain services)
DELETE FROM ServiceUsage
WHERE ServiceID NOT IN (1, 2);

-- ✅ Delete using BETWEEN (date range)
DELETE FROM ServiceUsage
WHERE DateUsed BETWEEN '2025-07-01' AND '2025-07-31';

-- ✅ Delete using LIKE (IDProof pattern)
DELETE FROM Customer
WHERE IDProof LIKE 'AADHAR%';

-- ✅ Delete using IS NULL
DELETE FROM Booking
WHERE CheckOutDate IS NULL;

-- ✅ Delete using IS NOT NULL
DELETE FROM Payment
WHERE PaymentDate IS NOT NULL;

-- ✅ Delete using comparison (greater than)
DELETE FROM ServiceUsage
WHERE Quantity > 2;

-- ✅ Delete using less than
DELETE FROM ServiceUsage
WHERE TotalCost < 1000;

-- ✅ Delete specific record by primary key
DELETE FROM ServiceUsage
WHERE UsageID = 5;

-- ✅ Delete using nested subquery (Customer name to ID)
DELETE FROM ServiceUsage
WHERE CustomerID = (
    SELECT CustomerID FROM Customer WHERE FullName = 'Akshay Kumar'
);

-- ✅ Delete using EXISTS
DELETE FROM ServiceUsage
WHERE EXISTS (
    SELECT 1 FROM Customer 
    WHERE Customer.CustomerID = ServiceUsage.CustomerID 
    AND FullName = 'John Doe'
);

-- ============================================
-- MySQL CASE Statement Examples for Hotel Management System
-- ============================================

USE HotelDB;

-- ============================================
-- Example 1: Categorize RoomType by BasePrice
-- ============================================
SELECT
  RoomTypeID,
  TypeName,
  BasePrice,
  CASE
    WHEN BasePrice < 2000 THEN 'Budget'
    WHEN BasePrice BETWEEN 2000 AND 4000 THEN 'Standard'
    ELSE 'Premium'
  END AS PriceCategory
FROM RoomType;

-- ============================================
-- Example 2: Label Booking Status in human-readable form
-- ============================================
SELECT
  BookingID,
  CustomerID,
  Status,
  CASE Status
    WHEN 'Booked' THEN 'Booking Confirmed'
    WHEN 'CheckedIn' THEN 'Customer Checked In'
    WHEN 'CheckedOut' THEN 'Customer Checked Out'
    WHEN 'Cancelled' THEN 'Booking Cancelled'
    ELSE 'Unknown Status'
  END AS StatusDescription
FROM Booking;

-- ============================================
-- Example 3: Payment Status with colors (for UI hinting)
-- ============================================
SELECT
  PaymentID,
  BookingID,
  Amount,
  Status,
  CASE Status
    WHEN 'Pending' THEN 'Yellow'
    WHEN 'Completed' THEN 'Green'
    WHEN 'Failed' THEN 'Red'
    ELSE 'Gray'
  END AS StatusColor
FROM Payment;

-- ============================================
-- Example 4: Room availability status description
-- ============================================
SELECT
  RoomID,
  RoomNumber,
  Status,
  CASE Status
    WHEN 'Available' THEN 'Ready to Book'
    WHEN 'Booked' THEN 'Currently Occupied'
    WHEN 'Maintenance' THEN 'Under Maintenance'
    ELSE 'Status Unknown'
  END AS RoomStatusDescription
FROM Room;

-- ============================================
-- Example 5: Calculate discount category based on number of guests in booking
-- ============================================
SELECT
  BookingID,
  NumberOfGuests,
  CASE 
    WHEN NumberOfGuests >= 5 THEN 'Group Discount'
    WHEN NumberOfGuests BETWEEN 3 AND 4 THEN 'Family Discount'
    ELSE 'No Discount'
  END AS DiscountCategory
FROM Booking;

-- ============================================
-- Example 6: Using CASE in ORDER BY - Prioritize bookings with status 'Booked'
-- ============================================
SELECT BookingID, CustomerID, Status
FROM Booking
ORDER BY 
  CASE Status
    WHEN 'Booked' THEN 1
    WHEN 'CheckedIn' THEN 2
    WHEN 'CheckedOut' THEN 3
    ELSE 4
  END;

-- ============================================
-- Example 7: Using CASE in UPDATE - Mark rooms under maintenance if last booking was cancelled
-- (Be careful running this on production data)
-- ============================================
-- UPDATE Room r
-- JOIN Booking b ON r.RoomID = b.RoomID
-- SET r.Status = CASE 
--   WHEN b.Status = 'Cancelled' THEN 'Maintenance'
--   ELSE r.Status
-- END
-- WHERE b.CheckOutDate < CURDATE();

-- Uncomment and test carefully

-- ============================================
-- End of CASE statement examples for HotelDB
-- ============================================

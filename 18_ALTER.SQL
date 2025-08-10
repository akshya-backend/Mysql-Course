-- =============================================
-- ALTER TABLE Examples for Hotel Management System
-- =============================================

USE HotelDB;

-- Example 1: Add a new column 'Rating' to 'Hotel' table
ALTER TABLE Hotel
ADD Rating DECIMAL(2,1) DEFAULT 4.0;

-- Example 2: Add a new column 'Email' to 'Staff' table
ALTER TABLE Staff
ADD Email VARCHAR(100);

-- Example 3: Drop the column 'Phone' from 'Staff' table
ALTER TABLE Staff
DROP COLUMN Phone;

-- Example 4: Modify the data type of 'Email' column in 'Customer' table to VARCHAR(150)
ALTER TABLE Customer
MODIFY COLUMN Email VARCHAR(150);

-- Example 5: Rename the table 'RoomType' to 'RoomCategory'
ALTER TABLE RoomType
RENAME TO RoomCategory;

-- Example 6: Change default value of 'Status' in 'Room' table to 'Available'
ALTER TABLE Room
ALTER COLUMN Status SET DEFAULT 'Available';

-- Example 7: Add a UNIQUE constraint to 'Email' column in 'Staff' table
ALTER TABLE Staff
ADD UNIQUE (Email);

-- Example 8: Drop the UNIQUE constraint on 'Email' in 'Staff' table
-- Note: You need to know the constraint name or use workaround
-- This example assumes constraint name is 'Email_UNIQUE'
ALTER TABLE Staff
DROP INDEX Email;

-- Example 9: Add a foreign key constraint from 'Booking.RoomID' to 'Room.RoomID'
ALTER TABLE Booking
ADD CONSTRAINT fk_booking_room
FOREIGN KEY (RoomID) REFERENCES Room(RoomID);

-- Example 10: Drop foreign key constraint 'fk_booking_room' from 'Booking' table
ALTER TABLE Booking
DROP FOREIGN KEY fk_booking_room;

-- =============================================
-- End of ALTER TABLE examples
-- =============================================

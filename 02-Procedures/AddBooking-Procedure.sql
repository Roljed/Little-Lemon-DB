DELIMITER $$

CREATE PROCEDURE AddBooking(
    IN p_BookingID INT,
    IN p_CustomerID INT,
    IN p_BookingDate DATE,
    IN p_TableNumber INT
)
BEGIN
    -- Insert the new booking record into the Bookings table
    INSERT INTO Bookings (BookingID, CustomerID, Date, TableNumber)
    VALUES (p_BookingID, p_CustomerID, p_BookingDate, p_TableNumber);

    -- Confirmation message after the booking is added
    SELECT CONCAT('Booking ', p_BookingID, ' has been successfully added for customer ', p_CustomerID, ' on ', p_BookingDate, ' at table ', p_TableNumber) AS Booking_Status;
END$$

DELIMITER ;

CALL AddBooking(1, 1, '2022-10-10', 5, 5);

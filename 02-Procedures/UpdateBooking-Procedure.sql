DELIMITER $$

CREATE PROCEDURE UpdateBooking(
    IN p_BookingID INT,
    IN p_BookingDate DATE
)
BEGIN
    -- Update the booking date for the given booking ID
    UPDATE Bookings
    SET Date = p_BookingDate
    WHERE BookingID = p_BookingID;

    -- Confirmation message after the booking is updated
    SELECT CONCAT('Booking ', p_BookingID, ' has been successfully updated to ', p_BookingDate) AS Booking_Update_Status;
END$$

DELIMITER ;

CALL UpdateBooking(1, '2022-12-01');

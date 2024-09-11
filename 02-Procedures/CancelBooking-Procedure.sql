DELIMITER $$

CREATE PROCEDURE CancelBooking(
    IN p_BookingID INT
)
BEGIN
    -- Delete the booking record with the given booking ID
    DELETE FROM Bookings
    WHERE BookingID = p_BookingID;

    -- Confirmation message after the booking is canceled
    SELECT CONCAT('Booking ', p_BookingID, ' has been successfully canceled.') AS Booking_Cancel_Status;
END$$

DELIMITER ;

CALL CancelBooking(9);

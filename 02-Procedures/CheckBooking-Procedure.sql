DELIMITER $$

CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT)
BEGIN
    DECLARE booking_status INT DEFAULT 0;
    
    -- Check if the table is booked on the given date
    SELECT COUNT(*) INTO booking_status
    FROM Bookings
    WHERE Date = booking_date
    AND TableNumber = table_number;
    
    -- Return the booking status along with the table number if it's booked
    IF booking_status > 0 THEN
        SELECT CONCAT('Table ', table_number, ' is already booked on ', booking_date) AS Booking_Status;
    ELSE
        SELECT CONCAT('Table ', table_number, ' is available on ', booking_date) AS Booking_Status;
    END IF;
END$$

DELIMITER ;


CALL CheckBooking('2022-10-10', 5);

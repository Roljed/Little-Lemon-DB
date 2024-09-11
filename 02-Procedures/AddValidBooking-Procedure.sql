DELIMITER $$

CREATE PROCEDURE AddValidBooking(
    IN booking_date DATE,
    IN table_number INT,
    IN customer_id INT
)
BEGIN
    DECLARE booking_exists INT DEFAULT 0;

    -- Start the transaction
    START TRANSACTION;

    -- Check if the table is already booked on the given date
    SELECT COUNT(*) INTO booking_exists
    FROM Bookings
    WHERE Date = booking_date
    AND TableNumber = table_number;

    -- If the table is already booked, rollback the transaction
    IF booking_exists > 0 THEN
        ROLLBACK;
        SELECT CONCAT('Table ', table_number, ' is already booked on ', booking_date, '. Booking cannot be made.') AS Booking_Status;
    ELSE
        -- If the table is available, insert the booking and commit the transaction
        INSERT INTO Bookings (Date, TableNumber, CustomerID)
        VALUES (booking_date, table_number, customer_id);
        
        COMMIT;
        SELECT CONCAT('Table ', table_number, ' has been successfully booked for ', booking_date) AS Booking_Status;
    END IF;
END$$

DELIMITER ;

CALL AddValidBooking('2022-10-10', 5, 1);

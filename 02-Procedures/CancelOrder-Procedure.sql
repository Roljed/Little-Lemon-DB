CREATE PROCEDURE CancelOrder(IN order_id INT)
BEGIN
    DELETE FROM Orders
    WHERE OrderID = order_id;
END

-- CALL CancelOrder(101);  -- Example to delete the order with OrderID = 101

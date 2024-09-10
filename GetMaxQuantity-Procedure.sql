CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS Max_Quantity
    FROM Orders;
END

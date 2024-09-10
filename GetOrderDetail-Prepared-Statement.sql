PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, BillAmount
 FROM Orders
 WHERE CustomerID = ?';


SET @id = 1;

EXECUTE GetOrderDetail USING @id;

DEALLOCATE PREPARE GetOrderDetail;

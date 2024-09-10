SELECT 
    C.CustomerID, 
    CONCAT(C.FisrtName, ' ', C.LastName) AS full_name, 
    O.OrderID, 
    O.BillAmount as Cost, 
    M.Cuisine AS Menu_Cuisine, 
    S.StarterName, 
    Co.CourseName, 
    D.DrinkName, 
    De.DessertName
FROM 
    Customers C
JOIN 
    Orders O ON C.CustomerID = O.CustomerID
JOIN 
    Menus M ON O.MenuID = M.MenuID
JOIN 
    Starters S ON M.StartersID = S.StarterID
JOIN 
    CoursesID Co ON M.CoursesID = Co.CourseID
JOIN 
    Drinks D ON M.DrinksID = D.DrinkID
JOIN 
    Desserts De ON M.DessertsID = De.DessertID
WHERE 
    O.BillAmount > 150
ORDER BY 
    O.BillAmount ASC;

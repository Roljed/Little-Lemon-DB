SELECT 
    M.Cuisine AS Menu_Cuisine, 
    S.StarterName, 
    Co.CourseName, 
    D.DrinkName, 
    De.DessertName
FROM 
    Menus M
JOIN 
    Starters S ON M.StartersID = S.StarterID
JOIN 
    CoursesID Co ON M.CoursesID = Co.CourseID
JOIN 
    Drinks D ON M.DrinksID = D.DrinkID
JOIN 
    Desserts De ON M.DessertsID = De.DessertID
WHERE 
    M.MenuID IN (
        SELECT 
            O.MenuID 
        FROM 
            Orders O
        GROUP BY 
            O.MenuID
        HAVING 
            COUNT(O.Quantity) > 2
    );

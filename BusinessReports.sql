//View to display customer order history
//This view combines customer and order information to provide a comprehensive history of customer orders.
CREATE OR REPLACE VIEW CustomerOrderHistory AS
SELECT
    C.CustomerID,
    C.FirstName || ' ' || C.LastName AS CustomerName,
    O.OrderID,
    O.OrderDate,
    O.TotalAmount
FROM
    Customer C
    JOIN Orders O ON C.CustomerID = O.CustomerID;
    

//View to display top-rated dishes and their average ratings
//This view calculates the average ratings and review counts for each dish, showcasing popular dishes.
CREATE VIEW PopularDishes AS
SELECT
    d.DishID,
    d.Title,
    AVG(r.Rating) AS AvgRating,
    COUNT(*) AS ReviewCount
FROM Dish d
LEFT JOIN Review r ON d.DishID = r.DishID
GROUP BY d.DishID, d.Title;

// View to display chef performance based on dish ratings
//This view calculates the average ratings for dishes associated with each chef, providing insights into chef performance.
CREATE OR REPLACE VIEW ChefPerformance AS
SELECT
    C.ChefID,
    C.ChefName,
    AVG(D.Rating) AS AverageRating
FROM
    Chef C
    JOIN Dish D ON C.ChefID = D.ChefID
GROUP BY
    C.ChefID, C.ChefName
ORDER BY
    AverageRating DESC;
    


// View to display ingredient inventory levels
//This view calculates the usage count of each ingredient in dishes, providing insights into ingredient inventory levels.
CREATE VIEW IngredientUsage AS
SELECT
    i.IngredientID,
    i.Name,
    COUNT(di.DishID) AS DishCount
FROM Ingredient i
LEFT JOIN DishIngredient di ON i.IngredientID = di.IngredientID
GROUP BY i.IngredientID, i.Name;

//Creating CustomerOrdersView
//This view combines customer and order information to provide a quick overview of customer orders.
CREATE VIEW CustomerOrdersView AS
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount
FROM
    Customer c
JOIN
    Orders o ON c.CustomerID = o.CustomerID;
    
    SELECT * FROM  CHEFPERFORMANCE;
    SELECT * FROM CUSTOMERORDERHISTORY;
    SELECT * FROM CUSTOMERORDERSREVIEW;
    SELECT * FROM INGREDIENTUSAGE;
    SELECT * FROM POPULARDISHES;
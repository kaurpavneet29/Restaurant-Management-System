-- Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50),
    Email VARCHAR2(255)
);

-- Chef Table
CREATE TABLE Chef (
    ChefID INT PRIMARY KEY,
    ChefName VARCHAR2(50) NOT NULL,
    Email VARCHAR2(255) NOT NULL,
    Username VARCHAR2(255) NOT NULL,
    Password VARCHAR2(10) NOT NULL,
    Phone NUMBER,
    Address VARCHAR2(1000)
);

-- Ingredient Table
CREATE TABLE Ingredient (
    IngredientID INT PRIMARY KEY,
    Name VARCHAR2(50) NOT NULL,
    Unit VARCHAR2(20)
);

-- Cuisine Table
CREATE TABLE Cuisine (
    CuisineID INT PRIMARY KEY,
    CuisineName VARCHAR2(50) NOT NULL,
    DishID INT REFERENCES Dish(DishID)
    );

-- Order Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT REFERENCES Customer(CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2) DEFAULT 0.00
);

-- Review Table
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    CustomerID INT REFERENCES Customer(CustomerID),
    Rating INT,
    "Comment" VARCHAR2(1000),
    ReviewDate DATE
);

-- Dish Table
CREATE TABLE Dish (
    DishID INT PRIMARY KEY,
    Title VARCHAR2(100) NOT NULL,
    ChefID INT REFERENCES Chef(ChefID),
    Instructions VARCHAR2(4000), -- Adjust the size as needed
    Rating NUMBER(1,0) DEFAULT 0
);

-- DishIngredient Bridge Table
CREATE TABLE DishIngredient (
    DishIngredientID INT PRIMARY KEY,
    DishID INT REFERENCES Dish(DishID),
    IngredientID INT REFERENCES Ingredient(IngredientID)
);

-- CustomerDish Bridge Table
CREATE TABLE CustomerDish (
    CustomerDishID INT PRIMARY KEY,
    CustomerID INT REFERENCES Customer(CustomerID),
    DishID INT REFERENCES Dish(DishID)
);

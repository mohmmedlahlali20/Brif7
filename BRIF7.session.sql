DROP DATABASE electronacerv3;
-- @block
-- Create the database
CREATE DATABASE IF NOT EXISTS electronacerv3;
-- Switch to the database
USE electronacerv3;
-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    Address VARCHAR(255),
    City VARCHAR(50),
    Email VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Login VARCHAR(50) NOT NULL,
    role ENUM("client", "admin") DEFAULT "client",
    Verified BOOLEAN DEFAULT FALSE
);
-- Insert the Users in table
INSERT INTO Users (
        FullName,
        PhoneNumber,
        Address,
        city,
        email,
        Password,
        Role,
        Verified
    )
VALUES (
        'Admin',
        '0600000000',
        'Seattle, Washington(WA), 98101 ',
        'Seattle',
        'admin@test.com',
        'admin123',
        'admin',
        TRUE
    ),
    (
        'User Verified',
        '0600000001',
        'Seattle, Washington(WA), 98101 ',
        'Seattle',
        'user@test.com',
        'user123',
        'customer',
        TRUE
    ),
    (
        'User Unverified',
        '0600000002',
        'Seattle, Washington(WA), 98101 ',
        'Seattle',
        'user1@test.com',
        'user123',
        'customer',
        FALSE
    );
-- Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);
-- Categories table
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL
);
-- ProductCategories table to represent the many-to-many relationship between products and categories
CREATE TABLE ProductCategories (
    ProductID INT,
    CategoryID INT,
    PRIMARY KEY (ProductID, CategoryID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    ShipDate DATETIME,
    DeliveryDate DATETIME,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    OrderStatus VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
-- OrderDetails table to represent the many-to-many relationship between orders and products
CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
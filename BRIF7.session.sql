-- Create the User table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    telephone_number VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(100),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM("customer", "admin") DEFAULT "customer",
    Verified BOOLEAN DEFAULT FALSE
);
-- Insert the Users in table
INSERT INTO Users (
        full_name,
        telephone_number,
        address,
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
-- Create the Orders table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    dispatch_date TIMESTAMP,
    delivery_date TIMESTAMP,
    billing_address VARCHAR(255),
    shipping_address VARCHAR(255),
    total_price DECIMAL(10, 2),
    order_status ENUM('Pending', 'Validated', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
-- Create the Products table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);
-- Create the OrdersProducts table to handle many-to-many relationship between Orders and Products
CREATE TABLE OrdersProducts (
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id),
    FOREIGN KEY (unit_price) REFERENCES Products(price)
);
-- Create the Categories table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL
);
-- Create the ClientsStatus table to store the status of clients
CREATE TABLE ClientsStatus (
    user_id INT PRIMARY KEY,
    status ENUM('Pending', 'Validated', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
-- Create the OrdersStatus table to store the status of orders
CREATE TABLE OrdersStatus (
    order_id INT PRIMARY KEY,
    status ENUM('Pending', 'Validated', 'Cancelled') DEFAULT 'Pending',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
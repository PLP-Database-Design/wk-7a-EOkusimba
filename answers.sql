-- Question 1: Achieving 1NF (First Normal Form)
-- Creation of a table with OrderID, CustomerName, and Product columns
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);

--Inserting values into the ProductDetail_1NF table, ensuring that the Product values are input in separate rows
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- Displaying the table to ensure that it is in 1st Normal Form
SELECT * FROM ProductDetail_1NF;

-- Question 2: Achieving 2NF (Second Normal Form)
-- Creation of a Orders_2NF table for the OrderID and CustomerName details
CREATE TABLE Orders_2NF (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Inserting values into the Orders_2NF table
INSERT INTO Orders_2NF (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Creation of an OrderProducts_2NF table to store the Product and Quantity values
CREATE TABLE OrderProducts_2NF (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    -- This table is connected to the Orders_2NF table via the OrderID key
    FOREIGN KEY (OrderID) REFERENCES Orders_2NF(OrderID)
);

-- Inserting OrderID, Product and Quantity values into the table
INSERT INTO OrderProducts_2NF (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- Displaying the OrderProducts_2NF and Orders_2NF tables to confirm that they are in 2nd normal form
SELECT * FROM OrderProducts_2NF;
SELECT * FROM Orders_2NF;
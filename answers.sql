-- Question 1
CREATE TABLE ProductDetail (
    OrderID INT,
    CustomerName VARCHAR(50),
    Products VARCHAR(100)
);


INSERT INTO ProductDetail (OrderID, CustomerName, Products) 
 VALUES (101, 'Nattan Nelsons', 'Laptop, Mouse'),
        (102, 'Caleb Stevens', 'Tablet, Keyboard, Mouse'),
        (103, 'Cedric Mathews', 'Phone');


CREATE TABLE numbers (
    n INT PRIMARY KEY
);


INSERT INTO numbers (n) 
VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10);

-- Question 2
CREATE TABLE OrderDetails (
    OrderID INT,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Quantity INT
);


INSERT INTO OrderDetails (OrderID, CustomerName, Product, Quantity)
VALUES(101, 'Jane Smith', 'IPhone', 2),
       (101, 'Derrick Jones', 'Mouse', 1),
       (102, 'Ellan Ronadlo', 'Tablet', 3),
       (102, 'Evans James', 'Keyboard', 1),
       (102, 'John Matthews', 'Mouse', 2),
       (103, 'Caleb Makayla', 'Phone', 1);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);


INSERT INTO Orders (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName FROM OrderDetails;

CREATE TABLE OrderProducts (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


INSERT INTO OrderProducts (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity FROM OrderDetails;

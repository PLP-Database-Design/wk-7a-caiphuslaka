-- Question1
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(255),
    Product VARCHAR(255)
);


INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(89, 'Jacob Matthews', 'Laptop'),
(90, 'Issabel Daysen', 'Mouse'),
(91, 'Evans Jasons', 'Tablet'),
(98, 'Brenda Mandela', 'Keyboard'),
(92, 'Iran Mackyla', 'Mouse'),
(93, 'Iyan Reigns', 'Phone');


SELECT * FROM ProductDetail_1NF;

-- Question2
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(255) UNIQUE
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


INSERT INTO Customers (CustomerName)
SELECT DISTINCT CustomerName
FROM OrderDetails;


INSERT INTO Orders (OrderID, CustomerID)
SELECT DISTINCT od.OrderID, c.CustomerID
FROM OrderDetails od
JOIN Customers c ON od.CustomerName = c.CustomerName;


INSERT INTO OrderItems (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;


SELECT * FROM Customers;
SELECT * FROM Orders;
SELECT * FROM OrderItems;

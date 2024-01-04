/* SQL queries for creating table for the spanner database */
CREATE TABLE Customers (
    CustomerID INT64 NOT NULL,
    CustomerName STRING(255),
    CustomerEmail STRING(255),
    CustomerAddress STRING(255),
    CustomerNumber INT64,
) PRIMARY KEY (CustomerID);

CREATE TABLE Orders (
    OrderID INT64 NOT NULL,
    CustomerID INT64 NOT NULL,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
) PRIMARY KEY (OrderID);

CREATE TABLE Products (
    ProductID INT64 NOT NULL,
    Barcode STRING(255),
    ProductCode STRING(255),
    ProductName STRING(255),
    ProductCategory STRING(255),
) PRIMARY KEY (ProductID);

CREATE TABLE OrderDetails (
    OrderDetailID INT64 NOT NULL,
    OrderID INT64 NOT NULL,
    ProductID INT64 NOT NULL,
    OrderQuantity INT64,
    ExpectedDate DATE,
    ActualDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
) PRIMARY KEY (OrderDetailID);

/* SQL queries for populating the tables with example values */
INSERT INTO Customers (CustomerID, CustomerName, CustomerEmail, CustomerAddress, CustomerNumber)
VALUES
    (1, 'Alice Smith', 'alice.smith@example.com', '123 Maple Street', 1234567890),
    (2, 'Bob Jones', 'bob.jones@example.com', '456 Oak Street', 2345678901),
    (3, 'Charlie Brown', 'charlie.brown@example.com', '789 Pine Street', 3456789012),
    (4, 'Diana Prince', 'diana.prince@example.com', '159 Elm Street', 4567890123),
    (5, 'Ethan Hunt', 'ethan.hunt@example.com', '753 Willow Street', 5678901234);

INSERT INTO Orders (OrderID, CustomerID, OrderDate)
VALUES
    (1, 1, '2023-01-01'),
    (2, 2, '2023-01-02'),
    (3, 3, '2023-01-03'),
    (4, 4, '2023-01-04'),
    (5, 5, '2023-01-05');

INSERT INTO Products (ProductID, Barcode, ProductCode, ProductName, ProductCategory)
VALUES
    (1, '123456789012', 'ABC123', 'Blank Hoodie Black', 'Hoodies'),
    (2, '234567890123', 'DEF456', 'Blank Hoodie Brown', 'Hoodies'),
    (3, '345678901234', 'GHI789', 'Blank Hoodie Green', 'Hoodies'),
    (4, '456789012345', 'JKL012', 'Blank Pants Black', 'Pants'),
    (5, '567890123456', 'MNO345', 'Blank Pants White', 'Pants');

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, OrderQuantity, ExpectedDate, ActualDate)
VALUES
    (1, 1, 1, 1, '2023-02-01', '2023-02-02'),
    (2, 2, 2, 2, '2023-02-03', '2023-02-04'),
    (3, 3, 3, 1, '2023-02-05', '2023-02-06'),
    (4, 4, 4, 1, '2023-02-07', '2023-02-08'),
    (5, 5, 5, 2, '2023-02-09', '2023-02-10');

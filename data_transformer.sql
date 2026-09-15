

create database data_transformer;
USE data_transformer;

-- CUSTOMERS TABLE
create table Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    RegistrationDate DATE
);


-- Insert Customer Data
INSERT INTO Customers VALUES
(1, 'John', 'Doe', ' john.doe@email.com ', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Mike', 'Brown', 'mike.brown@email.com', '2023-01-10'),
(4, 'Alice', 'Wilson', 'alice.wilson@email.com', '2023-05-20'),
(5, 'David', 'Lee', 'david.lee@email.com', '2024-02-15');


-- ORDERS TABLE

create table Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- Insert Order Data
INSERT INTO Orders VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 1, '2023-07-05', 750.00),
(104, 3, '2023-07-10', 1200.00),
(105, 4, '2023-07-15', 650.00),
(106, 5, '2023-07-20', 1800.00);


-- EMPLOYEES TABLE

create table Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2)
);


-- Insert Employee Data
INSERT INTO Employees VALUES
(1, 'Mark', 'Johnson', 'Sales', '2020-01-15', 50000.00),
(2, 'Susan', 'Lee', 'HR', '2021-03-20', 55000.00),
(3, 'Robert', 'Smith', 'IT', '2019-06-10', 70000.00),
(4, 'Emma', 'Brown', 'Finance', '2022-01-25', 45000.00),
(5, 'David', 'Wilson', 'IT', '2023-04-15', 65000.00);


-- INNER JOIN
-- Retrieve orders and customer details

SELECT
    Orders.OrderID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;


-- LEFT JOIN
-- Retrieve all customers and their orders

SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


-- RIGHT JOIN
-- Retrieve all orders and matching customers

SELECT
    Orders.OrderID,
    Orders.TotalAmount,
    Customers.FirstName,
    Customers.LastName
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


-- FULL OUTER JOIN

SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Orders.OrderID,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
UNION


SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Orders.OrderID,
    Orders.TotalAmount
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


-- Customers whose orders are greater than average order amount
SELECT DISTINCT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.TotalAmount >
      (SELECT AVG(TotalAmount) FROM Orders);



-- Employees with salary above average salary
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary
FROM Employees
WHERE Salary >
      (SELECT AVG(Salary) FROM Employees);


-- Extract Year and Month from OrderDate
SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;



-- Difference between OrderDate and Current Date
SELECT
    OrderID,
    OrderDate,
    CURDATE() AS CurrentDate,
    DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;



-- Format OrderDate as DD-MMM-YYYY
SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
FROM Orders;



-- Concatenate FirstName and LastName
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;



-- Replace 'John' with 'Jonathan'
SELECT
    FirstName,
    REPLACE(FirstName, 'John', 'Jonathan') AS NewName
FROM Customers;



-- FirstName in UPPERCASE
-- LastName in lowercase
SELECT
    UPPER(FirstName) AS UpperFirstName,
    LOWER(LastName) AS LowerLastName
FROM Customers;



-- Remove extra spaces from Email
SELECT
    Email AS OldEmail,
    TRIM(Email) AS CleanEmail
FROM Customers;



-- Running Total of TotalAmount
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate
    ) AS RunningTotal
FROM Orders;



-- Rank orders according to TotalAmount
SELECT
    OrderID,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;



-- Assign Discount using CASE
SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10% Discount'
        WHEN TotalAmount > 500 THEN '5% Discount'
        ELSE 'No Discount'
    END AS Discount
FROM Orders;



-- Categorize Employee Salary
SELECT
    EmployeeID,
    FirstName,
    Salary,
    CASE
        WHEN Salary >= 65000 THEN 'High'
        WHEN Salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees;
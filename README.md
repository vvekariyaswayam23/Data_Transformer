# 🗄️ Data Transformer – SQL Project

> 🚀 A beginner-friendly MySQL project for learning **SQL Queries, Joins, Functions, Subqueries, Window Functions, and CASE Statements**.

---

## 📌 Project Overview

🔹 **Project Name:** Data Transformer

🔹 **Database:** MySQL

🔹 **Tool Used:** MySQL Workbench

🔹 **Level:** Beginner Friendly

🔹 **Purpose:** Practice important SQL concepts using simple customer, order, and employee data.

---

## 🎯 What This Project Covers

✅ Database Creation

✅ Table Creation

✅ Primary Key

✅ Foreign Key

✅ Insert Data

✅ INNER JOIN

✅ LEFT JOIN

✅ RIGHT JOIN

✅ FULL OUTER JOIN using `LEFT JOIN + RIGHT JOIN + UNION`

✅ Subqueries

✅ Average Calculation

✅ Date Functions

✅ String Functions

✅ TRIM

✅ CONCAT

✅ UPPER / LOWER

✅ REPLACE

✅ Window Functions

✅ Running Total

✅ RANK

✅ CASE Statement

---

## 🏗️ Database Structure

### 👥 Customers Table

🔹 Stores customer information.

🔹 Columns include Customer ID, First Name, Last Name, Email, and Registration Date.

### 🛒 Orders Table

🔹 Stores customer order information.

🔹 Columns include Order ID, Customer ID, Order Date, and Total Amount.

🔹 `CustomerID` is connected to the Customers table using a Foreign Key.

### 👨‍💼 Employees Table

🔹 Stores employee information.

🔹 Columns include Employee ID, First Name, Last Name, Department, Hire Date, and Salary.

---

## 🔗 SQL JOIN Operations

### 1️⃣ INNER JOIN

🔹 Retrieves orders along with matching customer details.

```sql
SELECT
    Orders.OrderID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderDate,
    Orders.TotalAmount
FROM Orders
INNER JOIN Customers
ON Orders.CustomerID = Customers.CustomerID;
```

### 2️⃣ LEFT JOIN

🔹 Retrieves all customers and their matching orders.

```sql
SELECT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    Orders.OrderID,
    Orders.TotalAmount
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```

### 3️⃣ RIGHT JOIN

🔹 Retrieves all orders and their matching customer details.

```sql
SELECT
    Orders.OrderID,
    Orders.TotalAmount,
    Customers.FirstName,
    Customers.LastName
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
```

### 4️⃣ FULL OUTER JOIN

🔹 MySQL does not provide `FULL OUTER JOIN` directly.

🔹 This project demonstrates it using `LEFT JOIN`, `RIGHT JOIN`, and `UNION`.

---

## 📊 Subqueries

### 💰 Customers With Orders Above Average

🔹 Finds customers whose order amount is greater than the average order amount.

```sql
SELECT DISTINCT
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName
FROM Customers
JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.TotalAmount >
      (SELECT AVG(TotalAmount) FROM Orders);
```

### 👨‍💼 Employees With Above-Average Salary

🔹 Finds employees whose salary is greater than the average salary.

```sql
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary
FROM Employees
WHERE Salary >
      (SELECT AVG(Salary) FROM Employees);
```

---

## 📅 Date Functions

### 📆 Extract Year and Month

🔹 Uses `YEAR()` and `MONTH()` to extract date information.

```sql
SELECT
    OrderID,
    OrderDate,
    YEAR(OrderDate) AS OrderYear,
    MONTH(OrderDate) AS OrderMonth
FROM Orders;
```

### ⏳ Difference Between Dates

🔹 Uses `DATEDIFF()` to calculate the number of days between the order date and current date.

```sql
SELECT
    OrderID,
    OrderDate,
    CURDATE() AS CurrentDate,
    DATEDIFF(CURDATE(), OrderDate) AS DaysDifference
FROM Orders;
```

### 🗓️ Format Date

🔹 Formats the order date as `DD-MMM-YYYY`.

```sql
SELECT
    OrderID,
    OrderDate,
    DATE_FORMAT(OrderDate, '%d-%b-%Y') AS FormattedDate
FROM Orders;
```

---

## 🔤 String Functions

### 👤 Create Full Name

🔹 Combines First Name and Last Name using `CONCAT()`.

```sql
SELECT
    CustomerID,
    CONCAT(FirstName, ' ', LastName) AS FullName
FROM Customers;
```

### ✏️ Replace Name

🔹 Replaces `John` with `Jonathan`.

```sql
SELECT
    FirstName,
    REPLACE(FirstName, 'John', 'Jonathan') AS NewName
FROM Customers;
```

### 🔠 Change Letter Case

🔹 Converts First Name to uppercase.

🔹 Converts Last Name to lowercase.

```sql
SELECT
    UPPER(FirstName) AS UpperFirstName,
    LOWER(LastName) AS LowerLastName
FROM Customers;
```

### 🧹 Remove Extra Spaces

🔹 Uses `TRIM()` to remove unwanted spaces from Email values.

```sql
SELECT
    Email AS OldEmail,
    TRIM(Email) AS CleanEmail
FROM Customers;
```

---

## 📈 Window Functions

### ➕ Running Total

🔹 Calculates the running total of order amounts.

```sql
SELECT
    OrderID,
    OrderDate,
    TotalAmount,
    SUM(TotalAmount) OVER (
        ORDER BY OrderDate
    ) AS RunningTotal
FROM Orders;
```

### 🏆 Rank Orders

🔹 Ranks orders according to their total amount.

🔹 Highest amount gets the highest priority rank.

```sql
SELECT
    OrderID,
    TotalAmount,
    RANK() OVER (
        ORDER BY TotalAmount DESC
    ) AS OrderRank
FROM Orders;
```

---

## 🏷️ CASE Statement

### 💸 Assign Discount

🔹 Orders above 1000 get a 10% discount.

🔹 Orders above 500 get a 5% discount.

🔹 Other orders get no discount.

```sql
SELECT
    OrderID,
    TotalAmount,
    CASE
        WHEN TotalAmount > 1000 THEN '10% Discount'
        WHEN TotalAmount > 500 THEN '5% Discount'
        ELSE 'No Discount'
    END AS Discount
FROM Orders;
```

### 💼 Employee Salary Category

🔹 Salary `65000` or above → High

🔹 Salary `50000` or above → Medium

🔹 Below `50000` → Low

```sql
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
```

---

## 📸 Project Screenshots

### 🔗 Screenshot 1 – INNER JOIN

<img width="1076" height="719" alt="Screenshot 2026-09-15 200007" src="https://github.com/user-attachments/assets/001acaf2-f712-4f9a-a632-c1c7dd22f886" />


### 🔗 Screenshot 2 – LEFT JOIN

<img width="1078" height="719" alt="Screenshot 2026-09-15 200047" src="https://github.com/user-attachments/assets/c50382f2-5316-4f65-bd1a-d2a8cfbb0964" />


### 🔗 Screenshot 3 – RIGHT JOIN

<img width="1076" height="716" alt="Screenshot 2026-09-15 200113" src="https://github.com/user-attachments/assets/4e570816-25ff-4467-acf5-2b82c7483607" />


### 🔗 Screenshot 4 – FULL OUTER JOIN

<img width="1075" height="715" alt="Screenshot 2026-09-15 200142" src="https://github.com/user-attachments/assets/1a10db1b-64cd-4619-8803-cf0f43bd571b" />


### 🔗 Screenshot 5 – Subquery

<img width="1076" height="718" alt="Screenshot 2026-09-15 200227" src="https://github.com/user-attachments/assets/764e42c0-fe7c-46cf-8ea4-4d79875cae70" />




## 🎥 Project Video

▶️ **Watch the Project Demo:**  
[🎬 Click Here to Watch](https://1drv.ms/v/c/add06c1d01a88aae/IQB0O4vF0N6QQrB8mfSWIqxdAcArsnLzDMK43wkclt68cmc?e=Jz0XZS)



---

## 📂 Project Files

📄 `data_transformer.sql` → Complete SQL program

📁 `screenshots/` → Project screenshots

📄 `README.md` → Project documentation

---

## 🧠 Learning Outcomes

🎯 Learned how to create and use a MySQL database.

🎯 Learned how to create tables and insert data.

🎯 Learned how Primary Keys and Foreign Keys work.

🎯 Learned different types of SQL JOINs.

🎯 Learned how to use subqueries with `AVG()`.

🎯 Learned useful date and string functions.

🎯 Learned Window Functions like `SUM() OVER()` and `RANK()`.

🎯 Learned how to use `CASE` for conditional results.

---

## 🛠️ How to Run

### Step 1️⃣

Open **MySQL Workbench**.

### Step 2️⃣

Open `data_transformer.sql`.

### Step 3️⃣

Run the database and table creation queries.

### Step 4️⃣

Insert the sample data.

### Step 5️⃣

Run the required SQL queries.

### Step 6️⃣

Check the results in the **Result Grid**.

---

## ⭐ Project Highlights

💡 Simple SQL syntax

💡 Beginner-friendly database

💡 Practical JOIN examples

💡 Real-world style customer and order data

💡 Useful SQL functions

💡 Easy-to-understand queries

---

## 👨‍💻 Author

**Swayam Vekariya**

⭐ If you found this project useful, feel free to give it a **Star** on GitHub!

---

## 📜 License

This project is created for **learning and educational purposes**.

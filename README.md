# 📚 BookStore Analytics: SQL Intelligence Project

## 📋 Project Description
A comprehensive SQL-based analysis project focused on a retail bookstore database. This project demonstrates the ability to manage relational data, calculate business metrics, and extract actionable insights using **MS SQL Server**.

---

## 🛠️ Tech Stack
*   **Language:** SQL (T-SQL)
*   **Tools:** SQL Server Management Studio (SSMS) / Azure Data Studio
*   **Concepts:** Joins, Aggregations, Subqueries, Date Functions, and Data Cleaning.

---

## 🏗️ Database Schema
The analysis is performed across three primary tables:
1.  **Books:** (Book_id, Title, Author, Genre, Published_Year, Price, Stock)
2.  **Customers:** (Customer_id, Name, Email, Phone, City, Country)
3.  **Orders:** (Order_id, Customer_id, Book_id, Order_Date, Quantity, Total_Amount)

---

## 🚀 Key Queries & Insights

### 1. Inventory Monitoring
Calculates real-time stock by evaluating current inventory against total units sold.
```
SELECT 
    B.Book_id,
    B.Title,
    B.Stock - COALESCE(SUM(O.Quantity), 0) AS [Remaining Stock]
FROM Books B
LEFT JOIN Orders O ON B.Book_id = O.Book_id
GROUP BY B.Book_id, B.Title, B.Stock;
```

### 2. High-Value Customer Identification
Retrieves the city locations of customers who have made purchases exceeding $30.
```
SELECT DISTINCT C.City
FROM Customers C
JOIN Orders O ON C.Customer_id = O.Customer_id
WHERE O.Total_Amount > 30;
```
### 3. Sales Performance by Genre
Aggregates sales data to identify which genres are driving the most volume.
```
SELECT 
    B.Genre, 
    SUM(O.Quantity) AS [Total Sold]
FROM Books B
INNER JOIN Orders O ON B.Book_id = O.Book_id
GROUP BY B.Genre;
```
### How to use this on GitHub:
1.  Go to your repository and click **Add file** > **Create new file**.
2.  Name the file `README.md`.
3.  Paste the code above into the **Edit** box.
4.  Click the **Preview** tab at the top to see how beautiful it looks!

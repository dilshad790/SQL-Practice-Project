CREATE DATABASE STORE;
USE STORE;

-- Basic Queries

SELECT * FROM Orders;
SELECT * FROM Customers;
SELECT * FROM Books;
DROP TABLE Books;
-- 1 Retrieve all books in the "Fiction" Genre
SELECT * FROM Books 
WHERE Genre='Fiction';

-- 2 Find the books published after 1950
SELECT * FROM Books
WHERE Published_year>1950;

-- 3 List all customers from canada
SELECT * FROM Customers
WHERE country='canada';

-- 4 Show order placed in November 2023
SELECT * FROM ORDERS
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30';

-- OR
SELECT * FROM ORDERS
WHERE YEAR(order_date)=2023
AND MONTH(order_date)=11;

-- 5 Retrieve tota stock of books availabe after order
SELECT books.Book_id,Books.title,Books.stock-COALESCE(SUM(orders.quantity),0) AS "Remaining stock"
FROM Books  LEFT JOIN orders ON books.book_id=orders.book_id
GROUP BY books.Book_id,Books.title,Books.stock;

-- 6 Find the details of the most expensive books
SELECT *
FROM Books AS B 
WHERE price=(SELECT MAX(price) FROM Books);

-- OR 

SELECT TOP 1* FROM Books
ORDER BY price DESC;

-- 6 Show all customers who ordered more than 1 quantity of a book
SELECT * FROM Orders
WHERE quantity>1;

-- 7 List all genre available in Books table
SELECT Genre FROM Books;

-- 8 Find the book with lowest stock
SELECT * FROM Books
WHERE stock=(SELECT MIN(stock) FROM Books);

-- OR
SELECT TOP 1 * FROM Books
ORDER BY stock ASC;

-- 9 Calculate Total revenue generate by from all order
SELECT SUM(total_Amount) AS [Total Revenue] 
FROM Orders;

--- Advance Queries
-- 1 Retrieve total number of books sold for each genre
SELECT Books.genre ,SUM(Orders.Quantity) AS Sold
FROM Books LEFT JOIN Orders
ON books.book_id=Orders.book_id
Group By Genre;

-- 2 Find the average price of books in "Fantasy" genre

SELECT AVG(price) AS [AVG Price Of Books] FROM Books
WHERE Genre='Fantasy';

-- 3 List Customers who placed atleat 2 orders
SELECT * FROM orders
WHERE Quantity>2;

-- 4 Find most frequent ordered books
SELECT Top 1 Books.title,Orders.quantity
FROM Orders JOIN Books
ON Orders.Book_id=books.book_id
Order by quantity DESC;

--OR 

-- 4 Find most frequent ordered books
SELECT Top 1 Books.title,Orders.quantity
FROM Orders JOIN Books
ON Orders.Book_id=books.book_id
Where Orders.Quantity=(SELECT MAX(Orders.quantity) FROM Orders);

-- 5 SHOW TOP 3 MOST EXPENSIVE BOOKS
SELECT TOP 3 * FROM BOOKS
ORDER BY Price DESC;

--6 Retrieve total quantity of books sold by each author
SELECT books.author,books.title,COALESCE (SUM(Orders.quantity),0) AS [Total Quantity]
FROM Books Left Join Orders
ON Books.Book_id=Orders.Book_id
Group BY books.author,books.title;

--7 List the cities where customers who spent over 30 dollar are located
SELECT customers.city
FROM customers JOIN Orders
ON Customers.customer_id=Orders.customer_id
WHERE Orders.total_Amount>30;

-- 8 Find the customers who spent most on orders
SELECT TOP 1 Customers.name
FROM customers JOIN orders
ON Orders.customer_id=customers.customer_id
Order by orders.Quantity DESC;


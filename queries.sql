-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.
SELECT s.SalesId, e.EmployeeId, s.CustomerId, p.ProductId, s.Quantity, CONCAT(e.FirstName, ' ', e.MiddleInitial, ' ', e.LastName) as Customer_Name, p.Name, p.Price FROM sales as s JOIN employees as e ON s.SalesPersonId = e.EmployeeId JOIN products as p ON s.ProductId = p.ProductId;

-- 2a. Create a View for the query you made in Problem 1 named "all_sales"
-- NOTE: You'll want to remove any duplicate columns to clean up your view!

CREATE VIEW ALL_SALES AS SELECT s.SalesId, e.EmployeeId, s.CustomerId, p.ProductId, s.Quantity, CONCAT(e.FirstName, ' ', e.MiddleInitial, ' ', e.LastName) as Employee_Name, p.Name, p.Price FROM sales as s JOIN employees as e ON s.SalesPersonId = e.EmployeeId JOIN products as p ON s.ProductId = p.ProductId;

-- 2b. Test your View by selecting all rows and columns from the View
SELECT * FROM ALL_SALES;

-- Problem 3
-- Find the average sale amount for each sales person
SELECT EmployeeId, Employee_Name, AVG(price * quantity) as Average_Sale FROM ALL_SALES GROUP BY EmployeeId ORDER BY Average_Sale DESC; 

-- Problem 4
-- Find the top three sales persons by total sales
SELECT EMPLOYEE_NAME, QUANTITY FROM ALL_SALES GROUP BY EMPLOYEE_NAME ORDER BY QUANTITY DESC limit 3; 

-- Problem 5
-- Find the product that has the highest price
SELECT productid, PRICE FROM ALL_SALES ORDER BY PRICE DESC limit 1;

-- Problem 6
-- Find the product that was sold the most times
SELECT MAX(NAME) , MAX(PRODUCTID), salesid FROM ALL_SALES order by NAME DESC;

-- Problem 7
-- Using a subquery, find all products that have a price higher than the average price for all products
SELECT NAME, PRODUCTID, PRICE FROM ALL_SALES WHERE PRICE > (SELECT AVG(PRICE) FROM ALL_SALES) GROUP BY PRODUCTID;
-- 528.21

-- Problem 8
-- Find the customer who spent the most money in purchased products
SELECT CUSTOMERID, PRICE FROM ALL_SALES GROUP BY CUSTOMERID ORDER BY PRICE DESC limit 1;

-- Problem 9
-- Find the total number of sales for each sales person
SELECT COUNT(SALESID), EMPLOYEE_NAME FROM ALL_SALES GROUP BY EMPLOYEE_NAME ORDER BY COUNT(SALESID) DESC;

-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8
SELECT CUSTOMERID, PRICE, EMPLOYEE_NAME FROM ALL_SALES GROUP BY CUSTOMERID ORDER BY EMPLOYEE_NAME DESC;
SELECT CUSTOMERID, EMPLOYEE_NAME, EMPLOYEEID FROM ALL_SALES WHERE CUSTOMERID = 18723 GROUP BY EMPLOYEE_NAME;


-- select sum(quantity) from all_sales; = 487250
-- select employee_name, salesid, quantity from all_sales group by employee_name;

select employee_name, SUM(PRICE)  from all_sales GROUP BY EMPLOYEE_NAME;
-- 3971.39
SELECT EMPLOYEE_NAME, COUNT(SALESID) FROM all_sales GROUP BY EMPLOYEE_NAME;
-- 51

SELECT * FROM all_sales where employeeid = 6;

select * from all_sales group by name order by quantity desc;
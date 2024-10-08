-- COUNT
SELECT COUNT(CustomerID) AS TOTAL_CUSTOMER
FROM planetarygoods.customers;

SELECT COUNT(DISTINCT City)
 FROM planetarygoods.customers;
 
 -- SUM, AVG, MIN, MAX
 SELECT MAX(TotalPaid) AS TOTAL_SALES
 FROM planetarygoods.orders;
 
 -- Group By
SELECT ProductID, COUNT(OrderID) AS TOTAL_ORDER_ID, SUM(Quantity) AS TOTAL
FROM planetarygoods.orderdetails
GROUP BY ProductID
ORDER BY TOTAL DESC;

-- Total sales of each product
SELECT ProductID, SUM(FinalTotal) AS TOTAL_SALES
FROM planetarygoods.orderdetails
GROUP BY ProductID
ORDER BY TOTAL_SALES ASC;

-- Cities with the highest user consentration.
SELECT City, COUNT(*) AS NUMBER_OF_CUSTOMER
FROM planetarygoods.customers
GROUP BY City 
ORDER BY NUMBER_OF_CUSTOMER DESC;

-- Top 3 products with highest total sales value
SELECT ProductID, SUM(Quantity) AS TOTAL_QUANTITY, 
SUM(FinalTotal) AS TOTAL_SALES 
FROM planetarygoods.orderdetails
GROUP BY ProductID
ORDER BY TOTAL_QUANTITY DESC
LIMIT 3;

-- Grouping with multiple columns
SELECT Country, City, COUNT(CustomerID) AS NUMBER_OF_CUSTOMER 
FROM planetarygoods.customers
GROUP BY Country, City
ORDER BY NUMBER_OF_CUSTOMER DESC;

-- HAVING clause (Used After the Group BY) 
-- WHERE clause (Used After the Group BY)
SELECT Country, City, COUNT(CustomerID) AS NUMBER_OF_CUSTOMER 
FROM planetarygoods.customers
GROUP BY Country, City
HAVING COUNT(CustomerID) >= 1
ORDER BY NUMBER_OF_CUSTOMER DESC;

-- customers ordered > 1000$
SELECT CustomerID, SUM(TotalPaid) AS TOTAL_ORDER_VALUE
FROM planetarygoods.orders
GROUP BY CustomerID
HAVING TOTAL_ORDER_VALUE > 1000;

-- customers placed more than 5 orders
SELECT CustomerID, COUNT(OrderID) AS TOTAL_ORDERS 
FROM planetarygoods.orders
GROUP BY CustomerID
HAVING TOTAL_ORDERS > 2;

-- Average total for each customer
SELECT CustomerID, AVG(TotalPaid)
FROM planetarygoods.orders
GROUP BY CustomerID;

-- Nested Aggregation
-- Products that are sold more than avg quantity sold
SELECT ProductID, SUM(Quantity) AS TOTAL_QUANTITY 
 FROM planetarygoods.orderdetails
 GROUP BY ProductID
 HAVING SUM(Quantity) > (
	SELECT AVG(Quantity) 
  FROM planetarygoods.orderdetails
 );

-- When finding avg NULL values also be considered. So coalesce should be used.
SELECT AVG(coalesce(price, 0)) AS AVG_PRICE
FROM planetarygoods.products;


/* 
	BUSINESS REPOTING
*/
SELECT month(OrderDate) AS MONTH,
	year(OrderDate) AS YEAR,
  SUM(TotalPaid) AS TOTAL_SALES
 FROM planetarygoods.orders
 GROUP BY year(OrderDate), month(OrderDate);
/*
	SELECT COLUMN_NAME(S)
  FROM TABLE1
  INNTER JOIN TABLE2
  ON TABLE1.COLUMN_NAME = TABLE2.COLUMN_NAME
*/

-- first name, last name, order id
SELECT C.CustomerID, C.FirstName, C.LastName, O.OrderID
FROM planetarygoods.customers C
INNER JOIN planetarygoods.orders O
ON C.CustomerID = O.CustomerID;

-- CUSTOMERS, ORDER, ORDERDETAILS, PRODUCT
SELECT C.FirstName, 
			 C.LastName,
       P.ProductName,
       SUM(OD.Quantity) AS TOATL_QUANTITY
FROM planetarygoods.customers C
	INNER JOIN planetarygoods.orders O ON C.CustomerID = O.CustomerID
  INNER JOIN planetarygoods.orderdetails OD ON  O.OrderID = OD.OrderID
  INNER JOIN planetarygoods.products P ON OD.ProductID = P.ProductID
  GROUP BY C.FirstName, C.LastName, P.ProductName;
  
-- Name and total order amount for each product sold
SELECT P.productId,
			 P.productName,
       SUM(OD.FinalTotal) AS TOTAL_ORDER_AMOUNT
	FROM planetarygoods.products P
  INNER JOIN planetarygoods.orderdetails OD ON P.ProductID = OD.ProductID
  GROUP BY P.ProductID, P.ProductName;
  
  
/*
	SELECT COLUMN_NAME(S)
  FROM TABLE1
  LEFT JOIN TABLE2
  ON TABLE1.COLUMN_NAME = TABLE2.COLUMN_NAME
*/

-- List all the Customers Along with their Order Information
SELECT C.CustomerID, C.firstname, C.lastname, O.orderid
FROM planetarygoods.customers C
LEFT JOIN planetarygoods.orders O ON C.CustomerID = O.CustomerID;

-- Total quantity of each product
SELECT P.ProductId, P.ProductName, coalesce(SUM(OD.Quantity), 0) AS TOTAL_QUANTITY_ORDER
FROM planetarygoods.products P
LEFT JOIN planetarygoods.orderdetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TOTAL_QUANTITY_ORDER DESC;


/*
	SELECT COLUMN_NAME(S)
  FROM TABLE1
  RIGHT JOIN TABLE2
  ON TABLE1.COLUMN_NAME = TABLE2.COLUMN_NAME
*/

-- All the orders With Associated Customers
SELECT O.OrderId, C.Firstname, C.Lastname, C.CustomerId
FROM planetarygoods.orders O 
RIGHT JOIN planetarygoods.customers C ON O.CustomerID = C.CustomerID;

/*
	On/Using:
  	SELECT COLUMN_NAME(S)
		FROM TABLE1
		INNER JOIN TABLE2
		USING (COLUMN_NAME);
*/

SELECT C.FirstName, C.LastName, O.OrderID
FROM planetarygoods.customers C
INNER JOIN planetarygoods.orders O
USING(CustomerID);


-- SELF JOIN:
-- Find Products whose Id's are not same but Price are Same

SELECT A.ProductName,
			 B.ProductName,
       A.Price
FROM planetarygoods.products A 
JOIN planetarygoods.products B
ON A.ProductID <> B.ProductID AND A.Price = B.Price;

-- Finding Product With Same Name
SELECT A.ProductName,
			 B.ProductName
       
FROM planetarygoods.products A 
JOIN planetarygoods.products B
ON left(A.ProductName, 3) = left(B.ProductName, 3)
	AND A.ProductID <> B.ProductID
ORDER BY A.ProductName, B.ProductName;

-- Customer Living in the Same Cities
SELECT C1.CustomerID,
			 C1.FirstName AS Customer1,
       C2.FirstName AS Customer2,
			 C1.City
       
FROM planetarygoods.customers C1
	JOIN planetarygoods.customers C2
ON C1.City = C2.City AND C1.CustomerID <> C2.CustomerID
ORDER BY City;


/* Cross Join:
(To Combine all the rows of any two or more TABLE irrespective 
of any relation between the columns in the table.)*/
SELECT C.FirstName, P.ProductName
FROM planetarygoods.customers C 
CROSS JOIN planetarygoods.products P;

/* Natural Join:
SQL engine explicitly identify the common Column for On condition
to join.*/
SELECT * FROM planetarygoods.orders
NATURAL JOIN planetarygoods.orderdetails;

SELECT * FROM planetarygoods.orders O
INNER JOIN planetarygoods.orderdetails OD
ON O.OrderID = OD.OrderID;

-- firstname, orderdate, productName and Final total 

SELECT C.FirstName AS FIRS_TNAME,
			 O.OrderDate AS ORDER_DATE,
       P.ProductName AS PRODUCT_NAME,
       OD.FinalTotal AS FINAL_TOTAL
       
 FROM planetarygoods.orderdetails OD
 INNER JOIN planetarygoods.orders O ON O.OrderID = OD.OrderID
 INNER JOIN planetarygoods.products P ON P.ProductID = OD.ProductID
 INNER JOIN planetarygoods.customers C ON C.CustomerID = O.CustomerID;
 
-- firstName, LastName, ProductName, SupplierName, FinalTotal
SELECT C.CustomerID,
			 C.FirstName AS FIRST_NAME,
			 C.LastName AS LAST_NAME,
       P.ProductName AS PRODUCT_NAME,
       S.SupplierName AS SUPPLIER_NAME,
       OD.FinalTotal AS FINAL_TOTAL
       
 FROM planetarygoods.orders O 
 INNER JOIN planetarygoods.orderdetails OD ON OD.OrderID = O.OrderID
 INNER JOIN planetarygoods.customers C ON C.CustomerID = O.CustomerID
 INNER JOIN planetarygoods.products P ON P.ProductID = OD.ProductID
 INNER JOIN planetarygoods.suppliers S ON S.SupplierID = P.SupplierID
 LIMIT 10;
 
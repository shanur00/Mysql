USE PLANETARYGOODS;

SELECT productname, price, price * 0.1 AS DISCOUNT
FROM planetarygoods.products;

/* <> means !=
*/
SELECT * FROM planetarygoods.products
WHERE Price <> 19.99;

SELECT * FROM planetarygoods.customers
WHERE country = 'USA' AND city = 'New York City' AND FirstName = 'John';

SELECT * FROM planetarygoods.orders
WHERE (TotalPaid>10) 
AND (OrderDate > '2023-01-01');

SELECT * FROM planetarygoods.products
WHERE (Category='Accessories') AND (Price < 30);

SELECT * FROM planetarygoods.customers
WHERE Country = 'USA' OR Country = 'CANADA' OR Country = 'MAXICO'; 

SELECT * FROM planetarygoods.products
	WHERE (Category = 'Accessories' 
  OR Category = 'Optics')
	AND InStockQuantity < 20;
  
SELECT * FROM planetarygoods.customers
WHERE NOT Country = 'USA';

SELECT * FROM planetarygoods.customers
WHERE Country = 'USA' 
	OR Country = 'CANADA' 
  OR Country = 'MAXICO'; 
  
/*
	IN is used when multiple value is matched again single Column Only.
*/
SELECT * FROM planetarygoods.customers
WHERE Country IN ('USA', 'CANADA', 'UK');

SELECT * FROM planetarygoods.customers
WHERE Country NOT IN ('USA', 'CANADA', 'UK');

SELECT concat(Firstname,' ',Lastname) AS CUSTOMER_NAME,
	Email FROM planetarygoods.customers
  WHERE Country IN ('USA','CANADA','MEXICO');

SELECT ProductName, Price, Category FROM planetarygoods.products
WHERE Category IN ('Accessories', 'Optics');

SELECT * FROM planetarygoods.products
WHERE Price BETWEEN 5 AND 20;

SELECT * FROM planetarygoods.products
WHERE (Category = 'Home Decor') 
AND (Price >= 20 AND Price <= 100); 

/*
	LIKE operator for finding pattern.
  
  % --> Represent zero, One or Multiple characters.
  _--> Respresents a Single character.
*/

SELECT * FROM planetarygoods.customers
WHERE FirstName LIKE 'JO%';

SELECT * FROM planetarygoods.customers
WHERE FirstName LIKE '_O%';

-- All the product name ends with 'pro'
SELECT * FROM planetarygoods.products
WHERE ProductName LIKE '%PRO';

-- All the customer's name having exactly five letter.
SELECT * FROM planetarygoods.customers
WHERE FirstName LIKE 'A%O';

-- Escape VALUES used to nullify the inbuit meaning of (%) used in pattern matching.
SELECT * FROM planetarygoods.products
WHERE ProductName LIKE '%5!%%' ESCAPE '!';

-- Searching products with starting name "Stars".
SELECT * FROM planetarygoods.products
WHERE ProductName LIKE 'Star%';

SELECT COUNT(*) FROM planetarygoods.customers
WHERE Address IS NULL;

-- Nested Where Clauses

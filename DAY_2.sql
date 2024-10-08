/*
Product Diversity: The Marketing team wants to grasp the variety 
of our product portfolio. Write a SQL query to retrieve all unique 
product categories and subcategories from the Products table. 
Ensure each combination is listed only once to prevent duplications.
*/
SELECT DISTINCT Category, SubCategory
FROM Products;

/*
Customer Report: For the campaign's customer segmentation strategy, 
the team needs a detailed report about our customers. Write a SQL 
query to retrieve customers' names, their email addresses, and 
their demographic information. Present 
the data using descriptive column names.
*/
SELECT 
    CONCAT(FirstName, ' ', LastName) AS CustomerName,
    Email AS CustomerEmail,
    Address AS CustomerAddress,
    City AS CustomerCity,
    State AS CustomerState,
    Country AS CustomerCountry
FROM Customers
ORDER BY CustomerName;

/*
Incomplete Customer Information: Sometimes customers do not provide 
their address details when registering. For future communication 
and shipping purposes, the team plans a separate campaign to 
request updated information. Write a SQL query to get details of 
customers who have not provided a address.
*/
SELECT firstname, lastname,
	concat(coalesce(address, ' '),', ',
  coalesce(city,', '),', ', 
  coalesce(state, ', '),', ', 
  coalesce(country, ' ')) AS ADDRESS 
FROM planetarygoods.customers;

/*
Pricing review: As part of an internal review, you need to analyze 
the pricing of all products at "PlanetaryGoods". For this purpose, 
you require a list of all products sorted by price, from the 
highest to lowest.
*/
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC;

/*
Premium Products: You are preparing a shortlist of premium products 
for the next marketing email. You want to feature the top 5 most 
expensive items in the store.
*/
SELECT ProductName, Price
FROM Products
ORDER BY Price DESC
LIMIT 5;

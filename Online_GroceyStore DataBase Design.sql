-- -- Queries to extract specified Data


-- QUESTIONS --

--  1 Identify customers who have not completed a purchase/delivery survey in the last
-- 2 months. Display the customer name and email. Use a nested select to answer
-- this question.
	SELECT customer_first, customer_last, customer_email
FROM Customers
WHERE CustomerID NOT IN (
    SELECT CustomerID
    FROM OrderSurveys
    WHERE SurveyDate >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
);

 -- 2.Identify the most popular product purchased in the last 2 months. Display four
-- columns: warehouse, product name, product type and number of orders. Display
-- one distinct row for each warehouse, product and product type. Display the
-- product with the most orders first.
		SELECT
    warehouse_address AS "Warehouse",
    product_Name AS "Product Name",
    product_Type AS "Product type",
    COUNT(orderDetails.OrderID) AS number_of_orders
FROM
    Orders,Warehouses,OrderDetails,Products,Inventory
where
    OrderDetails.OrderID = Orders.OrderID
AND
    Products.ProductID = OrderDetails.ProductID
AND
    Inventory.ProductID = Products.ProductID
AND
    Warehouses.WarehouseID = Inventory.WarehouseID
AND
    Orders.OrderDate >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH)
GROUP BY
    warehouses.warehouse_address,
    products.product_Name,
    products.product_Type
ORDER BY
number_of_orders;
 

-- 3. Identify customers with the most purchases of fruits in the last month by customer
-- location. Display five rows in your output – one row for each borough. Display
-- three columns: borough, number of orders, total dollar amount of order. The
-- borough with the most orders is displayed first
			SELECT
    customer_city AS borough,
    COUNT(Orders.OrderID) AS number_of_orders,
    SUM(OrderDetails.Price * Orderdetails.Quantity) AS total_dollar_amount
FROM
    Orders,OrderDetails,products,customers
WHERE
    OrderDetails.OrderID = Orders.OrderID
AND
    Products.ProductID = OrderDetails.ProductID
AND
    Customers.CustomerID = Orders.CustomerID
and
    products.product_Type = 'Fruit'
    AND Orders.OrderDate <= DATE_SUB(CURDATE(), INTERVAL 1 month)
GROUP BY
    customers.customer_city
ORDER BY
    number_of_orders DESC;
 

-- 4. Identify customers with no comments in the product survey. Display the
-- customer name.
	select customer_first , customer_last
    from 
    customers
    where customerID not in (
    select customerID 
    from  OrderSurveys
    );
 
    
   --  5. Search the open-ended narrative text/comments in the product and delivery
-- comments to identify personally identifiable information (PII). This includes any
-- data that could potentially be used to identify a person. For instance, examples of
-- PII include email address, date of birth, Social Security number, bank account
-- number, home address, and full name. Display the customer who created the
-- comment, date of comment and the comment. Order the output by customer
-- name.
SELECT
    customer_first,
    customer_last,
    SurveyDate AS comment_date,
    SurveyComment AS comment
FROM
    Customers,OrderSurveys
WHERE
    OrderSurveys.CustomerID = Customers.CustomerID
AND
    orderSurveys.SurveyComment LIKE '%@gmail.com%' 
    OR orderSurveys.SurveyComment LIKE '%123-456-7890%'
    OR orderSurveys.SurveyComment LIKE  '%John Doe%' 
    OR orderSurveys.SurveyComment  LIKE '%4178-%'
ORDER BY
    Customers.customer_first, customers.customer_last;

-- 6. Customers can view, but not change past orders. Create SQL to implement.
-- Demonstrate your implementation will not edit past orders by attempting to
-- change data. 
UPDATE Orders SET DeliveryAddress = '456 Changed Address' WHERE OrderID = 1;
-- ERROR 1142 (42000): UPDATE command denied to user 'customer_user'@'localhost' for table 'Orders'

-- 7. Using purchases made in the last week, identify customers with
-- dogs. Display the customer name and email. Order the output by
-- customer name.
SELECT DISTINCT
    customer_first,
    customer_last
     customer_email
FROM
    Customers, Orders, Products, OrderDetails
WHERE
    Orders.CustomerID = customers.CustomerID
AND
    OrderDetails.OrderID = Orders.OrderID
AND
    ProductS.ProductID = OrderDetails.ProductID
AND
    products.product_Type = 'Fruit'
    AND Orders.OrderDate <= NOW() - INTERVAL 1 month
ORDER BY
    customers.customer_first,
    customers.customer_last;
 
    
    -- 8. Identify staff with the most deliveries in the last week. Display two
-- columns: staff and number of deliveries. Display one row for each
-- distinct staff. Display the staff with the most deliveries first.
SELECT 
    CONCAT(staff.staff_first, ' ', staff.staff_last) AS staff_name,
    COUNT(Deliveries.DeliveryID) AS number_of_deliveries
FROM 
    Deliveries, Staff
WHERE 
    Staff.StaffID = Deliveries.StaffID
AND 
    Deliveries.DeliveryDate >= NOW() - INTERVAL 1 WEEK
GROUP BY 
    staff_name
ORDER BY 
    number_of_deliveries DESC;

-- 11. The product Raisin Bran is no longer being offered by the grocery store and being
-- available for 3 years. Identify the SQL to implement.
SELECT ProductID 
FROM Products 
WHERE product_Name = 'Raisin Bran';

DELETE FROM OrderDetails 
WHERE ProductID = (SELECT ProductID FROM Products WHERE product_Name = 'Raisin Bran');

DELETE FROM Inventory 
WHERE ProductID = (SELECT ProductID FROM Products WHERE product_Name = 'Raisin Bran');

DELETE FROM Products 
WHERE product_Name = 'Raisin Bran';


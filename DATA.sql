-- -- DATA FOR QUERING

INSERT INTO Customers (customer_first, customer_last, customer_state, customer_city, customer_address, BillingAddress, AccountNumber, customer_Password, customer_Phone, customer_email) VALUES
('John', 'Doe', 'NY', 'New York', '123 Main St', '123 Main St, New York, NY', 'ACC123', 'password123', '5551234567', 'john.doe@example.com'),
('Jane', 'Smith', 'NY', 'Brooklyn', '456 Elm St', '456 Elm St, Brooklyn, NY', 'ACC124', 'password124', '5557654321', 'jane.smith@example.com'),
('Michael', 'Johnson', 'NY', 'Queens', '789 Maple Ave', '789 Maple Ave, Queens, NY', 'ACC125', 'password125', '5552345678', 'michael.johnson@example.com'),
('Emily', 'Davis', 'NY', 'Bronx', '101 Pine Rd', '101 Pine Rd, Bronx, NY', 'ACC126', 'password126', '5558765432', 'emily.davis@example.com'),
('David', 'Miller', 'NY', 'Staten Island', '202 Oak Dr', '202 Oak Dr, Staten Island, NY', 'ACC127', 'password127', '5553456789', 'david.miller@example.com');
select * from customers;

INSERT INTO CustomerPaymentInfo (CustomerID, CreditCardNumber, ExpirationDate) VALUES
(1, '4111111111111111', '2025-05-01'),
(2, '4222222222222222', '2026-06-01'),
(3, '4333333333333333', '2027-07-01'),
(4, '4444444444444444', '2028-08-01'),
(5, '4555555555555555', '2029-09-01');

INSERT INTO Staff (staff_first, staff_last, staff_Address, staff_state, staff_city, staff_Email, staff_Department, JobHistory) VALUES
('Alice', 'Brown', '12 A St', 'NY', 'New York', 'alice.brown@example.com', 'Packing', 'Packer - $15/hr'),
('Bob', 'Wilson', '34 B St', 'NY', 'Brooklyn', 'bob.wilson@example.com', 'Delivery', 'Delivery Driver - $16/hr'),
('Charlie', 'Taylor', '56 C St', 'NY', 'Queens', 'charlie.taylor@example.com', 'Management', 'Manager - $20/hr'),
('Diana', 'Moore', '78 D St', 'NY', 'Bronx', 'diana.moore@example.com', 'Customer Service', 'Customer Service Rep - $14/hr'),
('Evan', 'Anderson', '90 E St', 'NY', 'Staten Island', 'evan.anderson@example.com', 'Inventory', 'Inventory Specialist - $17/hr');
select * from staff;


INSERT INTO Warehouses (warehouse_address, warehouse_city, warehouse_state, WarehouseType) VALUES
('100 Warehouse Ave', 'New York', 'NY', 'Refrigerated'),
('200 Warehouse Blvd', 'Brooklyn', 'NY', 'Dry Storage'),
('300 Warehouse Rd', 'Queens', 'NY', 'Refrigerated'),
('400 Warehouse Ln', 'Bronx', 'NY', 'Dry Storage'),
('500 Warehouse Dr', 'Staten Island', 'NY', 'Kitchen');
select * from warehouses;

INSERT INTO Products (product_Name, product_Type, Calories, Sodium, ExpirationDate) VALUES
('Raisin Bran', 'Cereal', 190, 220, '2024-12-31'),
('Apple', 'Fruit', 95, 2, '2024-06-01'),
('Chicken Breast', 'Meat', 165, 75, '2024-05-25'),
('Milk', 'Dairy', 150, 120, '2024-06-10'),
('Salmon', 'Dog Food', 208, 59, '2024-05-22'),
('Banana', 'Fruit', 208, 59, '2024-05-22');
select * from products;

INSERT INTO Inventory (ProductID, WarehouseID, Quantity) VALUES
(1, 1, 100),
(2, 2, 150),
(3, 3, 200),
(4, 4, 250),
(5, 5, 100);
select * from inventory;

INSERT INTO Orders (CustomerID, DeliveryAddress, PaymentMethod, OrderDate) VALUES
(1, '123 Main St, New York, NY', 'Credit Card', '2024-06-01'),
(2, '456 Elm St, Brooklyn, NY', 'Credit Card', '2021-05-02'),
(3, '789 Maple Ave, Queens, NY', 'Debit Card', '2023-05-03'),
(4, '101 Pine Rd, Bronx, NY', 'PayPal', '2024-02-04'),
(5, '202 Oak Dr, Staten Island, NY', 'Credit Card', '2024-05-05');
select * from orders;

INSERT INTO OrderDetails (OrderID, ProductID, Price, Quantity) VALUES
(1, 1, 4.99, 2),
(2, 2, 0.50, 5),
(3, 3, 7.99, 3),
(4, 4, 3.49, 1),
(5, 5, 12.99, 2);
select * from orderDetails;

INSERT INTO Deliveries (OrderID, StaffID, DeliveryDate) VALUES
(1, 1, '2021-05-02'),
(2, 2, '2024-01-03'),
(3, 3, '2024-02-04'),
(4, 4, '2024-04-05'),
(5, 5, '2024-09-06');
select * from deliveries;

INSERT INTO ProductRatings (CustomerID, ProductID, RatingMethod, RatingValue, RatingDate, RatingComment) VALUES
(1, 1, 'Stars', '5', '2024-01-02', 'Great cereal, very tasty!'),
(2, 2, 'Stars', '4', '2024-03-03', 'Fresh and juicy apples.'),
(3, 3, 'Stars', '3', '2024-08-04', 'Chicken was okay.'),
(4, 4, 'Stars', '5', '2024-01-05', 'Milk was very fresh.'),
(5, 5, 'Stars', '4', '2021-05-06', 'Good quality salmon.');
select * from productRatings;

INSERT INTO OrderSurveys (OrderID, CustomerID, SurveyDate, SurveyMethod, SurveyValue, SurveyComment) VALUES
(1, 1, '2024-05-03', 'Stars', '5', 'Great service, contact me at john.doe@gmail.com'),
(2, 2, '2024-05-04', 'Stars', '4', 'Good experience, my phone number is 123-456-7890'),
(3, 3, '2024-05-05', 'Stars', '3', 'Average service. Regards, John Doe'),
(4, 4, '2024-05-06', 'Stars', '5', 'Excellent, but my account 4178-xxxx-xxxx needs updating'),
(5, 5, '2024-05-07', 'Stars', '4', 'Good service, nothing to report here.');
select * from OrderSurveys;

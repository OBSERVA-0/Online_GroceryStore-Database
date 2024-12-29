Show databases;
CREATE DATABASE grocery_store;
USE grocery_store;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    customer_first VARCHAR(50),
    customer_last VARCHAR(50),
    customer_state char(2),
    customer_city varchar(50),
    customer_address varchar(100),
    BillingAddress VARCHAR(200),
    AccountNumber VARCHAR(50) UNIQUE,
    customer_Password VARCHAR(50),
    customer_Phone CHAR(10),
    customer_email varchar(100)
);


CREATE TABLE CustomerPaymentInfo (
    PaymentInfoID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    CreditCardNumber VARCHAR(20),
    ExpirationDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    staff_first VARCHAR(50),
    staff_last VARCHAR(50),
    staff_Address VARCHAR(100),
    staff_state CHAR(2),
    staff_city VARCHAR(20),
    staff_Email VARCHAR(100),
    staff_Department VARCHAR(50),
    JobHistory VARCHAR(500)
);

CREATE TABLE Warehouses (
    WarehouseID INT AUTO_INCREMENT PRIMARY KEY,
    warehouse_address VARCHAR(100),
    warehouse_city VARCHAR(50),
    warehouse_state CHAR(2),
    WarehouseType VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    product_Name VARCHAR(50),
    product_Type VARCHAR(50),
    Calories INT,
    Sodium INT,
    ExpirationDate DATE
);

CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    WarehouseID INT,
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    DeliveryAddress TEXT,
    PaymentMethod VARCHAR(50),
    OrderDate date,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Price DECIMAL(10, 2),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Deliveries (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    StaffID INT,
    DeliveryDate date,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE ProductRatings (
    RatingID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
	RatingMethod VARCHAR(50),
    RatingValue VARCHAR(10),
    RatingDate date,
    RatingComment TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE OrderSurveys (
    SurveyID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    CustomerID INT,
    SurveyDate date,
    SurveyMethod VARCHAR(50),
    SurveyValue VARCHAR(10),
    SurveyComment TEXT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- --RBAC-- ROLE BASED ACCESS CONTROL

CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_password';
CREATE USER 'staff_user'@'localhost' IDENTIFIED BY 'staff_password';
CREATE USER 'customer_user'@'localhost' IDENTIFIED BY 'customer_password';

GRANT ALL PRIVILEGES ON grocery_store.* TO 'admin_user'@'localhost' WITH GRANT OPTION;
GRANT SELECT, INSERT, UPDATE ON grocery_store.Customers TO 'staff_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON grocery_store.Products TO 'staff_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON grocery_store.OrderDetails TO 'staff_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON grocery_store.Deliveries TO 'staff_user'@'localhost';
GRANT SELECT, INSERT, UPDATE ON grocery_store.ProductRatings TO 'staff_user'@'localhost';
REVOKE DELETE ON grocery_store.Orders FROM 'staff_user'@'localhost';
REVOKE DELETE ON grocery_store.OrderDetails FROM 'staff_user'@'localhost';

CREATE VIEW StaffOrdersView AS
SELECT OrderID, CustomerID, DeliveryAddress, OrderDate
FROM Orders;

GRANT SELECT, INSERT, UPDATE ON grocery_store.StaffOrdersView TO 'staff_user'@'localhost';
REVOKE SELECT, INSERT, UPDATE, DELETE ON grocery_store.Orders FROM 'staff_user'@'localhost';
REVOKE DELETE ON grocery_store.OrderDetails FROM 'staff_user'@'localhost';
GRANT SELECT, INSERT ON grocery_store.ProductRatings TO 'customer_user'@'localhost';

CREATE VIEW CustomerOrdersView AS
SELECT OrderID, DeliveryAddress, OrderDate
FROM Orders;

GRANT SELECT ON grocery_store.CustomerOrdersView TO 'customer_user'@'localhost';















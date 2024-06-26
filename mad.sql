-- Create the PRODUCT table
CREATE TABLE PRODUCT (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(50),
    UnitPrice NUMBER(8,2),
    CONSTRAINT CHK_UnitPrice CHECK (UnitPrice >= 0)
);

-- Create the CUSTOMER table
CREATE TABLE CUSTOMER (
    CustomerID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    ContactName VARCHAR2(50),
    Address VARCHAR2(100),
    City VARCHAR2(50),
    PostalCode VARCHAR2(20),
    Country VARCHAR2(50)
);

-- Create the ORDERS table
CREATE TABLE ORDERS (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    OrderDate DATE DEFAULT SYSDATE,
    CONSTRAINT FK_CustomerID FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID)
);

-- Create the ORDER_DETAILS table
CREATE TABLE ORDER_DETAILS (
    OrderDetailID NUMBER PRIMARY KEY,
    OrderID NUMBER,
    ProductID NUMBER,
    Quantity NUMBER,
    CONSTRAINT FK_OrderID FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID),
    CONSTRAINT FK_ProductID FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID)
);
ALTER TABLE PRODUCT ADD Category VARCHAR2(20);

ALTER TABLE ORDERS ADD OrderDate DATE DEFAULT SYSDATE;

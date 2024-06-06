-- Insert data into the Customers table
INSERT INTO Customers (CustCode, CustName, CustAddress, CustTel)
VALUES ('C01', 'ABC Company', '123 Main Street', '555-1234'),
       ('C02', 'XYZ Corporation', '456 Oak Avenue', '555-5678'),
       ('C03', 'LMN Ltd', '789 Elm Road', '555-9012');

-- Insert data into the Products table
INSERT INTO Products (ProdCode, ProdName, ProdPrice)
VALUES ('P01', 'Widget', 10.99),
       ('P02', 'Gadget', 19.99),
       ('P03', 'Thingamajig', 15.49);

-- Insert data into the Orders table
INSERT INTO Orders (OrderCode, OrderDate, CustCode)
VALUES ('O101', '2023-05-10', 'C01'),
       ('O102', '2023-05-11', 'C02'),
       ('O103', '2023-05-12', 'C03');

-- Insert data into the OrderItems table
INSERT INTO OrderItems (OrderCode, ProdCode, Quantity)
VALUES ('O101', 'P01', 5),
       ('O101', 'P02', 3),
       ('O102', 'P02', 2),
       ('O103', 'P03', 1);

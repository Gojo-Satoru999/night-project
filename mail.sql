-- Display all the data of customers
SELECT * FROM Customers;

-- Display the product_name and category for products which their price is between 5000 and 10000
SELECT product_name, category
FROM Product
WHERE price BETWEEN 5000 AND 10000;

-- Display all the data of products sorted in descending order of price
SELECT * FROM Product
ORDER BY price DESC;

-- Display the total number of orders, the average amount, the highest total amount and the lowest total amount
SELECT 
    COUNT(order_id) AS total_orders, 
    AVG(quantity * price) AS average_amount, 
    MAX(quantity * price) AS highest_total_amount, 
    MIN(quantity * price) AS lowest_total_amount
FROM Orders
JOIN Product ON Orders.product_id = Product.product_id;

-- For each product_id, display the number of orders
SELECT product_id, COUNT(order_id) AS number_of_orders
FROM Orders
GROUP BY product_id;

-- Display the customer_id which has more than 2 orders
SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING COUNT(order_id) > 2;

-- For each month of the 2020 year, display the number of orders
SELECT 
    EXTRACT(MONTH FROM order_date) AS month, 
    COUNT(order_id) AS number_of_orders
FROM Orders
WHERE EXTRACT(YEAR FROM order_date) = 2020
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY month;

-- For each order, display the product_name, the customer_name and the date of the order
SELECT 
    Orders.order_id, 
    Product.product_name, 
    Customers.customer_name, 
    Orders.order_date
FROM Orders
JOIN Product ON Orders.product_id = Product.product_id
JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- Display all the orders made three months ago
SELECT *
FROM Orders
WHERE order_date = ADD_MONTHS(SYSDATE, -3);

-- Display customers (customer_id) who have never ordered a product
SELECT customer_id
FROM Customers
WHERE customer_id NOT IN (SELECT customer_id FROM Orders);

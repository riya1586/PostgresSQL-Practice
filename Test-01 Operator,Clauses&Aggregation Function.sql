/*
Create a database named Flipkart_db and then create a table with the following fields:

Product ID – Serial
Name – String
SKU Code – 8-digit String
Price – Number (Maximum: 99999999)
Stock Quantity – Number (must be greater than 0)
Is Available – Boolean (Default: TRUE)
Category – String (NOT NULL)
Added On – Date
Last Update – Date
*/

--Creating Table
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    sku_code CHAR(8) UNIQUE NOT NULL,
    price NUMERIC(10,2) CHECK (price > 0),
    stock_quantity INT DEFAULT 0 CHECK (stock_quantity >= 0),
    is_available BOOLEAN DEFAULT TRUE,
    category TEXT NOT NULL,
    added_on DATE DEFAULT CURRENT_DATE,
    last_updated TIMESTAMP DEFAULT NOW()
);

--Inserting the data into the table
INSERT INTO products (name, sku_code, price, stock_quantity, is_available, category)
VALUES
('Wireless Mouse', 'WM123456', 699.99, 50, TRUE, 'Electronics'),
('Bluetooth Speaker', 'BS234567', 1499.00, 30, TRUE, 'Electronics'),
('Laptop Stand', 'LS345678', 799.50, 20, TRUE, 'Accessories'),
('USB-C Hub', 'UC456789', 1299.99, 15, TRUE, 'Accessories'),
('Notebook', 'NB567890', 99.99, 100, TRUE, 'Stationery'),
('Pen Set', 'PS678901', 199.00, 200, TRUE, 'Stationery'),
('Coffee Mug', 'CM789012', 299.00, 75, TRUE, 'Home & Kitchen'),
('LED Desk Lamp', 'DL890123', 899.00, 40, TRUE, 'Home & Kitchen'),
('Yoga Mat', 'YM901234', 499.00, 25, TRUE, 'Fitness'),
('Water Bottle', 'WB012345', 349.00, 60, TRUE, 'Fitness');

                        --TEST 
 -- .TEST BASED ON OPERATORS , CLAUSES & AGGREGATION FUNCTION.

---Q1. Display the name and price of the cheapest product in the entire table.
SELECT name, price FROM Products
WHERE price = (SELECT MIN(price) FROM Products);

---Q2. Find the average price of products that belong to the category='Electronics'or'Fitness'.
select round(avg(price),3) from products group by category in ('Electronics','Fitness');

---Q3. Show product names and stock quantity where the product is available, stock is more than 50, and price is not equal to ₹299.
select name , stock_quantity from products where is_available = True and stock_quantity > 50 and price != 299;

---Q4. Find the most expensive product in each category (name and price).
select category , max(price) from products group by category; 

---Q5. Show all unique categories in UPPERCASE, sorted in descending order.
select distinct upper (category) as Upper_Category from products order by Upper_Category DESC;




















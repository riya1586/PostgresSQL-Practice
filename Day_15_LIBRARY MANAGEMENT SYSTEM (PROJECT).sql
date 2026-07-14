--Project: Library Management System

-- Create Table
CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(8,2),
    quantity INT
);

-- Insert Data
INSERT INTO Books (title, author, category, price, quantity)
VALUES
('Atomic Habits','James Clear','Self Help',450,15),
('Clean Code','Robert C. Martin','Programming',750,8),
('Python Basics','John Smith','Programming',600,12),
('Data Science Guide','David Miller','Data Science',850,5),
('SQL for Beginners','Mark Johnson','Database',500,10),
('Machine Learning','Andrew Brown','AI',950,6),
('Java Programming','Herbert Schildt','Programming',700,9),
('Deep Learning','Ian Goodfellow','AI',1200,4);

-- View All Books
SELECT * FROM Books;
WHERE
SELECT * FROM Books
WHERE category='Programming';

-- ORDER BY
SELECT * FROM Books
ORDER BY price DESC;

-- LIMIT
SELECT * FROM Books
LIMIT 5;

-- Aggregate Functions
SELECT
COUNT(*) AS total_books,
SUM(quantity) AS total_quantity,
AVG(price) AS average_price,
MAX(price) AS highest_price,
MIN(price) AS lowest_price
FROM Books;

-- GROUP BY
SELECT category,
COUNT(*) AS total_books
FROM Books
GROUP BY category;

-- UPDATE
UPDATE Books
SET quantity=20
WHERE book_id=1;

-- DELETE
DELETE FROM Books
WHERE book_id=8;

-- Final Data
SELECT * FROM Books;



-- Description--
/* A beginner-friendly PostgreSQL project that demonstrates database creation, data 
insertion, filtering, sorting, grouping, aggregate functions,
updating, and deleting records using a Library Management System. */
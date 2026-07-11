--🏨 HOTEL BOOKING SYSTEM (PROJECT)--

--TABLE 1: HOTEL--
CREATE TABLE Hotels (
    hotel_id INT PRIMARY KEY,
    hotel_name VARCHAR(100),
    city VARCHAR(50),
    rating DECIMAL(2,1)
);


--TABLE 2: ROOMS--
CREATE TABLE Rooms (
    room_id INT PRIMARY KEY,
    hotel_id INT,
    room_type VARCHAR(30),
    price_per_night DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (hotel_id) REFERENCES Hotels(hotel_id)
);


--TABLE 3: CUSTOMERS--
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);


--TABLE 4: BOOKINGS 
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    booking_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);


--TABLE PYMENTS--
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10,2),
    payment_date DATE,
    payment_method VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);


--SAMPLE DATA (HOTELS)--
INSERT INTO Hotels VALUES
(1,'Taj Palace','Delhi',4.8),
(2,'Royal Stay','Lucknow',4.2),
(3,'Ocean View','Goa',4.6);


--SAMPLE DATA (ROOMS)--
INSERT INTO Rooms VALUES
(101,1,'Deluxe',5000,'Available'),
(102,1,'Suite',8000,'Booked'),
(201,2,'Standard',2500,'Available'),
(202,2,'Deluxe',4000,'Booked'),
(301,3,'Suite',9000,'Available');


--SAMPLE DATA (CUSTOMERS)--
INSERT INTO Customers VALUES
(1,'Riya Mishra','9876543210','riya@gmail.com'),
(2,'Rahul Singh','9876543211','rahul@gmail.com'),
(3,'Anjali Verma','9876543212','anjali@gmail.com');

 SELECT * FROM HOTELS;


--SAMPLE DATA (BOOKING)--
INSERT INTO Bookings VALUES
(1,1,102,'2026-07-01','2026-07-03','Confirmed'),
(2,2,202,'2026-07-05','2026-07-08','Cancelled'),
(3,3,301,'2026-07-10','2026-07-12','Confirmed');


--SAMPLE DATA (PYMENTS)--
INSERT INTO Payments VALUES
(1,1,16000,'2026-07-01','UPI'),
(2,2,12000,'2026-07-05','Card'),
(3,3,18000,'2026-07-10','Cash');


--Level: 5 


--HINT:(Advanced) Inme JOIN, GROUP BY, ORDER BY, SUM(), COUNT(), AVG(), aur LEFT JOIN ka use hoga.--

--1: Most booked room type.
SELECT r.room_type, COUNT(*) AS total_bookings
FROM Rooms r
JOIN Bookings b
ON r.room_id = b.room_id
GROUP BY r.room_type
ORDER BY total_bookings DESC
LIMIT 1;


--2: Total revenue.
SELECT SUM(amount) AS total_revenue
FROM Payments;


--3: Customer booking history.
SELECT c.customer_name,
       b.booking_id,
       b.check_in,
       b.check_out,
       b.booking_status
FROM Customers c
JOIN Bookings b
ON c.customer_id = b.customer_id;


--4: Monthly bookings.
SELECT c.customer_name,
       COUNT(b.room_id) AS total_rooms
FROM Customers c
JOIN Bookings b
ON c.customer_id = b.customer_id
GROUP BY c.customer_name
HAVING COUNT(b.room_id) > 1;

--5: Cancelled bookings.
SELECT *
FROM Bookings
WHERE booking_status = 'Cancelled';


--6: Hotel earning report.
SELECT h.hotel_name,
       SUM(p.amount) AS total_earning
FROM Hotels h
JOIN Rooms r
ON h.hotel_id = r.hotel_id
JOIN Bookings b
ON r.room_id = b.room_id
JOIN Payments p
ON b.booking_id = p.booking_id
GROUP BY h.hotel_name;


--7: Top-paying customer.
SELECT c.customer_name,
       SUM(p.amount) AS total_paid
FROM Customers c
JOIN Bookings b
ON c.customer_id = b.customer_id
JOIN Payments p
ON b.booking_id = p.booking_id
GROUP BY c.customer_name
ORDER BY total_paid DESC
LIMIT 1;


--8: Hotel with highest average room price.
SELECT h.hotel_name,
       AVG(r.price_per_night) AS avg_price
FROM Hotels h
JOIN Rooms r
ON h.hotel_id = r.hotel_id
GROUP BY h.hotel_name
ORDER BY avg_price DESC
LIMIT 1;


--9: Rooms that have never been booked.
SELECT r.room_id,
       r.room_type
FROM Rooms r
LEFT JOIN Bookings b
ON r.room_id = b.room_id
WHERE b.booking_id IS NULL;


--10: Customers who booked more than one room.
SELECT c.customer_name,
       COUNT(b.room_id) AS total_rooms
FROM Customers c
JOIN Bookings b
ON c.customer_id = b.customer_id
GROUP BY c.customer_name
HAVING COUNT(b.room_id) > 1;


 /*Hotel Booking System

OVERVIEW----
The Hotel Booking System is a database project developed using PostgreSQL. It is designed to manage hotel room bookings, customer details, room information, and booking records efficiently.


 FEATURES----
* Manage customer information
* Add and manage hotel rooms
* Create and manage bookings
* Track booking history
* Generate reports using SQL queries
* Perform CRUD operations (Create, Read, Update, Delete)


TECHNOLOGIES USED---
* PostgreSQL
* pgAdmin 4
* SQL


DATABASE CONCEPTS USED------
* DDL (CREATE, ALTER, DROP)
* DML (INSERT, UPDATE, DELETE)
* SELECT Queries
* WHERE Clause
* ORDER BY
* GROUP BY
* HAVING Clause
* JOINs
* Aggregate Functions (COUNT, SUM, AVG, MAX, MIN)
* Primary Key & Foreign Key
* Constraints

 
 TABLES-----
* Customers
* Rooms
* Bookings
* Hotels (Optional)


SIMPLE SQL OPERATIONS-----
* Add new customers
* Add hotel rooms
* Book a room
* View booking history
* Find available rooms
* Calculate total revenue
* Display top customers
* Generate booking reports

 
 
 LEARNING OUTCOME-----
This project helped me understand relational database design, SQL queries, joins, constraints, and real-world database management using PostgreSQL.



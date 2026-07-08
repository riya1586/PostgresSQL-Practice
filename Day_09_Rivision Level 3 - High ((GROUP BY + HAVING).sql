CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30),
    experience INT
);


INSERT INTO employee VALUES
(101, 'Riya', 'HR', 30000, 'Delhi', 2),
(102, 'Aman', 'IT', 55000, 'Noida', 4),
(103, 'Priya', 'Sales', 40000, 'Delhi', 3),
(104, 'Rahul', 'IT', 60000, 'Lucknow', 5),
(105, 'Neha', 'HR', 35000, 'Noida', 2),
(106, 'Karan', 'Sales', 45000, 'Delhi', 4),
(107, 'Anjali', 'IT', 70000, 'Noida', 6),
(108, 'Rohit', 'Finance', 50000, 'Delhi', 5);


select * from employee;


                        --Level 5 (GROUP BY + HAVING)---

--1. Sirf un departments ko show karo jahan employees 2 ya usse zyada hain.

SELECT department, COUNT(*) AS total_employee
FROM employee
GROUP BY department
HAVING COUNT(*) >= 2;


--2. Jinki average salary 45,000 se zyada hai.

SELECT department, AVG(salary) AS avg_salary
FROM employee
GROUP BY department
HAVING AVG(salary) > 45000;


--3. Har city ki total salary.
SELECT city, SUM(salary) AS total_salary
FROM employees
GROUP BY city;
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30),
    experience INT
);

INSERT INTO employees VALUES
(101, 'Riya', 'HR', 30000, 'Delhi', 2),
(102, 'Aman', 'IT', 55000, 'Noida', 4),
(103, 'Priya', 'Sales', 40000, 'Delhi', 3),
(104, 'Rahul', 'IT', 60000, 'Lucknow', 5),
(105, 'Neha', 'HR', 35000, 'Noida', 2),
(106, 'Karan', 'Sales', 45000, 'Delhi', 4),
(107, 'Anjali', 'IT', 70000, 'Noida', 6),
(108, 'Rohit', 'Finance', 50000, 'Delhi', 5);


--Level 3 (WHERE + LIKE)--

--1. Jinke name ki starting R se hoti ho.
SELECT *
FROM employees
WHERE emp_name LIKE 'R%';

--2. Jinke name ka ending a se hota ho.
SELECT * FROM employees WHERE emp_name LIKE '%a';

--3. Jinke name me i aata ho.
SELECT * FROM employees WHERE emp_name LIKE '%i%';

--4. Department me IT ya HR wale employees.
SELECT EMP_NAME , DEPARTMENT FROM EMPLOYEES WHERE DEPARTMENT = 'IT' OR DEPARTMENT ='HR';

--5. City Delhi aur salary 40,000 se zyada.
SELECT EMP_NAME , SALARY FROM EMPLOYEES WHERE CITY = 'Delhi' AND SALARY > 40000; 
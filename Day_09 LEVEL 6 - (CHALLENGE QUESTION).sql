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


---Level 6 (Challenge Questions)--

--1. Second highest salary find karo.

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

--2. Third highest salary find karo.

SELECT MAX(salary) AS Third_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
	);
	
--3. Highest salary wale employee ka naam.

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);


--4. Lowest salary wale employee ka naam.

SELECT emp_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

--5. Salary highest se lowest tak rank ke sath display karo.

SELECT
    emp_name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees

--6. Duplicate salaries find karo.

SELECT salary, COUNT(*) AS total_employees
FROM employees
GROUP BY salary
HAVING COUNT(*) > 1;

--7. Salary average se zyada wale employees.

SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

--8. HR aur IT employees ko ek sath show karo.

SELECT *
FROM employees
WHERE department IN ('HR', 'IT');

--9. Jinki salary even number hai.

SELECT *
FROM employees
WHERE salary % 2 = 0;

--10.Jinki salary odd number hai.

SELECT *
FROM employees
WHERE salary % 2 <> 0;






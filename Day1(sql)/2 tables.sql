CREATE DATABASE office_db;

USE office_db;

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 25000,
    age INT CHECK (age >= 18),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

INSERT INTO Department (department_id, department_name) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT'),
(104, 'Marketing'),
(105, 'Sales');

INSERT INTO Employee (employee_id, employee_name, email, salary, age, department_id) VALUES
(1, 'Rahul', 'rahul@gmail.com', 30000, 25, 101),
(2, 'Sneha', 'sneha@gmail.com', 35000, 28, 102),
(3, 'Amit', 'amit@gmail.com', 40000, 30, 103),
(4, 'Priya', 'priya@gmail.com', 28000, 22, 104),
(5, 'Kiran', 'kiran@gmail.com', 32000, 26, 105),
(6, 'Anjali', 'anjali@gmail.com', DEFAULT, 24, 101),
(7, 'Vijay', 'vijay@gmail.com', 45000, 31, 103),
(8, 'Meena', 'meena@gmail.com', 27000, 23, 102),
(9, 'Ravi', 'ravi@gmail.com', 38000, 29, 105),
(10, 'Pooja', 'pooja@gmail.com', DEFAULT, 21, 104);

SELECT * FROM Employee;
SELECT employee_name, salary FROM Employee;
SELECT * FROM Employee WHERE salary > 500;
SELECT * FROM Employee WHERE age BETWEEN 25 AND 30;

SELECT * FROM Employee WHERE department_id IN (101, 103);

SELECT DISTINCT department_id FROM Employee;
SELECT * FROM Employee ORDER BY salary DESC;
SELECT * FROM Employee LIMIT 5;
SELECT * FROM Employee WHERE employee_name LIKE 'J%';
SELECT COUNT(*) AS total_employees FROM Employee;
SELECT MAX(salary) AS maximum_salary FROM Employee;


SELECT MIN(salary) AS minimum_salary
FROM Employee;


SELECT AVG(salary) AS average_salary
FROM Employee;


SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;

SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1;

SELECT
    Employee.employee_name,
    Department.department_name
FROM Employee
INNER JOIN Department
ON Employee.department_id = Department.department_id;

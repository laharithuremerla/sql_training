CREATE DATABASE company;
USE company;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

DESC department;

INSERT INTO department (dept_id, dept_name)
VALUES
(101, 'HR'),
(102, 'Submission'),
(103, 'Manager'),
(104, 'JobSearch'),
(105, 'TL');

SELECT * FROM department;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000,
    age INT CHECK (age >= 18),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

DESC employee;

INSERT INTO employee
VALUES
(1, 'John', 'john@gmail.com', 4500, 25, 101),
(2, 'Ravi', 'ravi@gmail.com', 4000, 22, 102),
(3, 'Sita', 'sita@gmail.com', 7000, 25, 103),
(4, 'Ram', 'ram@gmail.com', 1000, 28, 104),
(5, 'Michael', 'michael@gmail.com', 6000, 26, 105);

SELECT * FROM employee;
SELECT dept_id,count(*) from employee group by dept_id
SELECT dept_id,avg(salary) from employee group by dept_id
SELECT dept_id,min(salary) from employee group by dept_id
select dept_id, max(age) from employee group by dept_id having  avg(age)>22  limit 2; 

select dept_id,age from employee order by age desc;
-- SELECT column1, column2, 
-- FROM table1
-- INNER JOIN table2
-- ON table1.common_column = table2.common_column;
select * from department inner join employee on department.dept_id = employee.dept_id;
select * from department left join employee on department.dept_id = employee.dept_id;
select * from department right join employee on department.dept_id = employee.dept_id;

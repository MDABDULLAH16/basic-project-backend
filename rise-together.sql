--1. create table for employees;
CREATE TABLE employees (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    email       VARCHAR(150) UNIQUE NOT NULL,
    salary      DECIMAL(10, 2) DEFAULT 0,
    department  VARCHAR(100),
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--2.insert data
INSERT INTO employees (name, email, salary, department)
VALUES 
  ('Rahim Uddin', 'rahim@gmail.com', 35000.00, 'IT'),
  ('Karim Mia',   'karim@gmail.com', 28000.50, 'HR'),
  ('Sumaiya',     'sumaiya@gmail.com', 42000.00, 'Finance');

-- 3.select all data
SELECT * FROM employees;

-- 4. Select Specific Columns
SELECT  name, salary   
FROM employees;

-- 6. Use WHERE Condition
-- Find employees whose salary is greater than 40000.

SELECT * FROM employees 
WHERE salary>40000;
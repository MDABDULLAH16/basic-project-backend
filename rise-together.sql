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

-- -- 7. Use ORDER BY
-- Show employees ordered by salary descending.
SELECT * FROM employees
ORDER BY salary DESC;

-- 8. Use LIMIT
-- Show top 3 highest paid employees.
SELECT * FROM employees
ORDER BY salary DESC LIMIT 3;

-- 9. Update Data
-- Increase salary of Karim Mia by 5000

UPDATE employees
SET salary = salary + 5000
WHERE id = 2;
 -- Verify
SELECT * FROM employees WHERE id = 2;


-- 10. Delete Data
-- Delete employee by id

DELETE FROM employees
WHERE id = 3;

-- Verify
SELECT * FROM employees;

-- 11. Use BETWEEN
-- Find employees whose salary is between 30000 and 60000

SELECT *
FROM employees
WHERE salary BETWEEN 30000 AND 60000;

-- 12. Use IN
-- Find employees from IT or HR department

SELECT *
FROM employees
WHERE department IN ('IT', 'HR');


-- 13. Use COUNT
-- Count total employees

SELECT COUNT(*) AS total_employees
FROM employees;


-- 14. Use AVG
-- Find average salary

SELECT AVG(salary) AS average_salary
FROM employees;


-- 15. Use GROUP BY
-- Find total employees in each department

SELECT department, COUNT(*) AS total
FROM employees
GROUP BY department;


-- 16. Use HAVING
-- Show departments having more than 2 employees
-- (insert extra rows first to test this properly)

INSERT INTO employees (name, email, salary, department)
VALUES
  ('Nadia', 'nadia@gmail.com', 31000.00, 'IT'),
  ('Rafi',  'rafi@gmail.com',  29000.00, 'IT'),
  ('Tanha', 'tanha@gmail.com', 38000.00, 'IT');

SELECT department, COUNT(*) AS total
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;


-- 17. Add Constraints
-- Create a table with PRIMARY KEY, UNIQUE, NOT NULL, DEFAULT

CREATE TABLE students (
    id          SERIAL PRIMARY KEY,           -- PRIMARY KEY
    name        VARCHAR(100) NOT NULL,        -- NOT NULL
    email       VARCHAR(150) UNIQUE NOT NULL, -- UNIQUE + NOT NULL
    grade       VARCHAR(5)   DEFAULT 'A'      -- DEFAULT
);


-- 19. Add Foreign Key
-- Create users and orders tables, connect with foreign key

CREATE TABLE users (
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(100) NOT NULL,
    email    VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE orders (
    id         SERIAL PRIMARY KEY,
    user_id    INT NOT NULL,
    amount     DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Insert sample data
INSERT INTO users (name, email)
VALUES
  ('Rahim', 'rahim@gmail.com'),
  ('Karim', 'karim@gmail.com');

INSERT INTO orders (user_id, amount)
VALUES
  (1, 1500.00),
  (1,  800.00),
  (2, 2200.00);


-- 20. Use INNER JOIN
-- Show user name and order amount

SELECT 
    users.name    AS user_name,
    orders.amount AS order_amount
FROM orders
INNER JOIN users ON orders.user_id = users.id;
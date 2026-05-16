--1. create table for employees;
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    salary DECIMAL(10, 2) DEFAULT 0,
    department VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--2.insert data
INSERT INTO
    employees (
        name,
        email,
        salary,
        department
    )
VALUES (
        'Rahim Uddin',
        'rahim@gmail.com',
        35000.00,
        'IT'
    ),
    (
        'Karim Mia',
        'karim@gmail.com',
        28000.50,
        'HR'
    ),
    (
        'Sumaiya',
        'sumaiya@gmail.com',
        42000.00,
        'Finance'
    );

-- 3.select all data
SELECT * FROM employees;

-- 4. Select Specific Columns
SELECT name, salary FROM employees;

-- 6. Use WHERE Condition
-- Find employees whose salary is greater than 40000.

SELECT * FROM employees WHERE salary > 40000;

-- -- 7. Use ORDER BY
-- Show employees ordered by salary descending.
SELECT * FROM employees ORDER BY salary DESC;

-- 8. Use LIMIT
-- Show top 3 highest paid employees.
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

-- 9. Update Data
-- Increase salary of Karim Mia by 5000

UPDATE employees SET salary = salary + 5000 WHERE id = 2;
-- Verify
SELECT * FROM employees WHERE id = 2;

-- 10. Delete Data
-- Delete employee by id

DELETE FROM employees WHERE id = 3;

-- Verify
SELECT * FROM employees;

-- 11. Use BETWEEN
-- Find employees whose salary is between 30000 and 60000

SELECT * FROM employees WHERE salary BETWEEN 30000 AND 60000;

-- 12. Use IN
-- Find employees from IT or HR department

SELECT * FROM employees WHERE department IN ('IT', 'HR');

-- 13. Use COUNT
-- Count total employees

SELECT COUNT(*) AS total_employees FROM employees;

-- 14. Use AVG
-- Find average salary

SELECT AVG(salary) AS average_salary FROM employees;

-- 15. Use GROUP BY
-- Find total employees in each department

SELECT department, COUNT(*) AS total
FROM employees
GROUP BY
    department;

-- 16. Use HAVING
-- Show departments having more than 2 employees
-- (insert extra rows first to test this properly)

INSERT INTO
    employees (
        name,
        email,
        salary,
        department
    )
VALUES (
        'Nadia',
        'nadia@gmail.com',
        31000.00,
        'IT'
    ),
    (
        'Rafi',
        'rafi@gmail.com',
        29000.00,
        'IT'
    ),
    (
        'Tanha',
        'tanha@gmail.com',
        38000.00,
        'IT'
    );

SELECT department, COUNT(*) AS total
FROM employees
GROUP BY
    department
HAVING
    COUNT(*) > 2;

-- 17. Add Constraints
-- Create a table with PRIMARY KEY, UNIQUE, NOT NULL, DEFAULT

CREATE TABLE students (
    id SERIAL PRIMARY KEY, -- PRIMARY KEY
    name VARCHAR(100) NOT NULL, -- NOT NULL
    email VARCHAR(150) UNIQUE NOT NULL, -- UNIQUE + NOT NULL
    grade VARCHAR(5) DEFAULT 'A' -- DEFAULT
);

-- 19. Add Foreign Key
-- Create users and orders tables, connect with foreign key

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Insert sample data
INSERT INTO
    users (name, email)
VALUES ('Rahim', 'rahim@gmail.com'),
    ('Karim', 'karim@gmail.com');

INSERT INTO
    orders (user_id, amount)
VALUES (1, 1500.00),
    (1, 800.00),
    (2, 2200.00);

-- 20. Use INNER JOIN
-- Show user name and order amount

SELECT users.name AS user_name, orders.amount AS order_amount
FROM orders
    INNER JOIN users ON orders.user_id = users.id;

ALTER TABLE employees ADD COLUMN age INT Default 33 NOT NULL;

ALTER TABLE employees DROP COLUMN age;

SELECT * FROM employees;

-- Creating the departments table
CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(50)
);
-- Creating the employees table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT REFERENCES departments (department_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);

DROP TABLE employees;
-- Inserting sample data into the departments table
INSERT INTO
    departments (department_name)
VALUES ('HR'),
    ('Marketing'),
    ('Finance'),
    ('IT'),
    ('Sales'),
    ('Engineering'),
    ('Customer Support'),
    ('Administration'),
    ('Research'),
    ('Quality Assurance');

DROP TABLE departments;
-- Inserting sample data into the employees table with a foreign key constraint
INSERT INTO
    employees (
        employee_name,
        department_id,
        salary,
        hire_date
    )
VALUES (
        'John Doe',
        1,
        60000.00,
        '2022-01-10'
    ),
    (
        'Jane Smith',
        2,
        75000.50,
        '2021-05-22'
    ),
    (
        'Bob Johnson',
        3,
        80000.75,
        '2020-11-15'
    ),
    (
        'Alice Williams',
        4,
        90000.25,
        '2019-08-03'
    ),
    (
        'David Lee',
        5,
        65000.50,
        '2020-03-18'
    ),
    (
        'Sara Brown',
        6,
        70000.00,
        '2021-09-28'
    ),
    (
        'Mike Miller',
        7,
        55000.75,
        '2022-02-05'
    ),
    (
        'Emily Davis',
        8,
        95000.00,
        '2018-12-12'
    ),
    (
        'Chris Wilson',
        9,
        72000.50,
        '2020-06-30'
    ),
    (
        'Amy White',
        10,
        68000.25,
        '2021-11-09'
    ),
    (
        'John Johnson',
        1,
        62000.00,
        '2022-01-15'
    ),
    (
        'Jessica Thompson',
        2,
        78000.50,
        '2021-06-05'
    ),
    (
        'Michael Harris',
        3,
        85000.75,
        '2020-11-25'
    ),
    (
        'Emma Martinez',
        4,
        92000.25,
        '2019-09-15'
    ),
    (
        'James Taylor',
        5,
        67000.50,
        '2020-04-08'
    ),
    (
        'Sophia Anderson',
        6,
        72000.00,
        '2021-10-10'
    ),
    (
        'William Jackson',
        7,
        56000.75,
        '2022-02-10'
    ),
    (
        'Olivia Nelson',
        8,
        97000.00,
        '2018-12-20'
    ),
    (
        'Daniel White',
        9,
        73000.50,
        '2020-07-05'
    ),
    (
        'Ava Wilson',
        10,
        69000.25,
        '2021-11-15'
    ),
    (
        'Matthew Brown',
        1,
        63000.00,
        '2022-01-20'
    ),
    (
        'Emily Garcia',
        2,
        76000.50,
        '2021-06-15'
    ),
    (
        'Christopher Allen',
        3,
        86000.75,
        '2020-12-05'
    ),
    (
        'Madison Hall',
        4,
        93000.25,
        '2019-09-25'
    ),
    (
        'Andrew Cook',
        5,
        68000.50,
        '2020-04-18'
    ),
    (
        'Abigail Torres',
        6,
        73000.00,
        '2021-10-20'
    ),
    (
        'Ethan Murphy',
        7,
        57000.75,
        '2022-02-15'
    ),
    (
        'Ella King',
        8,
        98000.00,
        '2018-12-28'
    ),
    (
        'Nathan Rivera',
        9,
        74000.50,
        '2020-07-15'
    ),
    (
        'Mia Roberts',
        10,
        70000.25,
        '2021-11-20'
    );

SELECT * FROM departments;

SELECT * FROM employees

--  JOIN departments  ON employees.department_id = departments.department_id
SELECT * FROM employees
 JOIN departments USING (department_id);

SELECT department_name,round(avg(salary)),count(*)  FROM   employees 
   JOIN departments USING (department_id) 
   GROUP BY department_name;

SELECT department_name,round(avg(salary)) as avg_salary FROM employees
JOIN departments USING (department_id) 
GROUP BY department_name
ORDER BY avg_salary DESC
LIMIT 1
;

SELECT extract(YEAR from hire_date) as hire_year,count(*) FROM employees
GROUP BY hire_year
;

SELECT * FROM employees
JOIN departments USING(department_id)
WHERE department_name LIKE('%R');

DROP TABLE department;

DROP TABLE departments;
DROP TABLE users;
DELETE TABLE department

Diagram link: [database](https://lucid.app/lucidchart/ec373326-9b9d-485f-95de-46473f3bf493/edit?viewport_loc=487%2C-532%2C1252%2C545%2C0_0&invitationId=inv_2cc60d8a-067b-40c1-817a-d10a688d88c7)

 
 
---

## 1. DELETE vs. TRUNCATE vs. DROP
These commands differ in how they handle data and the table structure:

* **DELETE**: A **DML** (Data Manipulation Language) command used to remove specific rows based on a `WHERE` condition. It is logged, so it can be **rolled back**.
* **TRUNCATE**: A **DDL** (Data Engineering Language) command that removes **all** rows from a table. It is faster than DELETE because it doesn't log individual row deletions. The table structure remains intact.
* **DROP**: A **DDL** command that removes the **entire table structure** and all its data from the database. This action is permanent.

---

## 2. What is a PRIMARY KEY?
A **PRIMARY KEY** is a constraint that uniquely identifies each record in a database table.
* It must contain **Unique** values.
* It cannot contain **NULL** values.
* A table can have only **one** primary key.

---

## 3. PRIMARY KEY vs. UNIQUE KEY
| Feature | PRIMARY KEY | UNIQUE KEY |
| :--- | :--- | :--- |
| **Uniqueness** | Required | Required |
| **Nullability** | Not Allowed | Allows one NULL value |
| **Quantity** | Only one per table | Multiple allowed per table |

---

## 4. What is a FOREIGN KEY?
A **FOREIGN KEY** is a field in one table that refers to the **PRIMARY KEY** in another table. It acts as a cross-reference between tables to maintain **referential integrity**, ensuring that the relationship between data remains consistent.

---

## 5. What is JOIN in SQL?
A **JOIN** clause is used to combine rows from two or more tables based on a related column between them.

* **INNER JOIN**: Returns only the records that have matching values in **both** tables.
* **LEFT JOIN**: Returns all records from the **left** table, and the matched records from the right table. If no match is found, NULL values are returned for the right table columns.

---

## 6. What is Normalization?
Normalization is the process of structuring a database to reduce data redundancy and improve data integrity.

* **1NF (First Normal Form)**: Ensure columns contain atomic (indivisible) values and each record is unique.
* **2NF (Second Normal Form)**: Meet 1NF requirements and ensure all non-key attributes are fully functional dependent on the primary key.
* **3NF (Third Normal Form)**: Meet 2NF requirements and ensure there are no transitive functional dependencies (non-key columns shouldn't depend on other non-key columns).

---

## 7. What is Indexing?
**Indexing** is a optimization technique that creates a data structure (the index) to allow the database to find rows more quickly.
* **Why use it?** We use indexes to drastically speed up search queries (`SELECT`). However, they can slow down `INSERT`, `UPDATE`, and `DELETE` operations because the index must also be updated.

---

## 8. WHERE vs. HAVING
* **WHERE**: Filters records **before** any groupings are made. It works on individual rows.
* **HAVING**: Filters records **after** a `GROUP BY` clause has been applied. It is used specifically with aggregate functions (like `SUM`, `AVG`, `COUNT`).

---

## 9. What is a Transaction?
A **Transaction** is a sequence of one or more SQL operations treated as a single unit of work. It follows the **ACID** properties to ensure database reliability.

* **COMMIT**: Permanently saves all changes made during the current transaction to the database.
* **ROLLBACK**: Reverts the database to its state before the transaction started, undoing any changes that haven't been committed.

---

## 10. Second Highest Salary Query
**Interview Question:** "How do you find the second highest salary in a table?"

**Answer:** You can use a subquery to find the maximum salary that is less than the absolute maximum salary:

```sql
SELECT MAX(Salary) 
FROM Employees 
WHERE Salary < (SELECT MAX(Salary) FROM Employees);

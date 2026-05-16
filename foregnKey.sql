-- Active: 1778840741558@@127.0.0.1@5432@rise_together
CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    userName VARCHAR(25) NOT NULL
);
CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user"(id) ON DELETE set DEFAULT DEFAULT 2
);
DROP TABLE "user";
DROP Table post;

INSERT INTO "user"(userName) VALUES(
    'akash'
),('batash'),('sagor'),('nodi');

INSERT INTO post(title,user_id) VALUES('akash onek meghla',1),('batase thanda lage',2),('sagore valo lage',3),('nodi onek sundor',4)

ALTER TABLE post
    ALTER COLUMN user_id set NULL

INSERT INTO post(title,user_id) VALUES('test',NULL);

 
SELECT * FROM "user";

SELECT * FROM post;
DELETE FROM "user"
WHERE id = 5;
DELETE FROM post
WHERE id=5;
DROP TABLE post;
DROP Table "user";

--inner join
SELECT title,userName FROM post as p
JOIN "user" as u ON p.user_id= u.id;
--left join right join
SELECT * FROM post as p
LEFT JOIN "user" as u ON p.user_id= u.id;
SELECT * FROM post as p
RIGHT JOIN "user" as u ON p.user_id= u.id;

 SELECT * FROM post as p 
 FULL OUTER JOIN "user" as u ON p.user_id=u.id;

CREATE table department(
    dep_id SERIAL PRIMARY KEY,
    dep_name VARCHAR(39)
);
Insert Into department(dep_name) values('humanities'),('marketing');
SELECT * FROM department;
 CREATE Table kamla(
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(20),
    dep_id INTEGER REFERENCES department(dep_id)

 );

 INSERT INTO kamla(name,dep_id)VALUES('john due',1),('january',2);
 SELECT * from department;
 SELECT * from kamla;

--cross join , make a row each first row*2;
 SELECT * from kamla
 CROSS JOIN  department;
 --netural join;
 SELECT * FROM kamla
 NATURAL JOIN department;

SELECT * FROM students;
SELECT gpa FROM students
WHERE gpa<3.5
GROUP BY gpa;

SELECT country ,count(*),avg(gpa) FROM students
GROUP BY country 
HAVING avg(gpa)>3.45 OR avg(gpa)<3;
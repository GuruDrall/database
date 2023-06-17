show tables;
select * from st1;
select * from city;
select * from branch;

## Q4. Max age from nodia city

# With joinS
SELECT MAX(age) AS MaxAge FROM st1
INNER JOIN city c
ON st1.cityid = c.cid
WHERE cityname = "Noida";

# With Nested Query
SELECT MAX(age) MaxAge FROM st1 
WHERE cityid = (SELECT cid FROM city WHERE cityname = "Noida");

# Q5. Name of student having min marks from Delhi city.

SELECT * FROM st1 
WHERE marks = (SELECT MIN(marks) from st1 s
INNER JOIN city c
ON s.cityid = c.cid
WHERE cityname = "Delhi") AND cityid = (select cid from city where cityname = "Delhi") ;

SELECT * FROM st1 
WHERE marks = (SELECT MIN(marks) FROM st1 WHERE cityid = (SELECT cid FROM city WHERE cityname ="Delhi"))
AND cityid = (select cid from city where cityname = "Delhi");



# Q6. Min marks of all branch

SELECT BranchName 'Branch Name', min(marks) 'Min Marks' FROM st1
INNER JOIN branch
ON st1.branchid = branch.bid
GROUP BY branchname;

SELECT min(marks) FROM st1 
WHERE branchid =any (SELECT bid FROM branch)
GROUP BY branchid;


# Q7. Count no. of students where age below avg age from Noida city 
# total student count from all cith having age less then avg age of students from noida city

SELECT Count(name) FROM st1 s
INNER JOIN city c
ON s.cityid = c.cid
WHERE age < (SELECT avg(age) FROM st1 WHERE cityid = (SELECT cid FROM city WHERE cityname = "Noida"));

SELECT count(name) FROM st1 
WHERE age < (SELECT avg(age) FROM st1 WHERE cityid = (SELECT cid FROM city WHERE cityname = "Noida"));



# Q8. Count no. of student from each city with city name.

SELECT city.cityname, count(name) StudentCount FROM st1
INNER JOIN city
ON st1.cityid = city.cid
GROUP BY cityname;

SELECT cityid, count(*) StudentCount FROM st1
WHERE cityid IN (SELECT cid FROM city)
GROUP BY cityid;  # not able to add city name

select c.cityname, (select count(*) from st1 s where s.cityid = c.cid) AS studentCount from city c;

SELECT count(*) as studentCount, cityname from st1 as s, City as C
Where cityid=cid
Group by cityid, cityname;


# Q13. Delete all rows except 9 and 10

DELETE FROM st1
WHERE id NOT IN (9, 10);

# Q14. Extract 38-82 rows using limit. 1-100, Limit = (82-38)+1=45, offset => 38-1=37

SELECT * FROM st LIMIT 45 OFFSET 37;

SELECT * FROM st LIMIT 37,45;


# Q15. Name all branch in which counting of student less then 10

SELECT Branchname FROM st1
INNER JOIN branch
ON st1.branchid = branch.bid
GROUP BY branchname
HAVING count(name) < 10; 

SELECT branchname FROM branch
WHERE bid IN (SELECT branchid FROM st1
GROUP BY branchid
HAVING count(name) < 10);

# Q16. All types of join with example.
# Q17. Drop name and age column in single query.

ALTER TABLE st1 DROP COLUMN name, DROP COLUMN age;

ALTER TABLE st1 DROP name, DROP age;

# Q18. Name all branch where max mark above 50

SELECT branchname FROM st1 s
INNER JOIN branch b
ON s.branchid = b.bid
GROUP BY branchname
HAVING max(marks) > 50;

SELECT branchname FROM branch
WHERE bid IN (SELECT branchid FROM st1
GROUP BY branchid
HAVING max(marks) > 50);



# Q19. Display max marks from Noida city

SELECT max(marks) FROM st1
INNER JOIN city
ON st1.cityid = city.cid
WHERE cityname = "Noida";

SELECT max(marks) FROM st1
WHERE cityid = (SELECT cid FROM city WHERE cityname = "Noida");

# Q20. Display no. of student having less marks then the avg marks of student in Delhi

SELECT COUNT(*) FROM st1
WHERE marks < (SELECT AVG(marks) from st1) AND cityid = (SELECT cid FROM city WHERE cityname = "Delhi");

# Q21. Display no. of student where letter contains 4 length

SELECT count(*) FROM st1
WHERE length(name) = 4; 


# Q22. Count no. of unique branch

SELECT COUNT(DISTINCT(branch)) AS BranchCount FROM st;

# Q23. Update marks of all student whose marks are less then the avg marks from city Noida



# Q24. Rename column marks

ALTER TABLE st5 RENAME COLUMN marks to markz;

# Q25. Shift branch col. At first position.

ALTER TABLE st5 MODIFY branchid varchar(20) FIRST;

create database student;
use student;
show tables;
select * from st1;
select * from city;
select * from branch;
select * from st;
rename table st to st2;
rename table st2 to st;
alter table st rename column branch to branches; #column is mandatory
alter table st rename column branches to branch;

desc st;

alter table st modify branch varchar(20);

alter table st modify gender varchar(5) after age;

desc branch;

alter table city modify cityname varchar(30);

## joins

# inner
# left
# right
# self
# cross
# full outer join - doesnt support by my sql

# inner join
# it returns common/matched data from both the table

select * from st1
inner join city
on st1.cityid = city.cid ;


select name, age, marks, cityname from st1
inner join city
on st1.cityid = city.cid ;

select name, bid, branchname from st1 as s
inner join branch as b
on s.branchid = b.bid
group by branchname ;

select id, name, age, cityname, branchname from st1 s
inner join city c
on s.cityid = c.cid 
inner join branch b
on s.branchid = b.bid;

set autocommit = 0;

create table st2
(id int primary key auto_increment, 
firstName varchar(20) not null, 
age int, 
gender varchar(10), 
Marks int check (0>=marks<=100));

# drop table st2;

desc st2;

insert into st2(firstName, age, gender, marks)
values
("Rahul", 23, "M", 98),
("Raman", 24, "F", 97);

commit;

select * from st2;

update st2 set id=1
where id=3;
rollback;

update st2 set marks=95
where id = 2;

update st2 set firstname="Narayan", age= 22, Marks=92
where id=1;

delete from st2;
Select * from st2;
rollback;
commit;

delete from st2
where id=1;

delete from st2 where age<25;

truncate table st2;

create database abc;
drop database abc;

select * from st2;
alter table st2
add column lastName varchar(20) after firstname;

alter table st2
add lastName varchar(20) after firstname;

alter table st2
add column Name varchar(20) first;

alter table st2
drop column Name;

commit;

alter table st2
add abc int, add def int;
select * from st2;

alter table st2
add (ghi int, jkl int);

alter table st2
drop column abc;

alter table st2
drop def, drop ghi;

rename table st2 to st3;
show tables;
rename table st3 to st2;

alter table st2 
rename column firstName to Name;
select * from st2;

desc st2;
alter table st2
modify id varchar(20); 

alter table st2
modify id int;

alter table st2
modify gender varchar(10) default "M";

select * from st2;

alter table st2 drop jkl, drop lastname;



alter table st2 modify gender varchar(2) default 'M' after name; 

select name, age, marks, cityname from st1
left join city
on st1.cityid = city.cid ;

select * from st1
self join st1
on st1.id = st1.cityid;

Select * from orders 
where sid = (select sid from salesman where name = "paul adam");

Select EMP_Dept, Count(*) from emp_details
where emp_dept IN (select * from emp_depart
inner join emp_details
on emp_Depar.DPT_code = emp_details.EMP_DEPT
group by emp_dept
having count(*)>2);
 


show tables;

select branch, max(marks), min(marks) from st
where marks>95   
group by branch;

select branch, max(marks), min(marks) from st
group by branch
having max(marks)>95;



select max(marks) from st where marks < (select max(marks) from st);

select * from st where marks = (select max(marks) from st where marks < (select max(marks) from st));

select * from st where marks = (select distinct marks from st
order by marks desc limit 1,1);

set autocommit = 0 ;

select distinct marks from st
order by marks desc limit 1,1;

 select * from st1;
 
 update st1 set marks = 100
 where marks < (select avg(marks) from (select marks from st1) as a);
 
rollback;

 select avg(marks) from st1;
 
 -- Find all/marks of the students whose marks greater then marks of student whose id is 2 
 
 select * from st1
 where marks > (select marks from st1 where id =2);
 
 -- List out the studs whos are having marks less then max marks 
 -- and also having age greater then age of stud who is having max marks
 
 -- show data of students who have marks greater thenn max marks in me branch
 
 select * from st1 
 where marks > (select max(marks) from st1 where branchid = (select bid from branch where branchname = "IT"));
 
 -- display all stud whose marks less then the min marks from cse branch
 
 select * from st where marks < (select min(marks) from st where branch = "CS");
 
 select branch, max(marks),min(marks), count(*) from st
 group by branch
having max(marks) >90 order by count(*) limit 2;

SELECT s.branch, s.name, max(s.marks) AS maxMarks FROM st AS s
GROUP BY s.branch; 
 
select name, marks, branch from st where marks in (select max(marks) from st group by branch);

use student;

create table time1
(
sn int primary key, E_Date date, E_Time time
);
drop table time1;
select * from time1;

 
insert into time1 values
(2, "2012-09-22", "09:51:10"),
(3, "2020-02-12", "15:23:53");

select extract(week from E_Date) as year From time1; 
select extract(hour from E_time) as time From time1; 

select now();

select *, round((datediff(current_date(), E_date) / 365), 1) as DoB From time1;
CREATE TABLE st6
(Name varchar(20), Join_Date datetime);

select * from st6;

INSERT INTO st6 
Values
("A", "2022-11-17"),
("B", "2021-10-01"),
("C", "2021-05-25"),
("D", "2020-09-30");

INSERT INTO st6 
Values
("G", now()),
("H", now()+5),
("I", now() - INTERVAL 2 DAY),
("J", now() - INTERVAL 2 Hour),
("K", now() - 10);

SELECT monthname(Join_Date) FROM st6;

SELECT * FROM st6
WHERE month(Join_Date) < 7;

SELECT * FROM st6
WHERE monthname(Join_Date) > "July"; # wrong approch

create database IPL;
use ipl;

select * from matches;

select month(date) from matches;

Drop tables matches;  
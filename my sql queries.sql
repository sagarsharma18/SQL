create database college;
use college;
create table student(
roll_no int primary key,
name varchar(20),
marks int not null,
grade varchar(1),
city varchar(30) not null);
insert into student(roll_no,name,marks,grade,city)
values 
(101,"aniket sharma",95,"a","jaipur"),
(102,"shubham sharma",85,"a","udaipur"),
(103,"ayush rajoriya",80,"a","alwar"),
(104,"roop narayan",92,"a","jaipur"),
(105,"rajat swami",99,"a","jaipur"),
(106,"sachine walia",70,"b","jaipur");
select *from student;
select name,marks from student;
select name from student;
select distinct city from student;
select marks from student where marks>90;
select *from student where marks>90;
select *from student where marks>=90 and city="jaipur";
select *from student where marks>=90;
select *from student where marks>=90 or city="alwar";
select *from student where marks between 70 and 80;
select *from student where city not in ("jaipur","alwar");
select *from student where marks>90 limit 2;
select *from student order by marks desc limit 3;
select max(marks)from student;
select count(name)from student;
select city,avg(marks) from student group by city;
select city,avg(marks)from student group by city order by avg(marks)desc;
select grade,count(roll_no) from student group by grade;
select city,count(name) from student group by city having max(marks)>90;
 
set sql_safe_updates=0;
update student
set grade="c"
where grade="b";
update student 
set marks=marks+1;
select *from student;
delete from student
where marks<74;	

create table dept(
id int primary key,
name varchar(20));
insert into dept value(1,"IT");
create table  teacher(
id int primary key,
name varchar(20),
 d_id int,
 foreign key(d_id)references dept(id)
 on delete cascade
 on update cascade
 );
 insert into teacher
 values
 (101,"nikita agrawal",1);
select *from dept;
select *from teacher;
 drop table teacher;
create table  teacher(
id int primary key,
name varchar(20),
 d_id int,
 foreign key(d_id)references dept(id)
 on delete cascade
 on update cascade
 );
 insert into teacher
 values
 (101,"nikita agrawal",1);
 update dept
set id=12
where id=1;
alter table student
add column age int not null;
select *from student;
alter table student
drop column age ;
alter table student
drop age;
alter table student_data
rename to student;
alter table student
modify age varchar(23);
insert into student(roll_no,name,marks,grade,city)
value(107,"SAGAR SHARMA",100,"a","pune");
update student
set age=23
where marks<90;
set sql_safe_updates=0;
alter table student 
change age stu_age int null;
alter table student 
drop column stu_age;
select *from student;
alter table student
drop column grade;

truncate table student;
alter table student 
change name full_name varchar(34) not null; 
delete from student 
where marks<80;
create table stu(
id int primary key,
name varchar(20),
course varchar(20) 
);
insert into stu (id,name,course)
values
(1,"ajay","mca"),(2,"vijay","bca"),(3,"sumit","b.tech"),(4,"suman","bba"),(5,"swati","b.des");
select *from stu;
create table course(
id int primary key,
name varchar(20));
insert into course(id,c_name)
values
(1,"mca"),(2,"bca"),(3,"b.tech"),(4,"bba"),(5,"b.des");
select *from course;
alter table course
change name c_name varchar(23);
select *from stu as s; 
select *from stu as s
left join course as c
on s.id=c.id;
alter table stu
drop column course; 
delete from stu
where id between 2 and 5;
select *from stu;
insert into stu(id,name)
values
(2,"sumit"),(3,"mohit");
select *from stu as s
left join course as c
on s.id=c.id
union
select *from stu as s
right join course as c
on s.id=c.id;
select *from course;


select *from stu as s
left join course as c
on s.id=c.id
where c.id is null;
select *from stu as s
right join course as c
on s.id=c.id
where s.id is null;


select *from stu as s
left join course as c
on s.id=c.id
where c.id is null
union 
select *from stu as s
right join course as c
on s.id=c.id
where s.id is null; 
select *from stu;
select *from course;


create table emp(
id int primary key,
name varchar(23),
manager_id int 
);
select *from emp;
insert into emp(id,name,manager_id)
values
(101,"adam",103),
(102,"bob",104),
(103,"casy",null),
(104,"donald",103);
select a.name as manager_name,b.name
from emp as a
join emp as b
on a.id=b.manager_id; 
select name  from emp
union all 
select name from emp;

select *from student;
select roll_no
from student
where roll_no%2=0;
select roll_no,full_name
from student
where roll_no in (select roll_no
from student
where roll_no%2=0);
select full_name from student
where city="jaipur";
select max(marks)
from(select *from student
where city="jaipur") as temp;
select(select min(marks)from student);
create view  view1 as
select roll_no,full_name from student;
select *from view1;
drop view view1;  

create database travel;
use travel;
create table user(
u_id int primary key,
name varchar(20) not null,
city varchar(20) not null,
pb_amount int,
p_mode varchar(30),
travel_id int unique
);
alter table user change column travel_id t_id int not null;
insert into user(u_id,name,city,pb_amount,p_mode,travel_id)
values 
(101,"rohit sharma","mumbai",25000,"online",3),
(102,"m.s dhoni","rachi",5000,"cash",2),
(103,"roop saini","delhi",21000,"neft",4),
(104,"aniket sharma","jaipur",15000,"cheque",1),
(105,"shubhama sharma","channai",5000,"cash",5),
(106,"suraj koli","pune",10000,"online",6);
create table state(
travel_id int primary key,
foreign key (travel_id) references user(t_id)
on update cascade
on delete cascade,
state varchar(20)
);
alter table state change state name varchar(20);
insert into state(travel_id,name)
value(1,"rajasthan");
insert into state(travel_id,name)
value(2,"jammu & kashmir");
insert into state(travel_id,name)
value(3,"kerala");
insert into state(travel_id,name)
value(4,"tripura");
insert into state(travel_id,name)
value(5,"goa");
insert into state(travel_id,name)
value(6,"andaman nicobar");
create table staf(
s_id int primary key,
name varchar(20),
salary int,
traval_id int unique
);
alter table staf 
add column job_role varchar(20) not null;
insert into staf(s_id,name,salary,job_role)
values
(201,"vikas sharma",40000,"Escort"),(202,"mohit rajoriya",20000,"sweeper"),
(203,"mukesh rathor",75000,"manager"),(204,"suresh koli",40000,"Escort"),
(205,"akash rajji",35000,"planner"),(206,"kamal bala",40000,"Escort"),
(207,"rajat swami",80000,"boss"),(208,"sherin saji",40000,"Escort"),
(209,"nev verma",40000,"Escort"),(210,"suresh sharma",40000,"Escort");
alter table staf
drop column traval_id;
select *from staf
where salary >30000 order by salary desc;
select* from user ;
select *from state;
select *from staf;
create view view1 as
select u_id,name,city,t_id from user;
create view view2 as
select s_id,name,job_role from staf;
select*from view1;

select *from user as u
left join state as s
on u_id=travel_id
union
select *from user as u
right join state as s
on u_id=travel_id;

select count(u_id),city from user
group by city
having max(pb_amount)>10000;
 select*from staf;
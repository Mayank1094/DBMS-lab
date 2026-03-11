create table department01 (
    deptno int primary key,
    dname varchar(10),
    managerid int
);

create table employee01 (
    empid int primary key,
    ename varchar(10),
    age int,
    salary int,
    deptno int,
    foreign key (deptno) references department01(deptno)
);

insert into department01 values (1, 'hr', 101);
insert into department01 values (2, 'manager', 102);
insert into department01 values (3, 'cs', 103);
insert into department01 values (4, 'marketing', 104);
insert into department01 values (5, 'operator', 105);
commit;

insert into employee01 values (101, 'arjun', 30, 45000, 1);
insert into employee01 values (102, 'ajay', 28, 55000, 2);
insert into employee01 values (103, 'sameer', 35, 60000, 3);
insert into employee01 values (104, 'uma', 29, 48000, 4);
insert into employee01 values (105, 'kishor', 27, 52000, 5);
commit;

select empid, ename from employee01 where salary between 10000 and 50000;

select e.ename as "name", e.salary as "salary" 
from employee01 e
join department01 d on e.deptno = d.deptno 
where d.dname = 'cs';

select e.ename as "name", d.dname as "department" 
from employee01 e
join department01 d on e.empid = d.managerid;

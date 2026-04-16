create table department13 (dno int primary key, dname varchar(50), mgrssn int, mgrstartdate date);
desc department13;
insert into department13 values (1, 'accounts', 101, '2020-01-15');
insert into department13 values (2, 'it', 102, '2021-03-10');
insert into department13 values (3, 'hr', 103, '2019-05-20');
insert into department13 values (4, 'sales', 104, '2022-07-01');
insert into department13 values (5, 'marketing', 105, '2023-02-11');
 
select * from department13;
commit;

create table employee13 (ssn int primary key, name varchar(50), address varchar(100), sex char(1), salary number(10,2), superssn int, dno int, foreign key (dno) references department13(dno));
desc employee13;
insert into employee13 values (101, 'michael scott', '123 paper st', 'm', 75000.00, null, 1);
insert into employee13 values (102, 'dwight schrute', '456 farm rd', 'm', 60000.00, 101, 2);
insert into employee13 values (103, 'jim halpert', '789 prank ln', 'm', 55000.00, 101, 1);
insert into employee13 values (104, 'pam beesly', '321 art blvd', 'f', 50000.00, 101, 1);
insert into employee13 values (105, 'travis scott', '654 music ave', 'm', 80000.00, null, 2);
 
select * from employee13;
commit;

create table dlocation13 (dno int, dloc varchar(50), primary key (dno, dloc), foreign key (dno) references department13(dno));
desc dlocation13;
insert into dlocation13 values (1, 'dharwad');
insert into dlocation13 values (2, 'bangalore');
insert into dlocation13 values (3, 'hubli');
insert into dlocation13 values (4, 'dharwad');
insert into dlocation13 values (5, 'mumbai');
 
select * from dlocation13;
commit;

create table project13 (pno int primary key, pname varchar(50), plocation varchar(50), dno int, foreign key (dno) references department13(dno));
desc project13;
insert into project13 values (10, 'iot', 'bangalore', 2);
insert into project13 values (20, 'cloud migration', 'dharwad', 1);
insert into project13 values (30, 'data analytics', 'hubli', 3);
insert into project13 values (40, 'web portal', 'mumbai', 4);
insert into project13 values (50, 'ai chatbot', 'bangalore', 2);
 
select * from project13;
commit;

create table works_on13 (ssn int, pno int, hours int, primary key (ssn, pno), foreign key (ssn) references employee13(ssn), foreign key (pno) references project13(pno));
desc works_on13;
insert into works_on13 values (101, 20, 40);
insert into works_on13 values (102, 10, 35);
insert into works_on13 values (103, 10, 20);
insert into works_on13 values (104, 30, 25);
insert into works_on13 values (105, 10, 45);
 
select * from works_on13;
commit;

select w.pno from works_on13 w join employee13 e on w.ssn = e.ssn where e.name like '%scott' union select p.pno from project13 p join department13 d on p.dno = d.dno join employee13 e on d.mgrssn = e.ssn where e.name like '%scott';

select e.name, e.salary as old_salary, (e.salary * 1.10) as new_salary from employee13 e join works_on13 w on e.ssn = w.ssn join project13 p on w.pno = p.pno where p.pname = 'iot';

select sum(e.salary) as total_salary, max(e.salary) as max_salary, min(e.salary) as min_salary, avg(e.salary) as avg_salary from employee13 e join department13 d on e.dno = d.dno where d.dname = 'accounts';

create view dept_locations_view13 as select d.dname, l.dloc from department13 d join dlocation13 l on d.dno = l.dno;
select dname from dept_locations_view13 where dloc = 'dharwad';

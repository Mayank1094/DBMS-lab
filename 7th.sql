create table employee13 (ssn varchar(10) primary key, name varchar(20), address varchar(15), sex char(1), salary int);

insert into employee13 values ('5101', 'john', 'banglore', 'm', 50000);
insert into employee13 values ('5102', 'janu scott', 'dubai', 'f', 45000);
insert into employee13 values ('5103', 'kev scott', 'mumbai', 'm', 65000);
insert into employee13 values ('5104', 'suresh', 'hydrabad', 'm', 20000);
insert into employee13 values ('5105', 'rakesh', 'mumbai', 'm', 64000);
commit;

create table department13 (dno varchar(12) primary key, dname varchar(10), mgr_ssn varchar(10) references employee13(ssn), mgr_start_date date);

insert into department13 values ('d1', 'account', '5101', '24-jan-2021');
insert into department13 values ('d2', 'hr', '5102', '22-dec-2022');
insert into department13 values ('d3', 'helpdesk', '5103', '16-apr-2020');
insert into department13 values ('d4', 'it', null, '12-jun-2019');
insert into department13 values ('d5', 'sales', '5105', '05-feb-2022');

create table dlocation13 (dno varchar(12) references department13(dno), dloc varchar(15));

insert into dlocation13 values ('d1', 'banglore');
insert into dlocation13 values ('d2', 'banglore');
insert into dlocation13 values ('d3', 'mumbai');
insert into dlocation13 values ('d4', 'manglore');
insert into dlocation13 values ('d5', 'dubai');
commit;

create table project13 (pno int primary key, pname varchar(15), plocation varchar(10), dno varchar(12) references department13(dno));

insert into project13 values (10, 'iot', 'banglore', 'd1');
insert into project13 values (11, 'cloud', 'banglore', 'd2');
insert into project13 values (12, 'big data', 'banglore', 'd3');
insert into project13 values (13, 'open stack', 'manglore', 'd4');
insert into project13 values (14, 'sensor', 'manglore', 'd5');

create table works_on13 (ssn varchar(10) references employee13(ssn), hours int, pno int references project13(pno));

insert into works_on13 values ('5101', 20, 10);
insert into works_on13 values ('5102', 35, 11);
insert into works_on13 values ('5103', 15, 12);
insert into works_on13 values ('5104', 40, 13);
insert into works_on13 values ('5105', 25, 14);
commit;

select distinct p.pno from project13 p join works_on13 w on p.pno = w.pno join employee13 e on w.ssn = e.ssn where e.name like '%scott%' union select distinct p.pno from project13 p join department13 d on p.dno = d.dno join employee13 e on d.mgr_ssn = e.ssn where e.name like '%scott%';

select e.ssn, e.name, e.salary as current_salary, e.salary * 1.10 as raised_salary from employee13 e join works_on13 w on e.ssn = w.ssn join project13 p on w.pno = p.pno where p.pname = 'iot';

select sum(e.salary) as total_salary, max(e.salary) as maximum_salary, min(e.salary) as minimum_salary, avg(e.salary) as average_salary from employee13 e where e.ssn in (select d.mgr_ssn from department13 d where d.dname = 'account');

create or replace view dept_loc_view as select d.dname as dept_name, dl.dloc as dept_location from department13 d join dlocation13 dl on d.dno = dl.dno;

select * from dept_loc_view;
commit;

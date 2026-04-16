create table employee13 (ssn varchar2(5) primary key, name varchar2(10), address varchar2(15), sex char(1), salary int);

desc employee13;

insert into employee13 values ('s101','john','bangalore','m',50000);

insert into employee13 values ('s102','tanuscott','dubai','f',45000);

insert into employee13 values ('s103','kevin scott','mumbai','f',65000);

insert into employee13 values ('s104','suresh','hyderabad','m',20000);

insert into employee13 values ('s105','rakesh','mumbai','m',64000);

select * from employee13;

commit;

create table department13 (dno varchar2(12) primary key, dname varchar2(10), mgr_ssn varchar2(5) references employee13, mgr_start_date date);

desc department13;

insert into department13 values ('d1','account','s101','24-jan-2021');

insert into department13 values ('d2','hr','s102','22-dec-2022');

insert into department13 values ('d3','helpdesk','s103','16-apr-2020');

insert into department13 values ('d4','it','s104','12-jun-2019');

insert into department13 values ('d5','sales','s105','05-feb-2022');

select * from department13;

create table dlocation13 (dno varchar2(12) references department13(dno), dloc varchar2(12));

desc dlocation13;

insert into dlocation13 values ('d1','bangalore');

insert into dlocation13 values ('d2','bangalore');

insert into dlocation13 values ('d3','mumbai');

insert into dlocation13 values ('d4','mangalore');

insert into dlocation13 values ('d5','dubai');

select * from dlocation13;

commit;

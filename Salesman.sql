create table salesman13 (salesman_id int primary key, name varchar(10), city varchar(10), commission decimal(5,2));
desc salesman13;

insert into salesman13 values (1000, 'ravi', 'delhi', 0.15);
insert into salesman13 values (1001, 'suresh', 'hydrabad', 0.12);
insert into salesman13 values (1002, 'anil', 'chennai', 0.10);
insert into salesman13 values (1003, 'kiran', 'bangalore', 0.14);
insert into salesman13 values (1004, 'raj', 'mumbai', 0.15);
commit;
select * from salesman13;

create table customer13 (customer_id int primary key, cust_name varchar(10), city varchar(10), grade int, salesman_id int references salesman13(salesman_id));
desc customer13;

insert into customer13 values (2001, 'arun', 'bangalore', 300, 1000);
insert into customer13 values (2002, 'bala', 'hydrabad', 200, 1001);
insert into customer13 values (2003, 'charan', 'chennai', 400, 1002);
insert into customer13 values (2004, 'david', 'bangalore', 350, 1000);
insert into customer13 values (2005, 'esha', 'mumbai', 150, 1004);
commit;
select * from customer13;

create table orders13 (ord_no int primary key, purchase_amt decimal(10,2), ord_date date, customer_id int references customer13(customer_id), salesman_id int references salesman13(salesman_id));
desc orders13;

insert into orders13 values (3001, 5000, '10-jan-24', 2001, 1000);
insert into orders13 values (3002, 7000, '10-jan-24', 2003, 1002);
insert into orders13 values (3003, 2000, '11-jan-24', 2002, 1001);
insert into orders13 values (3004, 9000, '11-jan-24', 2004, 1000);
insert into orders13 values (3005, 3000, '12-jan-24', 2005, 1004);
commit;
select * from orders13;

select count(*) from customer13 where grade > (select avg(grade) from customer13 where city = 'bangalore');

select s.salesman_id, s.name from salesman13 s, customer13 c where s.salesman_id = c.salesman_id group by s.salesman_id, s.name having count(c.customer_id) > 1;

select s.name, s.city, 'has customer' as status from salesman13 s where exists (select 1 from customer13 c where c.salesman_id = s.salesman_id) union select s.name, s.city, 'no customer' as status from salesman13 s where not exists (select 1 from customer13 c where c.salesman_id = s.salesman_id);

create or replace view topsalesman13 as select o.ord_date, s.salesman_id, s.name, o.purchase_amt from orders13 o join salesman13 s on o.salesman_id = s.salesman_id where o.purchase_amt in (select max(purchase_amt) from orders13 group by ord_date);

select * from topsalesman13;

delete from orders13 where salesman_id = 1000;

delete from customer13 where salesman_id = 1000;

delete from salesman13 where salesman_id = 1000;
commit;

drop table order_details1;

drop table catalog1;

drop table category1;

drop table publisher1;

drop table author1;

create table author1(author_id number primary key,name varchar2(20),city varchar2(20),country varchar2(20));

desc author1;

insert into author1 values(101,'devaraj','mysore','india');

insert into author1 values(102,'lewis','london','uk');

insert into author1 values(103,'russell','ovval','australia');

insert into author1 values(104,'linda','queens','australia');

insert into author1 values(105,'norris','texas','usa');

select * from author1;

create table publisher1(publisher_id number primary key,name varchar2(20),city varchar2(20),country varchar2(20));

desc publisher1;

insert into publisher1 values(1001,'akshay','karwar','india');

insert into publisher1 values(1002,'gonzalo','colleo','peru');

insert into publisher1 values(1003,'smith','bristol','uk');

insert into publisher1 values(1004,'sato','osaka','japan');

insert into publisher1 values(1005,'arya','guwahati','india');

select * from publisher1;

create table category1(category_id number primary key,description varchar2(20));

desc category1;

insert into category1 values(3001,'enlighting');

insert into category1 values(3002,'magical');

insert into category1 values(3003,'melancholic');

insert into category1 values(3004,'lyrical');

insert into category1 values(3005,'enchanting');

select * from category1;

create table catalog1(book_id number primary key,title varchar2(20),author_id number,publisher_id number,category_id number,year number,price number,foreign key(author_id) references author1(author_id),foreign key(publisher_id) references publisher1(publisher_id),foreign key(category_id) references category1(category_id));

desc catalog1;

insert into catalog1 values(1001,'the guide',101,1001,3001,1972,478);

insert into catalog1 values(1002,'the galloway',104,1002,3002,1980,499);

insert into catalog1 values(1003,'rich dad',103,1003,3003,2001,499);

insert into catalog1 values(1004,'power',105,1004,3004,2010,1091);

insert into catalog1 values(1005,'destiny',104,1005,3005,2015,799);

select * from catalog1;

create table order_details1(order_no number primary key,book_id number,quantity number,foreign key(book_id) references catalog1(book_id));

desc order_details1;

insert into order_details1 values(1,1001,8);

insert into order_details1 values(2,1002,19);

insert into order_details1 values(3,1003,4);

insert into order_details1 values(4,1004,2);

insert into order_details1 values(5,1005,22);

select * from order_details1;

select * from author1 where author_id in(select author_id from catalog1 where price>(select avg(price) from catalog1) group by author_id having count(author_id)>=1);

select a.name from author1 a,catalog1 c where a.author_id=c.author_id and c.book_id in(select book_id from order_details1 where quantity=(select max(quantity) from order_details1));

update catalog1 set price=price*1.1 where publisher_id in(select publisher_id from publisher1 where name='arya');

select * from catalog1;

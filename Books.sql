drop table order_details1;

drop table catalog1;

drop table category23;

drop table publisher1;

drop table author1;

create table author1 (author_id int primary key, name varchar(10), city varchar(10), country varchar(10));

desc author1;

insert into author1 values (101, 'devraj', 'mysore', 'india');

insert into author1 values (102, 'lewis', 'london', 'uk');

insert into author1 values (103, 'russell', 'oval', 'australia');

insert into author1 values (104, 'india', 'yellpur', 'gullapur');

insert into author1 values (105, 'norris', 'dagio', 'usa');

insert into author1 values (106, 'kinni', 'oval', 'australia');

select * from author1;

commit;

create table publisher1 (publisher_id int primary key, name varchar(10), city varchar(10), country varchar(10));

desc publisher1;

insert into publisher1 values (1001, 'akshay', 'tsarwat', 'india');

insert into publisher1 values (1002, 'gonzola', 'colleo', 'pera');

insert into publisher1 values (1003, 'smith', 'bristol', 'uk');

insert into publisher1 values (1004, 'sato', 'osaka', 'japan');

insert into publisher1 values (1005, 'arya', 'guwahati', 'india');

select * from publisher1;

create table category23 (category_id int primary key, description varchar(10));

insert into category23 values (3001, 'enlighting');

insert into category23 values (3002, 'magical');

insert into category23 values (3003, 'melancholic');

insert into category23 values (3004, 'lyrical');

insert into category23 values (3005, 'enchanting');

select * from category23;

create table catalog1 (book_id int primary key, title varchar(15), author_id references author1(author_id), publisher_id references publisher1(publisher_id), category_id references category23(category_id), year int, price int);

commit;

insert into catalog1 values (1001, 'the grid', 101, 1001, 3001, 1972, 978);

insert into catalog1 values (1002, 'the gallery', 104, 1002, 3002, 1980, 499);

insert into catalog1 values (1003, 'rich dad', 103, 1003, 3003, 2010, 499);

insert into catalog1 values (1004, 'grovel', 105, 1004, 3004, 1910, 1091);

insert into catalog1 values (1005, 'destiny', 106, 1005, 3005, 1990, 799);

select * from catalog1;

create table order_details1 (order_no int primary key, book_id references catalog1(book_id), quantity int);

insert into order_details1 values (1, 1001, 8);

insert into order_details1 values (2, 1002, 19);

insert into order_details1 values (3, 1003, 4);

insert into order_details1 values (4, 1004, 2);

insert into order_details1 values (5, 1005, 22);

select * from order_details1;

select * from author1 where author_id in (select author_id from catalog1 where price > (select avg(price) from catalog1) group by author_id having count(author_id) >= 1);

select a.name from author1 a, catalog1 c where a.author_id = c.author_id and c.book_id in (select book_id from order_details1 where quantity = (select max(quantity) from order_details1));

update catalog1 set price = price + (price * 0.1) where publisher_id in (select publisher_id from publisher1 where name = 'arya');

select * from catalog1;

create table author (author_id int primary key, name varchar(20), city varchar(20), country varchar(20));

create table publisher (publisher_id int primary key, name varchar(20), city varchar(20), country varchar(20));

create table category (category_id int primary key, description varchar(20));

create table catalog (book_id int primary key, title varchar(20), author_id int, publisher_id int, category_id int, year int, price int, foreign key(author_id) references author(author_id), foreign key(publisher_id) references publisher(publisher_id), foreign key(category_id) references category(category_id));

create table order_details (order_no int primary key, book_id int, quantity int, foreign key(book_id) references catalog(book_id));

insert into author values (1, 'john', 'delhi', 'india');
insert into author values (2, 'smith', 'mumbai', 'india');
insert into author values (3, 'alice', 'chennai', 'india');
insert into author values (4, 'bob', 'pune', 'india');
insert into author values (5, 'mayank', 'ankola', 'india');

insert into publisher values (1, 'pub one', 'delhi', 'india');
insert into publisher values (2, 'pub two', 'mumbai', 'india');
insert into publisher values (3, 'pub three', 'chennai', 'india');
insert into publisher values (4, 'pub four', 'pune', 'india');
insert into publisher values (5, 'pub five', 'ankola', 'india');

insert into category values (1, 'fiction');
insert into category values (2, 'science');
insert into category values (3, 'history');
insert into category values (4, 'math');
insert into category values (5, 'art');

insert into catalog values (101, 'book a', 1, 1, 1, 2020, 500);
insert into catalog values (102, 'book b', 1, 2, 2, 2021, 800);
insert into catalog values (103, 'book c', 2, 1, 3, 2019, 300);
insert into catalog values (104, 'book d', 3, 3, 4, 2022, 700);
insert into catalog values (105, 'book e', 4, 4, 5, 2023, 400);

insert into order_details values (1001, 101, 5);
insert into order_details values (1002, 102, 10);
insert into order_details values (1003, 103, 2);
insert into order_details values (1004, 104, 8);
insert into order_details values (1005, 105, 3);

select a.author_id, a.name, a.city, a.country
from author a
where a.author_id in (
select author_id
from catalog
where price > (select avg(price) from catalog)
group by author_id
having count(book_id) >= 2
);

select a.name
from author a, catalog c, order_details o
where a.author_id = c.author_id
and c.book_id = o.book_id
and o.quantity = (select max(quantity) from order_details);

update catalog
set price = price + (price * 0.10)
where publisher_id = 1;

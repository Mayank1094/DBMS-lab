create table student13 (regno varchar2(10) primary key, name varchar2(15), major varchar2(15), bdate date);

desc student13;

insert into student13 values ('s001', 'aradhya', 'chemistry', '12-jan-04');

insert into student13 values ('s002', 'anun', 'physics', '16-jan-02');

insert into student13 values ('s003', 'kavya', 'cs', '23-apr-03');

insert into student13 values ('s004', 'nitin', 'maths', '21-dec-04');

insert into student13 values ('s005', 'radhika', 'account', '16-oct-03');

select * from student13;

create table course13 (course int primary key, cname varchar2(15), dept varchar2(15));

desc course13;

insert into course13 values (1, 'bsc', 'science');

insert into course13 values (2, 'bcom', 'commerce');

insert into course13 values (3, 'bca', 'cs');

insert into course13 values (4, 'diploma', 'mechanical');

insert into course13 values (5, 'be', 'engineer');

select * from course13;

create table enrol13 (regno varchar2(10) references student13(regno), course int references course13(course), sem int, marks int, primary key (regno, course));

desc enrol13;

insert into enrol13 values ('s001', 2, 3, 96);

insert into enrol13 values ('s002', 4, 1, 78);

insert into enrol13 values ('s003', 3, 2, 70);

insert into enrol13 values ('s004', 1, 4, 93);

insert into enrol13 values ('s005', 5, 6, 63);

select * from enrol13;

create table text13 (book_isbn int primary key, book_title varchar2(15), publisher varchar2(15), author varchar2(15));

desc text13;

insert into text13 values (29, 'power', 'akash', 'bhavana');

insert into text13 values (31, 'trignometry', 'manu', 'pratvi');

insert into text13 values (15, 'java', 'asha', 'prasanth');

insert into text13 values (16, 'python', 'sanvi', 'prasad');

insert into text13 values (21, 'chemi', 'keerti', 'avani');

insert into text13 values (17, 'php', 'asha', 'karan');

select * from text13;

create table bookadoption13 (course int references course13(course), sem int, book_isbn int references text13(book_isbn), primary key (course, book_isbn));

desc bookadoption13;

insert into bookadoption13 values (3, 3, 15);

insert into bookadoption13 values (3, 2, 16);

insert into bookadoption13 values (3, 1, 31);

insert into bookadoption13 values (3, 3, 21);

insert into bookadoption13 values (2, 1, 29);

insert into bookadoption13 values (3, 4, 17);

select * from bookadoption13;

select c.course, t.book_isbn, t.book_title from bookadoption13 b, text13 t, course13 c where c.course = b.course and c.dept = 'cs' and b.book_isbn = t.book_isbn and 2 < (select count(book_isbn) from bookadoption13 ba where c.course = ba.course) order by t.book_title;

select distinct c.dept from course13 c, bookadoption13 b, text13 t where c.course = b.course and b.book_isbn = t.book_isbn and t.publisher = 'asha';

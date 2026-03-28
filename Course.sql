drop table bookadoption37;
drop table trt37;
drop table enroll37;
drop table course37;
drop table student37;

create table student37(regno varchar(10) primary key, name varchar(12), major varchar(12), bdate date);
desc student37;

insert into student37 values('s001', 'Aradhya', 'chemistry','12-Jan-2004');
insert into student37 values('s002', 'Arun', 'Physics','16-Jun-2002');
insert into student37 values('s003', 'kavya', 'cs','23-Apr-2003');
insert into student37 values('s004', 'Nitin', 'Maths','21-Dec-2004');
insert into student37 values('s005', 'Radhika', 'Account','16-Oct-2003');
select * from student37;

create table course37(course int primary key, cname varchar(12), dept varchar(10));
desc course37;

insert into course37 values(1, 'BSC', 'Science');
insert into course37 values(2, 'B.com', 'Commerce');
insert into course37 values(3, 'BCA', 'CS');
insert into course37 values(4, 'Diploma', 'Mechanical');
insert into course37 values(5, 'Btech', 'Engineer');
select * from course37;

create table enroll37(regno varchar(10), course int, sem int, marks int, primary key(regno, course), foreign key(regno) references student37(regno), foreign key(course) references course37(course));
desc enroll37;

insert into enroll37 values('s001', 2, 3, 96);
insert into enroll37 values('s002', 4, 1, 78);
insert into enroll37 values('s003', 3, 2, 70);
insert into enroll37 values('s004', 1, 4, 93);
insert into enroll37 values('s005', 5, 6, 63);
select * from enroll37;

create table trt37(book_isbn int primary key, book_title varchar(15), publisher varchar(15), author varchar(10));
desc trt37;

insert into trt37 values(21, 'chemi', 'keerti', 'Avani');
insert into trt37 values(29, 'Pouri', 'Akash', 'Bhavana');
insert into trt37 values(31, 'Trignometry', 'Manu', 'Putvi');
insert into trt37 values(15, 'Java', 'Asha', 'Prasanth');
insert into trt37 values(16, 'Python', 'Sanvi', 'Prasad');
select * from trt37;

create table bookadoption37(course int, sem int, book_isbn int, primary key(course, book_isbn), foreign key(course) references course37(course), foreign key(book_isbn) references trt37(book_isbn));
desc bookadoption37;

insert into bookadoption37 values(3, 3, 15);
insert into bookadoption37 values(3, 2, 16);
insert into bookadoption37 values(3, 3, 31);
insert into bookadoption37 values(3, 3, 21);
insert into bookadoption37 values(2, 1, 29);
select * from bookadoption37;

insert into trt37 values(17, 'PHP', 'Asha', 'karan');
select * from trt37;

insert into bookadoption37 values(3, 4, 17);
select * from bookadoption37;

select c.course, b.book_isbn, t.book_title from course37 c, bookadoption37 b, trt37 t where c.course=b.course and t.book_isbn=b.book_isbn and c.dept='CS' and 2<(select count(book_isbn) from bookadoption37 ba where ba.course=c.course) order by t.book_title;

select distinct c.dept from course37 c where c.dept in (select c2.dept from course37 c2 join bookadoption37 b on c2.course=b.course join trt37 t on b.book_isbn=t.book_isbn where t.publisher='Asha');

commit;

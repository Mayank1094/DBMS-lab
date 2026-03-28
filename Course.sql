drop table if exists bookadoption37;
drop table if exists trt37;
drop table if exists enroll37;
drop table if exists course37;
drop table if exists student37;

create table student37(regno varchar(10) primary key,name varchar(12),major varchar(12),bdate date);
desc student37;

insert into student37 values('s001','radhya','chemistry','2004-01-13');
insert into student37 values('s002','arun','physics','2002-06-16');
insert into student37 values('s003','kavya','cs','2003-04-23');
insert into student37 values('s004','nithin','maths','2004-12-01');
insert into student37 values('s005','radhika','account','2003-10-16');
select * from student37;

create table course37(course int primary key,cname varchar(12),dept varchar(10));
desc course37;

insert into course37 values(1,'bsc','science');
insert into course37 values(2,'bcom','commerce');
insert into course37 values(3,'bca','cs');
insert into course37 values(4,'diploma','mechanical');
insert into course37 values(5,'btech','engineering');
select * from course37;

create table enroll37(regno varchar(10),course int,sem int,marks int,primary key(regno,course),foreign key(regno) references student37(regno),foreign key(course) references course37(course));
desc enroll37;

insert into enroll37 values('s001',2,3,96);
insert into enroll37 values('s002',4,1,78);
insert into enroll37 values('s003',3,2,70);
insert into enroll37 values('s004',1,4,93);
insert into enroll37 values('s005',5,6,63);
select * from enroll37;

create table trt37(book_isbn int primary key,book_title varchar(15),publisher varchar(15),author varchar(10));
desc trt37;

insert into trt37 values(21,'chemi','kerti','anu');
insert into trt37 values(29,'pouri','akash','bhavna');
insert into trt37 values(31,'trigonometry','manu','pooja');
insert into trt37 values(15,'java','asha','prasad');
insert into trt37 values(16,'python','sonu','prasad');
select * from trt37;

create table bookadoption37(course int,sem int,book_isbn int,primary key(course,book_isbn),foreign key(course) references course37(course),foreign key(book_isbn) references trt37(book_isbn));
desc bookadoption37;

insert into bookadoption37 values(3,3,15);
insert into bookadoption37 values(3,2,16);
insert into bookadoption37 values(3,3,31);
insert into bookadoption37 values(3,3,21);
insert into bookadoption37 values(2,1,29);
select * from bookadoption37;

insert into trt37 values(17,'php','asha','karan');
select * from trt37;

insert into bookadoption37 values(3,4,17);
select * from bookadoption37;

select c.course,b.book_isbn,t.book_title from course37 c,bookadoption37 b,trt37 t where c.course=b.course and t.book_isbn=b.book_isbn and c.dept='cs' and 2<(select count(book_isbn) from bookadoption37 ba where ba.course=c.course) order by t.book_title;

select distinct c.dept from course37 c where c.dept in (select c2.dept from course37 c2 join bookadoption37 b on c2.course=b.course join trt37 t on b.book_isbn=t.book_isbn where t.publisher='asha');

commit;

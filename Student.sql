create table student01 (
    regno varchar(10) primary key,
    name varchar(10),
    class varchar(10),
    bdate varchar(10),
    marks1 int,
    marks2 int,
    marks3 int
);

insert into student01 values ('s001', 'gopal', 'a', '2000-03-15', 85, 92, 78);
insert into student01 values ('s002', 'ravindra', 'b', '2006-03-19', 78, 80, 75);
insert into student01 values ('s003', 'kartik', 'c', '2005-01-11', 92, 70, 65);
insert into student01 values ('s004', 'mayank', 'd', '2006-07-21', 90, 85, 70);
insert into student01 values ('s005', 'amrut', 'e', '2006-11-11', 90, 70, 60);
commit;

select * from student01 where class = 'a' and marks3 = 78;

select regno, marks1, marks2, marks3 from student01 order by marks3 desc;

select regno, marks1 from student01 group by regno, marks1 having marks1 >= 85;

select class, avg(marks1) as avg_marks from student01 group by class;

select sum(marks1) from student01;

select count(*) from student01 where class = 'a';

select * from student01 where name like '%a%';

select regno, name, class, bdate, marks3 from student01 where marks3 between 80 and 90;

select * from student01 where marks2 = (select max(marks2) from student01);

select * from student01 where marks2 = (select min(marks2) from student01);

insert into student01 values ('s006', 'sujan', 'b', '2010-10-07', 87, 65, 75);
commit;

delete from student01 where regno = 's006';
rollback;

select * from student01;

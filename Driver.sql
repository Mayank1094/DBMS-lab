create table person23(driver_id varchar(10) primary key,name varchar(20),address varchar(30));

desc person23;

insert into person23 values('d0001','akash','kannada');

insert into person23 values('d0002','akhil','kerala');

insert into person23 values('d0003','sunil','kannada');

insert into person23 values('d0004','vijay','bangalore');

insert into person23 values('d0005','vimal','udupi');

select * from person23;

create table car23(regno varchar(10) primary key,model varchar(20),year int);

desc car23;

insert into car23 values('r001','honda',2010);

insert into car23 values('r002','toyota',2012);

insert into car23 values('r003','ford',2014);

insert into car23 values('r004','maruti',2016);

insert into car23 values('r005','hyundai',2015);

select * from car23;

create table accident23(report_no int primary key,report_date date,location varchar(20));

desc accident23;

insert into accident23 values(11,'2002-01-01','bhalki');

insert into accident23 values(12,'2020-02-03','ahmedabad');

insert into accident23 values(13,'2010-03-13','surat');

insert into accident23 values(14,'2002-04-20','kundapura');

insert into accident23 values(15,'2015-05-15','honnawara');

select * from accident23;

create table owns23(driver_id varchar(10),regno varchar(10),primary key(driver_id,regno),foreign key(driver_id) references person23(driver_id),foreign key(regno) references car23(regno));

desc owns23;

insert into owns23 values('d0001','r001');

insert into owns23 values('d0001','r002');

insert into owns23 values('d0002','r003');

insert into owns23 values('d0003','r004');

insert into owns23 values('d0004','r005');

select * from owns23;

create table participated23(driver_id varchar(10),regno varchar(10),report_no int,damage_amt int,foreign key(driver_id) references person23(driver_id),foreign key(regno) references car23(regno),foreign key(report_no) references accident23(report_no),damage_amt int);

desc participated23;

insert into participated23 values('d0001','r001',12,5000);

insert into participated23 values('d0002','r003',13,10000);

insert into participated23 values('d0004','r005',14,35000);

insert into participated23 values('d0003','r002',11,25000);

insert into participated23 values('d0001','r004',15,15000);

select * from participated23;

update participated23 set damage_amt=25000 where regno='r001' and report_no=12;

select * from participated23;

insert into accident23 values(6,'2023-06-06','udupi');

select * from accident23;

insert into participated23 values('d0004','r005',6,65000);

select * from participated23;

select count(distinct driver_id) as total_owners from owns23 where regno in(select regno from participated23 where report_no in(select report_no from accident23 where year(report_date)=2002));

select c.model,count(distinct p.report_no) as total_accident from car23 c join participated23 p on c.regno=p.regno group by c.model;

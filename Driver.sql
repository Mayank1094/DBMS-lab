create table person23 (driver_id varchar(10) primary key, name varchar(10), address varchar(10));
insert into person23 values ('d001', 'akash', 'kumta');
insert into person23 values ('d002', 'akul', 'ankola');
insert into person23 values ('d003', 'sumit', 'karwar');
insert into person23 values ('d004', 'virat', 'banglore');
insert into person23 values ('d005', 'vipul', 'udupi');

create table car23 (regno varchar(10) primary key, model varchar(20), year int);
insert into car23 values ('r001', 'honda', 2010);
insert into car23 values ('r002', 'toyota', 2012);
insert into car23 values ('r003', 'ford', 2014);
insert into car23 values ('r004', 'maruti', 2016);
insert into car23 values ('r005', 'hyunda', 2016);

create table accident23 (report_no int primary key, report_date date, location varchar(10));
insert into accident23 values (11, '01-jan-2002', 'bhatkal');
insert into accident23 values (12, '03-feb-2020', 'ahemdabad');
insert into accident23 values (13, '13-mar-2010', 'surat');
insert into accident23 values (14, '20-apr-2002', 'kundapur');
insert into accident23 values (15, '15-may-2015', 'honnawar');

create table owns23 (driver_id varchar(10), regno varchar(20), foreign key (driver_id) references person23(driver_id), foreign key (regno) references car23(regno));
insert into owns23 values ('d001', 'r001');
insert into owns23 values ('d002', 'r002');
insert into owns23 values ('d003', 'r003');
insert into owns23 values ('d004', 'r004');
insert into owns23 values ('d004', 'r005');

create table participated23 (driver_id varchar(10), regno varchar(10), report_no int, damage_amt int, foreign key (driver_id) references person23(driver_id), foreign key (regno) references car23(regno), foreign key (report_no) references accident23(report_no));
insert into participated23 values ('d001', 'r001', 12, 5000);
insert into participated23 values ('d002', 'r003', 13, 10000);
insert into participated23 values ('d004', 'r005', 14, 35000);
insert into participated23 values ('d003', 'r002', 11, 25000);
insert into participated23 values ('d001', 'r004', 15, 15000);

update participated23 set damage_amt = 25000 where regno = 'r001' and report_no = 12;

insert into accident23 values (16, '06-jun-2023', 'vasco');
insert into participated23 values ('d004', 'r005', 16, 65000);

select count(distinct driver_id) as total_owners from owns23 where regno in (select regno from participated23 where report_no in (select report_no from accident23 where extract(year from report_date) = 2002));

select model, count(distinct report_no) as total_accident from car23 join participated23 on car23.regno = participated23.regno group by model;

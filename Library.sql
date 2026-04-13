create table publisher13 (name varchar(20) primary key, address varchar(20), phone number(10));

desc publisher13;

insert into publisher13 values ('megrow', 'bangalore', 9956452932);

insert into publisher13 values ('pearson', 'new delhi', 8798327212);

insert into publisher13 values ('random', 'hydrabad', 9502386823);

insert into publisher13 values ('livre', 'chennai', 7843981204);

insert into publisher13 values ('planeta', 'bangalore', 8498230974);

select * from publisher13;

create table book13 (book_id int primary key, title varchar(15), publisher_name varchar(20) references publisher13(name), pub_year int);

desc book13;

insert into book13 values (1, 'dbms', 'megrow', 2017);

insert into book13 values (2, 'cn', 'megrow', 2016);

insert into book13 values (3, 'dc', 'pearson', 2016);

insert into book13 values (4, 'cg', 'planeta', 2015);

insert into book13 values (5, 'ds', 'pearson', 2016);

select * from book13;

create table bookauthor13 (book_id int references book13(book_id) on delete cascade, author_name varchar(15));

desc bookauthor13;

insert into bookauthor13 values (1, 'navathe');

insert into bookauthor13 values (2, 'navathe');

insert into bookauthor13 values (3, 'tanenbaum');

insert into bookauthor13 values (4, 'angel');

insert into bookauthor13 values (5, 'galvin');

select * from bookauthor13;

create table librarybranch13 (branch_id int primary key, branch_name varchar(20), address varchar(20));

desc librarybranch13;

insert into librarybranch13 values (10, 'rr nagar', 'bangalore');

insert into librarybranch13 values (11, 'rnsit', 'bangalore');

insert into librarybranch13 values (12, 'rajajinagar', 'bangalore');

insert into librarybranch13 values (13, 'nitte', 'mangalore');

insert into librarybranch13 values (14, 'manipal', 'udupi');

select * from librarybranch13;

create table bookcopies13 (book_id int references book13(book_id) on delete cascade, branch_id int references librarybranch13(branch_id) on delete cascade, no_of_copies int, primary key (book_id, branch_id));

desc bookcopies13;

insert into bookcopies13 values (1, 10, 100);

insert into bookcopies13 values (3, 12, 150);

insert into bookcopies13 values (5, 14, 200);

insert into bookcopies13 values (2, 13, 115);

insert into bookcopies13 values (4, 12, 152);

select * from bookcopies13;

create table booklending13 (book_id int references book13(book_id) on delete cascade, branch_id int references librarybranch13(branch_id) on delete cascade, card_no varchar(5), date_out date, due_date date, primary key (book_id, branch_id, card_no, date_out));

desc booklending13;

insert into booklending13 values (2, 14, 'c101', '20-apr-17', '25-may-17');

insert into booklending13 values (2, 11, 'c101', '20-feb-17', '10-mar-17');

insert into booklending13 values (2, 10, 'c102', '10-jan-23', '23-jan-23');

insert into booklending13 values (2, 13, 'c101', '20-feb-17', '10-mar-17');

insert into booklending13 values (3, 12, 'c101', '20-may-17', '10-jun-17');

select * from booklending13;

select b.book_id, b.title, b.publisher_name as publishername, a.author_name as authorname, c.no_of_copies, c.branch_id from book13 b join bookauthor13 a on b.book_id = a.book_id join bookcopies13 c on b.book_id = c.book_id join librarybranch13 l on l.branch_id = c.branch_id;

select card_no from booklending13 where date_out between '01-jan-2017' and '01-jun-2017' group by card_no having count(card_no) > 3;

update bookcopies13 set no_of_copies = 100 where book_id = 4;

update bookcopies13 set no_of_copies = 150 where book_id = 3;

delete from book13 where book_id = 4;

select * from book13;

create view available_books13 as select b.book_id, b.title, bc.no_of_copies, ba.author_name from book13 b join bookauthor13 ba on b.book_id = ba.book_id join bookcopies13 bc on b.book_id = bc.book_id where bc.no_of_copies > 0;

select * from available_books13;

commit;

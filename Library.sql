create table publisher37 (name varchar2(20) primary key, address varchar2(20), phone number(38));

desc publisher37;

insert into publisher37 values ('megrow', 'bangalore', 9956452932);

insert into publisher37 values ('pearson', 'new delhi', 8798327212);

insert into publisher37 values ('random', 'hydrabad', 9502386823);

insert into publisher37 values ('livre', 'chennai', 7843981204);

insert into publisher37 values ('planeta', 'bangalore', 8498230974);

select * from publisher37;

create table book37 (book_id int primary key, title varchar2(15), publisher_name varchar2(20) references publisher37(name), pub_year int);

desc book37;

insert into book37 values (1, 'dbms', 'megrow', 2017);

insert into book37 values (2, 'cn', 'megrow', 2016);

insert into book37 values (3, 'dc', 'pearson', 2016);

insert into book37 values (4, 'cg', 'planeta', 2015);

insert into book37 values (5, 'ds', 'pearson', 2016);

select * from book37;

create table bookauthor37 (book_id int references book37(book_id) on delete cascade, author_name varchar2(15));

desc bookauthor37;

insert into bookauthor37 values (1, 'navathe');

insert into bookauthor37 values (2, 'navathe');

insert into bookauthor37 values (3, 'tanenbaum');

insert into bookauthor37 values (4, 'angel');

insert into bookauthor37 values (5, 'galvin');

select * from bookauthor37;

create table librarybranch37 (branch_id int primary key, branch_name varchar2(20), address varchar2(20));

desc librarybranch37;

insert into librarybranch37 values (10, 'rr nagar', 'bangalore');

insert into librarybranch37 values (11, 'rnsit', 'bangalore');

insert into librarybranch37 values (12, 'rajajinagar', 'bangalore');

insert into librarybranch37 values (13, 'nitte', 'mangalore');

insert into librarybranch37 values (14, 'manipal', 'udupi');

select * from librarybranch37;

create table bookcopies37 (book_id int references book37(book_id) on delete cascade, branch_id int references librarybranch37(branch_id) on delete cascade, no_of_copies int);

desc bookcopies37;

insert into bookcopies37 values (1, 10, 100);

insert into bookcopies37 values (3, 12, 150);

insert into bookcopies37 values (5, 14, 200);

insert into bookcopies37 values (2, 13, 115);

insert into bookcopies37 values (4, 12, 152);

select * from bookcopies37;

create table booklending37 (book_id int references book37(book_id) on delete cascade, branch_id int references librarybranch37(branch_id) on delete cascade, card_no varchar2(5), date_out date, due_date date);

desc booklending37;

insert into booklending37 values (2, 14, 'c101', '20-apr-17', '25-may-17');

insert into booklending37 values (2, 11, 'c101', '20-feb-17', '10-mar-17');

insert into booklending37 values (2, 10, 'c102', '10-jan-23', '23-jan-23');

insert into booklending37 values (2, 13, 'c101', '20-feb-17', '10-mar-17');

insert into booklending37 values (3, 12, 'c101', '20-may-17', '10-jun-17');

select * from booklending37;

select b.book_id, b.title, b.publisher_name as publishername, a.author_name as authorname, c.no_of_copies, c.branch_id from book37 b, bookauthor37 a, bookcopies37 c, librarybranch37 l where b.book_id = a.book_id and b.book_id = c.book_id and l.branch_id = c.branch_id;

select card_no from booklending37 where date_out between '01-jan-2017' and '01-jun-2017' group by card_no having count(card_no) > 3;

update bookcopies37 set no_of_copies = 100 where book_id = 4;

update bookcopies37 set no_of_copies = 150 where book_id = 3;

delete from book37 where book_id = 4;

select * from book37;

create view available_books37 as select b.book_id, b.title, bc.no_of_copies, ba.author_name from book37 b join bookauthor37 ba on b.book_id = ba.book_id join bookcopies37 bc on b.book_id = bc.book_id where bc.no_of_copies > 0;

select * from available_books37;

commit;

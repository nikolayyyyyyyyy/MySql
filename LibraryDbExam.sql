/*Creating database*/
create database library;

/*Using the created database*/
use Library;

/*Creating tables*/
CREATE TABLE authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL
);

create table pushing_houses(
id int primary key auto_increment,
`name` varchar(40) unique not null
);

create table genres(
id int primary key auto_increment,
`name` varchar(30) unique not null
);

create table positions(
id int primary key auto_increment,
`name` varchar(30) unique not null
);

create table books(
id int primary key auto_increment,
`name` varchar(50) unique not null,
DateOfIssue date not null,
author_id int not null,
pushing_house_id int not null,
genre_id int not null,
foreign key (author_id) references authors(id),
foreign key (pushing_house_id) references pushing_houses(id),
foreign key (genre_id) references genres(id) 
);

create table employees(
id int primary key auto_increment,
first_name varchar(20) not null,
last_name varchar(20) not null,
position_id int not null,
telephone_number varchar(50) unique not null,
foreign key (position_id) references positions(id)
);

create table readers(
id int primary key auto_increment,
first_name varchar(30) not null,
last_name varchar(30) not null,
telephone_number varchar(50) unique not null
);

create table browings(
id int primary key auto_increment,
reader_id int not null,
employee_id int not null,
foreign key (reader_id) references readers(id),
foreign key (employee_id) references employees(id)
);


create table books_browings(
book_id int not null,
browing_id int not null,
date_of_taking date not null,
term date not null,
is_returned char(1) not null,
foreign key (book_id) references books(id),
foreign key (browing_id) references browings(id)
);


/*Insert data into tables*/
insert into authors(first_name,last_name)
values
('Николай','Николаев'),
('Иван','Калимаров'),
('Кристиян','Мераков'),
('Дженко','Дженков'),
('Атанас','Генчев'),
('Мария','Тодорова');

insert into pushing_houses(`name`)
values
('Българско национално издателство'),
('България за писателите'),
('АртасООД'),
('Кентавър');

insert into genres(`name`)
values
('Екшън'),
('Фантастика'),
('Романтика'),
('Комедия'),
('Приключенски');

insert into positions(`name`)
values
('Рецепционист'),
('Директор'),
('Библиотекар'),
('Администрация'),
('Счетоводител'),
('Историк');

insert into books(`name`,DateOfIssue,author_id,pushing_house_id,genre_id)
values
('Едно хубаво лято','2024-01-12',1,1,5),
('Лято на село','2024-02-01',1,1,5),
('В търсене на златното руно','2024-01-11',2,1,1),
('До холандия и обратно','2022-12-04',2,1,3),
('Кола на залог','2020-03-02',3,3,2),
('Нападение над земята','2019-05-14',3,4,4),
('Зима в камиона','2023-12-12',4,3,4),
('Имало едно време','2018-10-10',4,3,4),
('История за леприкони','2023-12-11',5,4,3),
('Хелоуин','2024-02-12',5,1,4),
('Неделни вечери','2024-04-22',6,4,4),
('От едно време','2024-06-23',6,1,1);

insert into employees(first_name,last_name,position_id,telephone_number)
values
('Христо','Николаев',2,'+3593245423'),
('Дияна','Радкева',4,'+3597623223'),
('Иван','Радкев',1,'+3597766122'),
('Цветомир','Радкев',3,'+359876622'),
('Христинка','Радкева',6,'+359754222'),
('Християн','Петров',5,'+3598733245');

insert into readers(first_name,last_name,telephone_number)
values
('Розалия','Петрова','+3599999988'),
('Стилян','Пенчев','+35986654522'),
('Геновева','Асенова','+3593232332'),
('Микаела','Мишева','+3596561234'),
('Дидия','Генчева','+3598763232'),
('Георги','Мирянов','+3598776233');

insert into browings(reader_id,employee_id)
values
(1,1),
(2,4),
(3,1),
(4,5),
(5,2),
(6,1);

insert into books_browings(book_id,browing_id,date_of_taking,term,is_returned)
values
(1,1,'2024-01-10','2024-01-11',0),
(2,1,'2024-01-10','2024-01-20',0),
(3,2,'2024-01-10','2024-01-27',0),
(4,2,'2024-03-09','2024-03-13',0),
(5,3,'2024-03-09','2024-03-20',0),
(6,3,'2024-03-09','2024-04-01',0),
(7,4,'2024-02-07','2024-02-11',0),
(8,4,'2024-02-05','2024-02-06',0),
(9,5,'2024-02-07','2024-02-23',0),
(10,5,'2024-04-11','2024-04-15',0),
(11,6,'2024-05-14','2024-05-19',0),
(12,6,'2024-09-11','2024-10-01',0);

/*Книга по автор:*/
select
b.`name` as 'Име на книга',
b.DateOfIssue as 'Дата на издаване',
concat_ws(' ',a.first_name,a.last_name) as 'Име на автора',
p.`name` as 'Издателство'
from books as b
join authors as a on a.id = b.author_id
join pushing_houses as p on p.id = b.pushing_house_id
where concat_ws(' ',a.first_name,a.last_name) = "Николай Николаев";

/*Книга по ключова дума от наименование*/
select
b.`name` as 'Име на книга',
concat_ws(' ',a.first_name,a.last_name) as 'Име на автора'
from books as b
join authors as a on a.id = b.author_id
where b.`name` like '%от%';

/*Книга по жанр*/
select
b.`name` as 'Име на книга',
g.`name` as 'Жанр'	
from books as b
join genres as g on g.id = b.genre_id
where g.`name` = 'Приключенски';

/*Заети книги от читател*/
select
b.`name` as 'Име на книга',
p.`name` as 'Издателство',
concat_ws(' ',a.first_name,a.last_name) as 'Име на автора',
concat_ws(' ',r.first_name,r.last_name) as 'Име на читател',
concat_ws(' ',e.first_name,e.last_name) as 'Име на работник',
bb.date_of_taking as 'Дата на заемане',
bb.term as 'Дата за връщане',
bb.is_returned as 'Активна'
from books as b
join books_browings as bb on bb.book_id = b.id
join browings as br on br.id = bb.browing_id
join pushing_houses as p on p.id = b.pushing_house_id
join authors as a on a.id = b.author_id
join readers as r on r.id = br.reader_id
join employees as e on e.id = br.employee_id
where concat_ws(' ',r.first_name,r.last_name) = 'Розалия Петрова';


/*Връщане на книга*/
update books_browings as bb
join browings as b on b.id = bb.browing_id
join readers as r on r.id = b.reader_id
	set bb.is_returned = 1
where concat_ws(' ',r.first_name,r.last_name) = 'Розалия Петрова' and b.id = 1;

/*Книги който не са върнати*/
select
b.`name` as 'Име на книга',
p.`name` as 'Издателство',
concat_ws(' ',a.first_name,a.last_name) as 'Име на автора',
concat_ws(' ',r.first_name,r.last_name) as 'Име на читател',
concat_ws(' ',e.first_name,e.last_name) as 'Име на работник',
bb.date_of_taking as 'Дата на заемане',
bb.term as 'Дата за връщане',
bb.is_returned as 'Активна'
from books as b
join books_browings as bb on bb.book_id = b.id
join browings as br on br.id = bb.browing_id
join pushing_houses as p on p.id = b.pushing_house_id
join authors as a on a.id = b.author_id
join readers as r on r.id = br.reader_id
join employees as e on e.id = br.employee_id
where bb.is_returned = 0;

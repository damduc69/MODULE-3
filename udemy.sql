create database cg_udemy;

use cg_udemy;

create table courses(
	id int not null,
    name varchar(50) not null,
    description varchar(255) not null,
    duration int null,
    is_online boolean not null,
    price float not null
);

select * from cg_udemy.courses;

alter table courses add status boolean not null;

alter table courses drop is_online;

create table if not exists persons(
	id int not null unique,
    last_name varchar(50) not null,
    first_name varchar(50) not null,
    email varchar(50) not null unique,
    phone varchar(12) not null unique,
    age int,
    check (age >= 16)
);

select * from cg_udemy.persons
	order by id asc
;

insert into persons (id, last_name, first_name, email, phone, age) 
values
-- (1, 'Louis', 'David', 'david@gmail.com', '09081234567', 17),
-- (2, 'Edeson', 'Thomas', 'thomas@gmail.com', '09081234566', 16),
(5, 'Nam', 'Anh', 'nam@gmail.com', '09081234565', 25),
(4, 'Tu', 'Chi', 'tu@gmail.com', '09081234564', 24),
(3, 'Three', 'Baby', 'three@gmail.com', '09081234563', 23)
;

select * from persons
where id > 2;





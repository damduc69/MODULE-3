create database if not exists QuanLySinhVien;

use QuanLySinhVien;

create table Class(
	ClassID int not null auto_increment primary key,
    ClassName varchar(60) not null,
	StartDate datetime not null,
    Status bit
);

select * from Class;

create table Student(
	StudentID int not null auto_increment primary key,
    StudentName varchar(30) not null,
    Address varchar(50),
    Phone varchar(20),
    Status bit,
    ClassID int not null
);

-- drop table Student;

select * from Student
where Status = true;

create table Subject(
	SubID int not null auto_increment primary key,
    SubName varchar(30) not null,
    Credit tinyint not null default 1 check (Credit >= 1),
    Status bit default 1
);

select * from Subject
where credit < 10;

create table Mark(
	MarkID int not null auto_increment primary key,
    SubID int not null,
    StudentID int not null,
    Mark float default 0 check (mark between 0 and 100),
    ExamTimes tinyint default 1,
    unique (SubID, StudentID),
    foreign key (SubID) references Subject (SubID),
    foreign key (StudentID) references Student (StudentID)
);

select * from Mark;

insert into Class values (1, 'A1', '2008-12-20', 1); 
insert into Class values (2, 'A2', '2008-12-22', 1);
insert into Class values (3, 'B3', current_date, 0);

insert into Student (StudentName, Address, Phone, Status, ClassID)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into Student (StudentName, Address, Phone, Status, ClassID)
values ('Hoa', 'Hai phong','0123456789', 1, 1);
insert into Student (StudentName, Address, Phone, Status, ClassID)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into Subject
values (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 insert into Mark (SubId, StudentId, Mark, ExamTimes)
 values (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
 show columns from Student;
 
 select S.StudentID, S.StudentName, C.ClassName
 from Student S join Class C on S.ClassID = C.ClassID
 where C.ClassName = 'A1';
 
 select S.StudentId,  S.StudentName, Sub.SubName, M.Mark
 from Student S join Mark M on S.StudentID = M.StudentID join Subject Sub on M.SubID = Sub.SubID
 where Sub.SubName = 'CF';
 
 select *
 from Student
 where StudentName like 'h%' or StudentName like 'H%';
 
 select *
 from Class
 where month(StartDate) = 12;
 
 select *
 from Subject
 where credit between 3 and 5;
 
 update Student
 set ClassID = 2
 where StudentName = 'Hung';
 
 select S.StudentName, Sub.SubName, M.Mark
 from Student S
 join Mark M on S.StudentID = M.StudentID
 join Subject Sub on Sub.SubID = M.SubID
 order by M.Mark DESC, S.StudentName ASC;
 
 select Address, count(StudentId) as 'So luong SV'
 from Student
 group by Address;
 
 select S.StudentId, S.StudentName, avg(Mark)
 from Student S join Mark M on S.StudentId = M.StudentId
 group by S.StudentId, S.StudentName;
 
 select S.StudentId, S.StudentName, avg(Mark)
 from Student S join Mark M on S.StudentId = M.StudentId
 group by S.StudentId, S.StudentName
 having avg(Mark) > 5;
 
select S.StudentId, S.StudentName, avg(Mark)
from Student S join Mark M on S.StudentId = M.StudentId
group by S.StudentId, S.StudentName
having avg(Mark) >= all (select avg(Mark) from Mark group by Mark.StudentId);


 
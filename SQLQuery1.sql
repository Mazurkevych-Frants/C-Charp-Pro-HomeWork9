create database StudentsRatings; --создаем базу данных
go --разделяет набор команд
use StudentsRatings; --установка соединения с нашей созданной базой

create table StudentsRatings --создаем таблицу
(
    StudentsRatingsId int identity(1, 1),
    FullName nvarchar(50) not null,
    City nvarchar(20) not null,
    Country nvarchar(10) not null,
    DateOfBirth nvarchar(10) not null,
    EmailAddress nvarchar(50),
    PhoneNumber bigint not null,
    GroupName nvarchar(20) not null,
    AverageGrade tinyint not null,
    MinGradeSubject nvarchar(15),
    MaxGradeSubject nvarchar(15),
    constraint PK_StudentsRatings_StudentsRatingsId primary key (StudentsRatingsId),
    constraint CK_StudentsRatings_AverageGrade check (AverageGrade > 0),
    constraint UQ_StudentsRatings_EmailAddress unique (EmailAddress),
    constraint UQ_StudentsRatings_PhoneNumber unique (PhoneNumber)
);
--Добавляем данные в таблицу
insert into StudentsRatings (FullName, City, Country, DateOfBirth, EmailAddress, PhoneNumber, GroupName, AverageGrade, MinGradeSubject, MaxGradeSubject)
values
('Mazyrkevich F. V.', 'Odessa', 'Ukraine', '05.04.2001', 'tofer052001@gmail.com', 380988015346, 'C# Pro', 78, 'Multithreading', 'SOLID'),
('Vasya', 'Kyiv', 'Ukraine', '00.00.1992', 'VasyaKotoromyStabilno33@gmail.com', 380991234333, 'C# Pro', 100, 'There is not', 'In everything'),
('Petya', 'Kyiv', 'Ukraine', '00.00.0000', 'qwerty@gmail.com', 380992234987, 'Python', 65, 'qwer', 'tyui'),
('Anton', 'Kyiv', 'Ukraine', '00.00.0000', 'poiuuy@gmail.com', 380992235534, 'Java', 44, 'qwer', 'tyui')

--Получаем все обьекты таблицы
select * from StudentsRatings

--Получаем ФИО учеников
select FullName from StudentsRatings

--Получаем средние оценки всех учеников
select AverageGrade from StudentsRatings

--Получаем всех учеников у которых минимальная оценка больше чем заданная
select FullName from StudentsRatings
where AverageGrade > 70

--Получаем города студентов (повторяющиеся города не показываем) и так же с странами и названиями групп
select distinct City from StudentsRatings 

select distinct Country from StudentsRatings

select distinct GroupName from StudentsRatings

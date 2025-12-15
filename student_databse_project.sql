CREATE TABLE STUDENTS_NEW_1 (
student_id int auto_increment primary key,
first_name varchar(100),
last_name varchar(100),
gender varchar(100),
date_of_birth date,
email varchar(100) unique,
phone int,
created_at timestamp
);
select * from STUDENTS_NEW_1;
insert into STUDENTS_NEW_1  (first_name,last_name,gender,date_of_birth,email,phone) values
('John','Doe','Male','1995-03-12','john.doe@email.com','9876543210'),
('Jane','Smith','Female','1998-07-25','jane.smith@email.com','9123456789'),
('Michael','Johnson','Male','1992-11-05','michael.johnson@email.com','8765432109'),
('Emily','Williams','Female','1996-04-18','emily.williams@email.com','7654321098'),
('David','Brown','Male','1994-09-30','david.brown@email.com','6543210987'),
('Sophia','Miller','Female','1997-02-14','sophia.miller@email.com','5432109876'),
('James','Davis','Male','1993-06-21','james.davis@email.com','4321098765'),
('Olivia','Garcia','Female','1999-12-03','olivia.garcia@email.com','3210987654'),
('Robert','Wilson','Male','1991-08-09','robert.wilson@email.com','2109876543'),
('Ava','Anderson','Female','1995-05-28','ava.anderson@email.com','1098765432'),
('William','Martinez','Male','1998-10-11','william.martinez@email.com','9876543211'),
('Isabella','Thomas','Female','1996-01-17','isabella.thomas@email.com','8765432110'),
('Alexander','Lopez','Male','1994-07-23','alexander.lopez@email.com','7654321109'),
('Mia','Moore','Female','1997-04-06','mia.moore@email.com','6543211098'),
('Ethan','Taylor','Male','1992-12-15','ethan.taylor@email.com','5432110987');

alter table STUDENTS_NEW_1 modify column phone varchar(20);
alter table STUDENTS_NEW_1 modify column created_at timestamp default current_timestamp;
insert into STUDENTS_NEW_1 (first_name,last_name,gender,date_of_birth,email,phone) values
('Rohan','Kuamr','Male','2000-09-11','rohankumar45@gmail.com','4567893213');



CREATE TABLE departments_new (
department_id int auto_increment primary key,
department_name varchar(30) unique
);
select * from departments_new;
insert into departments_new  (department_name) values
('Computer Science'),
('Electrical Engineering'),
('Mechanical Engineering'),
('Civil Engineering'),
('Information Technology'),
('Electronics & Communication'),
('Chemical Engineering'),
('Biotechnology'),
('Mathematics'),
('Physics'),
('Chemistry'),
('Management Studies'),
('Architecture'),
('Biomedical Engineering'),
('Artificial Intelligence');

CREATE TABLE courses_new (
course_id int auto_increment primary key,
course_name varchar(30),
department_id int,
credits int,
foreign key (department_id) references departments_new (department_id)
);
select * from courses_new;
insert into courses_new  (course_name,department_id,credits) values
('Data Structures','1','4'),
('Database Systems','1','3'),
('Digital Logic Design','2','4'),
('Circuit Analysis','2','3'),
('Thermodynamics','3','4'),
('Strength of Materials','3','3'),
('Structural Analysis','4','4'),
('Fluid Mechanics','4','3'),
('Web Programming','5','3'),
('Network Security','5','4'),
('VLSI Design','6','4'),
('Embedded Systems','6','3'),
('Organic Chemistry','11','3'),
('Business Management','12','3'),
('Machine Learning','15','4');

CREATE TABLE enrollments_new (
enrollment_id int auto_increment primary key,
student_id int,
course_id int,
enrollment_date date,
grade varchar(30),
foreign key (student_id) references STUDENTS_NEW_1(student_id),
foreign key (course_id) references courses_new (course_id)
);
select * from enrollments_new;
insert into enrollments_new  (student_id,course_id,enrollment_date,grade) values
(1,1,'2025-09-01','A'),
(1,2,'2025-09-01','B+'),
(2,3,'2025-09-01','A-'),
(2,5,'2025-09-01','B'),
(3,4,'2025-09-01','A'),
(3,7,'2025-09-01','B+'),
(4,6,'2025-09-01','A'),
(4,9,'2025-09-01','A-'),
(5,8,'2025-09-01','B'),
(5,10,'2025-09-01','A'),
(6,11,'2025-09-01','B+'),
(6,13,'2025-09-01','A-'),
(7,12,'2025-09-01','A'),
(7,14,'2025-09-01','B'),
(8,15,'2025-09-01','A');


select * from STUDENTS_NEW_1;
select * from departments_new;
select * from courses_new;
select * from enrollments_new;
select student_id,first_name,last_name,email from STUDENTS_NEW_1;
select * from departments_new where department_name = 'Architecture';
select * from courses_new where department_id = 5;
select * from STUDENTS_NEW_1 order by first_name;
select * from STUDENTS_NEW_1 order by date_of_birth;
select * from STUDENTS_NEW_1 where email = 'emily.williams@email.com';
select count(student_id) as count_student from STUDENTS_NEW_1;


select date_of_birth,first_name from STUDENTS_NEW_1 where date_of_birth = '1992-11-05';
select count(credits) as count_credits from courses_new;
select count(distinct credits) from courses_new;
select min(credits) as min_credits from courses_new;
select max(credits) as max_credits from courses_new;
select sum(credits) as sum_credits from courses_new;
select avg(credits) as avg_credits from courses_new;
select upper(first_name) as upper_name from STUDENTS_NEW_1;
select lower(last_name) as lower_name from STUDENTS_NEW_1;
select concat('<',first_name,'>',last_name) from STUDENTS_NEW_1;
update courses_new set course_name = 'Data Structures' where course_id = 4;
update courses_new set course_name = 'Data Structures' where course_id = 8;
update courses_new set course_name = 'Data Structures' where course_id = 13;
update courses_new set course_name = 'Computer Scienece' where course_id = 15;

select * from enrollments_new where grade = 'A';

select 
    STUDENTS_NEW_1.first_name,
    STUDENTS_NEW_1.last_name,
    departments_new.department_name
from STUDENTS_NEW_1
inner join enrollments_new
    on STUDENTS_NEW_1.student_id = enrollments_new.student_id
inner join courses_new
    on enrollments_new.course_id = courses_new.course_id
inner join departments_new
    on courses_new.department_id = departments_new.department_id;

select 
    courses_new.course_name,
    departments_new.department_name
from courses_new
inner join departments_new
    on courses_new.department_id = departments_new.department_id;


select 
    STUDENTS_NEW_1.first_name,
    STUDENTS_NEW_1.last_name,
    enrollments_new.course_id,
    enrollments_new.grade
from STUDENTS_NEW_1
left join enrollments_new
    on STUDENTS_NEW_1.student_id = enrollments_new.student_id;
    
    
select 
    STUDENTS_NEW_1.first_name,
    STUDENTS_NEW_1.last_name,
    enrollments_new.course_id,
    enrollments_new.grade
from enrollments_new
left join STUDENTS_NEW_1
    on STUDENTS_NEW_1.student_id = enrollments_new.student_id;











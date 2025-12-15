🎓 Student Database Management System (MySQL)
📌 Project Overview

This project is a beginner-friendly Student Database Management System built using MySQL.
It focuses on relational database design, foreign key usage, and correct JOIN logic using realistic academic data.

The main goal is to understand how tables relate to each other, not just to write SQL that “runs”.

🧱 Database Structure

The database contains four related tables.

1️⃣ STUDENTS_NEW_1

Stores basic student information.

Columns

student_id (Primary Key, Auto Increment)

first_name

last_name

gender

date_of_birth

email (Unique)

phone

created_at (Default: CURRENT_TIMESTAMP)

2️⃣ departments_new

Stores academic departments.

Columns

department_id (Primary Key)

department_name (Unique)

3️⃣ courses_new

Stores courses offered by departments.

Columns

course_id (Primary Key)

course_name

department_id (Foreign Key → departments_new.department_id)

credits

4️⃣ enrollments_new

Maps students to courses and stores grades.

Columns

enrollment_id (Primary Key)

student_id (Foreign Key → STUDENTS_NEW_1.student_id)

course_id (Foreign Key → courses_new.course_id)

enrollment_date

grade

🔗 Table Relationships

One department can have many courses

One student can enroll in many courses

One course can have many enrollments

All relationships are enforced using foreign keys.

📊 SQL Concepts Demonstrated

This project covers the following SQL concepts:

Table creation with constraints

Primary keys and foreign keys

Auto-increment columns

Data insertion and updates

Filtering and sorting data

Aggregate functions:

COUNT, MIN, MAX, SUM, AVG

String functions:

UPPER, LOWER, CONCAT

JOIN operations:

INNER JOIN

LEFT JOIN

🔍 Sample Queries
🔹 Basic SELECT Queries
select student_id, first_name, last_name, email
from STUDENTS_NEW_1;

select *
from STUDENTS_NEW_1
order by date_of_birth;

select count(student_id) as total_students
from STUDENTS_NEW_1;

🔹 Filtering Data
select *
from departments_new
where department_name = 'Architecture';

select *
from courses_new
where department_id = 5;

🔹 Aggregate Functions
select min(credits) as min_credits from courses_new;
select max(credits) as max_credits from courses_new;
select avg(credits) as avg_credits from courses_new;

🔗 JOIN Queries (Correct Relational Logic)
1️⃣ Student → Course → Department

Shows which department a student belongs to through course enrollment.

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

2️⃣ Course → Department

Shows which department offers each course.

select 
    courses_new.course_name,
    departments_new.department_name
from courses_new
inner join departments_new
    on courses_new.department_id = departments_new.department_id;

3️⃣ Student LEFT JOIN Enrollment

Shows all students, including those not enrolled in any course.

select 
    STUDENTS_NEW_1.first_name,
    STUDENTS_NEW_1.last_name,
    enrollments_new.course_id,
    enrollments_new.grade
from STUDENTS_NEW_1
left join enrollments_new
    on STUDENTS_NEW_1.student_id = enrollments_new.student_id;

4️⃣ Enrollment LEFT JOIN Student

Shows all enrollments with corresponding student details.

select 
    STUDENTS_NEW_1.first_name,
    STUDENTS_NEW_1.last_name,
    enrollments_new.course_id,
    enrollments_new.grade
from enrollments_new
left join STUDENTS_NEW_1
    on STUDENTS_NEW_1.student_id = enrollments_new.student_id;

⚠️ Project Limitations

This project is intentionally simple:

No stored procedures or triggers

No cascading delete/update rules

No indexes beyond primary keys

Minimal data validation

These limitations keep the project easy to understand for beginners.

🛠 Tools Used

MySQL

MySQL Workbench

🎯 Who This Project Is For

SQL beginners

Computer Science students

Anyone learning relational databases

Entry-level interview preparation

🚀 Possible Improvements

Add NOT NULL and CHECK constraints

Normalize course naming

Add indexes for performance

Create views for reporting

Introduce stored procedures

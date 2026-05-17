
-- WEEK 1 DAY 3 - SQL JOINS PRACTICE


create table students(
    student_id int,
    student_name varchar(50),
    email varchar(100)
);

insert into students values
(1,'Alice Johnson','alice@email.com'),
(2,'Bob Smith','bob@email.com'),
(3,'Charlie Brown','charlie@email.com'),
(4,'Diana Prince','diana@email.com'),
(5,'Ethan Hunt','ethan@email.com');



create table instructors(
    instructor_id int,
    instructor_name varchar(50)
);

insert into instructors values
(1,'Karthik'),
(2,'Ravi'),
(3,'Sneha'),
(4,'Arjun');



create table courses(
    course_id int,
    course_name varchar(50),
    instructor_id int
);

insert into courses values
(101,'SQL Basics',1),
(102,'Python Fundamentals',2),
(103,'Data Analytics',null),
(104,'Cloud Computing',3),
(105,'Machine Learning',null);



create table enrollments(
    enrollment_id int,
    student_id int,
    course_id int
);

insert into enrollments values
(1,1,101),
(2,2,102),
(3,3,101),
(4,1,104);




-- Q1
-- Display all students and their enrolled courses

select
s.student_name,
c.course_name

from students s

left join enrollments e
on s.student_id = e.student_id

left join courses c
on e.course_id = c.course_id;




-- Q2
-- Find courses with no students enrolled

select
c.course_name

from courses c

left join enrollments e
on c.course_id = e.course_id

where e.student_id is null;




-- Q3
-- Display instructors and courses they teach

select
i.instructor_name,
c.course_name

from instructors i

left join courses c
on i.instructor_id = c.instructor_id;




-- Q4
-- Find courses without instructor assigned

select
course_name

from courses

where instructor_id is null;




-- Q5
-- Display students and enrollment using RIGHT JOIN

select
s.student_name,
e.course_id

from students s

right join enrollments e
on s.student_id = e.student_id;




-- Q6
-- Find students not enrolled in any course

select
s.student_name

from students s

left join enrollments e
on s.student_id = e.student_id

where e.course_id is null;




-- Q7
-- FULL OUTER JOIN for students and enrollments

select
s.student_name,
e.course_id

from students s

left join enrollments e
on s.student_id = e.student_id

union

select
s.student_name,
e.course_id

from students s

right join enrollments e
on s.student_id = e.student_id;




-- Q8
-- Find courses never used in enrollments

select
c.course_name

from courses c

left join enrollments e
on c.course_id = e.course_id

where e.course_id is null;




-- Q9
-- FULL OUTER JOIN for instructors and courses

select
i.instructor_name,
c.course_name

from instructors i

left join courses c
on i.instructor_id = c.instructor_id

union

select
i.instructor_name,
c.course_name

from instructors i

right join courses c
on i.instructor_id = c.instructor_id;




-- Q10
-- Student name, course name and instructor name report

select
s.student_name,
c.course_name,
i.instructor_name

from students s

left join enrollments e
on s.student_id = e.student_id

left join courses c
on e.course_id = c.course_id

left join instructors i
on c.instructor_id = i.instructor_id;




-- BONUS QUESTION
-- Display every student and every course

select
s.student_name,
c.course_name

from students s

cross join courses c;
```

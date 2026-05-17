
-- WEEK 1 DAY 6 COLLEGE MANAGEMENT SYSTEM PRACTICE


-- Q1
-- Display all students with department names

select
s.student_name,
d.department_name,
s.cgpa

from student s

left join department d
on s.department_id = d.department_id;



-- Q2
-- Find students with CGPA greater than 8

select
student_name,
cgpa

from student

where cgpa > 8;



-- Q3
-- Display all staff and their departments

select
st.staff_name,
st.designation,
d.department_name

from staff st

left join department d
on st.department_id = d.department_id;



-- Q4
-- Find highest paid staff member

select
staff_name,
salary

from staff

where salary = (
    select max(salary)
    from staff
);



-- Q5
-- Display subjects with assigned faculty names

select
sub.subject_name,
sub.subject_code,
st.staff_name

from subject sub

left join staff st
on sub.staff_id = st.staff_id;



-- Q6
-- Count students department wise

select
d.department_name,
count(s.student_id) as total_students

from department d

left join student s
on d.department_id = s.department_id

group by d.department_name;



-- Q7
-- Find average CGPA department wise

select
d.department_name,
round(avg(s.cgpa),2) as average_cgpa

from department d

left join student s
on d.department_id = s.department_id

group by d.department_name;



-- Q8
-- Find students whose CGPA is NULL

select
student_name,
cgpa

from student

where cgpa is null;



-- Q9
-- Display marks scored by students

select
s.student_name,
sub.subject_name,
m.exam_type,
m.marks

from mark m

join student s
on m.student_id = s.student_id

join subject sub
on m.subject_id = sub.subject_id;



-- Q10
-- Find topper based on highest marks

select
s.student_name,
m.marks

from mark m

join student s
on m.student_id = s.student_id

where m.marks = (
    select max(marks)
    from mark
);



-- Q11
-- Find total subjects handled by each faculty

select
st.staff_name,
count(sub.subject_id) as total_subjects

from staff st

left join subject sub
on st.staff_id = sub.staff_id

group by st.staff_name;



-- Q12
-- Display students admitted after 2020

select
student_name,
admission_year

from student

where admission_year > 2020;



-- Q13
-- Find department with highest budget

select
department_name,
yearly_budget

from department

where yearly_budget = (
    select max(yearly_budget)
    from department
);



-- Q14
-- Display male and female student count

select
gender,
count(*) as total_students

from student

group by gender;



-- Q15
-- Find subjects with more than 3 credits

select
subject_name,
credits

from subject

where credits > 3;
```

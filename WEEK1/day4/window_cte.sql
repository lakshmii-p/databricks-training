



-- Q1
-- Assign row numbers based on highest salary

select
employee_name,
department,
salary,

row_number() over(
order by salary desc
) as row_num

from employees;



-- Q2
-- Rank employees department wise by salary

select
employee_name,
department,
salary,

rank() over(
partition by department
order by salary desc
) as salary_rank

from employees;



-- Q3
-- Dense rank employees based on salary

select
employee_name,
salary,

dense_rank() over(
order by salary desc
) as dense_salary_rank

from employees;



-- Q4
-- Find running total of order amounts

select
order_id,
order_date,
total_amount,

sum(total_amount) over(
order by order_date
) as running_total

from orders;



-- Q5
-- Find average salary within each department

select
employee_name,
department,
salary,

avg(salary) over(
partition by department
) as department_avg_salary

from employees;



-- Q6
-- Find highest salary in each department

select
employee_name,
department,
salary,

max(salary) over(
partition by department
) as highest_department_salary

from employees;



-- Q7
-- Compare employee salary with previous salary

select
employee_name,
salary,

lag(salary) over(
order by salary
) as previous_salary

from employees;



-- Q8
-- Compare employee salary with next salary

select
employee_name,
salary,

lead(salary) over(
order by salary
) as next_salary

from employees;
```

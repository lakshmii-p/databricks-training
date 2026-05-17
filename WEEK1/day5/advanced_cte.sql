


-- Q1
-- Basic CTE to filter high salary employees

with high_salary as (

select
employee_name,
department,
salary

from employees

where salary > 80000
)

select * from high_salary;



-- Q2
-- Department wise average salary using CTE

with dept_avg as (

select
department,
avg(salary) as avg_salary

from employees

group by department
)

select * from dept_avg;



-- Q3
-- Find employees earning above department average

with dept_salary as (

select
department,
avg(salary) as avg_salary

from employees

group by department
)

select
e.employee_name,
e.department,
e.salary

from employees e

join dept_salary d
on e.department = d.department

where e.salary > d.avg_salary;



-- Q4
-- Recursive CTE for employee-manager hierarchy

with recursive employee_hierarchy as (

select
employee_id,
employee_name,
manager_id

from employees

where manager_id is null

union all

select
e.employee_id,
e.employee_name,
e.manager_id

from employees e

join employee_hierarchy eh
on e.manager_id = eh.employee_id
)

select * from employee_hierarchy;



-- Q5
-- Find difference between current and previous order amount

select
order_id,
order_date,
total_amount,

lag(total_amount) over(
order by order_date
) as previous_order,

total_amount -
lag(total_amount) over(
order by order_date
) as difference_amount

from orders;



-- Q6
-- Find next order amount

select
order_id,
total_amount,

lead(total_amount) over(
order by order_date
) as next_order_amount

from orders;



-- Q7
-- Find cumulative average of order amounts

select
order_id,
total_amount,

avg(total_amount) over(
order by order_date
) as cumulative_average

from orders;



-- Q8
-- Find top paid employee from each department

with ranked_employees as (

select
employee_name,
department,
salary,

rank() over(
partition by department
order by salary desc
) as salary_rank

from employees
)

select
employee_name,
department,
salary

from ranked_employees

where salary_rank = 1;
```

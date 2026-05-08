# SQL Practice Queries (1–65)

```sql
-- Question 1: Select all columns from the Employee table
SELECT *
FROM Employee;

--------------------------------------------------

-- Question 2: Select only the name and salary columns from the Employee table
SELECT name, salary
FROM Employee;

--------------------------------------------------

-- Question 3: Select employees who are older than 30
SELECT *
FROM Employee
WHERE age > 30;

--------------------------------------------------

-- Question 4: Select the names of all departments
SELECT name
FROM Department;

--------------------------------------------------

-- Question 5: Select employees who work in the IT department
SELECT *
FROM Employee
WHERE department_id = 1;

--------------------------------------------------

-- Question 6: Select employees whose names start with 'J'
SELECT *
FROM Employee
WHERE name LIKE 'J%';

--------------------------------------------------

-- Question 7: Select employees whose names end with 'e'
SELECT *
FROM Employee
WHERE name LIKE '%e';

--------------------------------------------------

-- Question 8: Select employees whose names contain 'a'
SELECT *
FROM Employee
WHERE name LIKE '%a%';

--------------------------------------------------

-- Question 9: Select employees whose names are exactly 9 characters long
SELECT *
FROM Employee
WHERE name LIKE '_________';

--------------------------------------------------

-- Question 10: Select employees whose names have 'o' as the second character
SELECT *
FROM Employee
WHERE name LIKE '_o%';

--------------------------------------------------

-- Question 11: Select employees hired in the year 2020
SELECT *
FROM Employee
WHERE YEAR(hire_date) = 2020;

--------------------------------------------------

-- Question 12: Select employees hired in January of any year
SELECT *
FROM Employee
WHERE MONTH(hire_date) = 1;

--------------------------------------------------

-- Question 13: Select employees hired before 2019
SELECT *
FROM Employee
WHERE hire_date < '2019-01-01';

--------------------------------------------------

-- Question 14: Select employees hired on or after March 1, 2021
SELECT *
FROM Employee
WHERE hire_date >= '2021-03-01';

--------------------------------------------------

-- Question 15: Select employees hired in the last 2 years
SELECT *
FROM Employee
WHERE hire_date >= '2019-01-01';

--------------------------------------------------

-- Question 16: Select the total salary of all employees
SELECT SUM(salary) AS total_salary
FROM Employee;

--------------------------------------------------

-- Question 17: Select the average salary of employees
SELECT AVG(salary) AS average_salary
FROM Employee;

--------------------------------------------------

-- Question 18: Select the minimum salary in the Employee table
SELECT MIN(salary) AS minimum_salary
FROM Employee;

--------------------------------------------------

-- Question 19: Select the number of employees in each department
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id;

--------------------------------------------------

-- Question 20: Select the average salary of employees in each department
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id;

--------------------------------------------------

-- Question 21: Select the total salary for each department
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id;

--------------------------------------------------

-- Question 22: Select the average age of employees in each department
SELECT department_id, AVG(age) AS average_age
FROM Employee
GROUP BY department_id;

--------------------------------------------------

-- Question 23: Select the number of employees hired in each year
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date);

--------------------------------------------------

-- Question 24: Select the highest salary in each department
SELECT department_id, MAX(salary) AS highest_salary
FROM Employee
GROUP BY department_id;

--------------------------------------------------

-- Question 25: Select the department with the highest average salary
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
ORDER BY average_salary DESC
LIMIT 1;

--------------------------------------------------

-- Question 26: Select departments with more than 2 employees
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

--------------------------------------------------

-- Question 27: Select departments with an average salary greater than 55000
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

--------------------------------------------------

-- Question 28: Select years with more than 1 employee hired
SELECT YEAR(hire_date) AS hire_year, COUNT(*) AS employee_count
FROM Employee
GROUP BY YEAR(hire_date)
HAVING COUNT(*) > 1;

--------------------------------------------------

-- Question 29: Select departments with a total salary expense less than 100000
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
HAVING SUM(salary) < 100000;

--------------------------------------------------

-- Question 30: Select departments with the maximum salary above 75000
SELECT department_id, MAX(salary) AS max_salary
FROM Employee
GROUP BY department_id
HAVING MAX(salary) > 75000;

--------------------------------------------------

-- Question 31: Select all employees ordered by their salary in ascending order
SELECT *
FROM Employee
ORDER BY salary ASC;

--------------------------------------------------

-- Question 32: Select all employees ordered by their age in descending order
SELECT *
FROM Employee
ORDER BY age DESC;

--------------------------------------------------

-- Question 33: Select all employees ordered by their hire date in ascending order
SELECT *
FROM Employee
ORDER BY hire_date ASC;

--------------------------------------------------

-- Question 34: Select employees ordered by their department and then by their salary
SELECT *
FROM Employee
ORDER BY department_id ASC, salary ASC;

--------------------------------------------------

-- Question 35: Select departments ordered by the total salary of their employees
SELECT department_id, SUM(salary) AS total_salary
FROM Employee
GROUP BY department_id
ORDER BY total_salary DESC;

--------------------------------------------------

-- Question 36: Select employee names along with their department names
SELECT Employee.name AS employee_name,
       Department.name AS department_name
FROM Employee
JOIN Department
ON Employee.department_id = Department.department_id;

--------------------------------------------------

-- Question 37: Select project names along with the department names they belong to
SELECT Project.name AS project_name,
       Department.name AS department_name
FROM Project
JOIN Department
ON Project.department_id = Department.department_id;

--------------------------------------------------

-- Question 38: Select employee names and their corresponding project names
SELECT Employee.name AS employee_name,
       Project.name AS project_name
FROM Employee
JOIN Project
ON Employee.department_id = Project.department_id;

--------------------------------------------------

-- Question 39: Select all employees and their departments, including those without a department
SELECT Employee.name AS employee_name,
       Department.name AS department_name
FROM Employee
LEFT JOIN Department
ON Employee.department_id = Department.department_id;

--------------------------------------------------

-- Question 40: Select all departments and their employees, including departments without employees
SELECT Department.name AS department_name,
       Employee.name AS employee_name
FROM Department
LEFT JOIN Employee
ON Department.department_id = Employee.department_id;

--------------------------------------------------

-- Question 41: Select employees who are not assigned to any project
SELECT Employee.name
FROM Employee
LEFT JOIN Project
ON Employee.department_id = Project.department_id
WHERE Project.project_id IS NULL;

--------------------------------------------------

-- Question 42: Select employees and the number of projects their department is working on
SELECT Employee.name,
       COUNT(Project.project_id) AS project_count
FROM Employee
JOIN Project
ON Employee.department_id = Project.department_id
GROUP BY Employee.name;

--------------------------------------------------

-- Question 43: Select the departments that have no employees
SELECT Department.name
FROM Department
LEFT JOIN Employee
ON Department.department_id = Employee.department_id
WHERE Employee.emp_id IS NULL;

--------------------------------------------------

-- Question 44: Select employee names who share the same department with 'John Doe'
SELECT name
FROM Employee
WHERE department_id = (
    SELECT department_id
    FROM Employee
    WHERE name = 'John Doe'
);

--------------------------------------------------

-- Question 45: Select the department name with the highest average salary
SELECT Department.name,
       AVG(Employee.salary) AS average_salary
FROM Employee
JOIN Department
ON Employee.department_id = Department.department_id
GROUP BY Department.name
ORDER BY average_salary DESC
LIMIT 1;

--------------------------------------------------

-- Question 46: Select the employee with the highest salary
SELECT *
FROM Employee
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
);

--------------------------------------------------

-- Question 47: Select employees whose salary is above the average salary
SELECT *
FROM Employee
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
);

--------------------------------------------------

-- Question 48: Select the second highest salary from the Employee table
SELECT MAX(salary) AS second_highest_salary
FROM Employee
WHERE salary < (
    SELECT MAX(salary)
    FROM Employee
);

--------------------------------------------------

-- Question 49: Select the department with the most employees
SELECT department_id, COUNT(*) AS employee_count
FROM Employee
GROUP BY department_id
ORDER BY employee_count DESC
LIMIT 1;

--------------------------------------------------

-- Question 50: Select employees who earn more than the average salary of their department
SELECT *
FROM Employee e1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);

--------------------------------------------------

-- Question 51: Select the nth highest salary (example: 3rd highest)
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

--------------------------------------------------

-- Question 52: Select employees who are older than all employees in the HR department
SELECT *
FROM Employee
WHERE age > ALL (
    SELECT age
    FROM Employee
    WHERE department_id = 2
);

--------------------------------------------------

-- Question 53: Select departments where the average salary is greater than 55000
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING AVG(salary) > 55000;

--------------------------------------------------

-- Question 54: Select employees who work in a department with at least 2 projects
SELECT *
FROM Employee
WHERE department_id IN (
    SELECT department_id
    FROM Project
    GROUP BY department_id
    HAVING COUNT(*) >= 2
);

--------------------------------------------------

-- Question 55: Select employees who were hired on the same date as 'Jane Smith'
SELECT *
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE name = 'Jane Smith'
);

--------------------------------------------------

-- Question 56: Select the total salary of employees hired in the year 2020
SELECT SUM(salary) AS total_salary
FROM Employee
WHERE YEAR(hire_date) = 2020;

--------------------------------------------------

-- Question 57: Select the average salary of employees in each department, ordered by average salary in descending order
SELECT department_id, AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
ORDER BY average_salary DESC;

--------------------------------------------------

-- Question 58: Select departments with more than 1 employee and an average salary greater than 55000
SELECT department_id,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 1
AND AVG(salary) > 55000;

--------------------------------------------------

-- Question 59: Select employees hired in the last 2 years, ordered by their hire date
SELECT *
FROM Employee
WHERE hire_date >= '2019-01-01'
ORDER BY hire_date ASC;

--------------------------------------------------

-- Question 60: Select the total number of employees and the average salary for departments with more than 2 employees
SELECT department_id,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary
FROM Employee
GROUP BY department_id
HAVING COUNT(*) > 2;

--------------------------------------------------

-- Question 61: Select the name and salary of employees whose salary is above the average salary of their department
SELECT name, salary
FROM Employee e1
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);

--------------------------------------------------

-- Question 62: Select the names of employees who are hired on the same date as the oldest employee in the company
SELECT name
FROM Employee
WHERE hire_date = (
    SELECT hire_date
    FROM Employee
    WHERE age = (
        SELECT MAX(age)
        FROM Employee
    )
);

--------------------------------------------------

-- Question 63: Select the department names along with the total number of projects they are working on, ordered by the number of projects
SELECT Department.name,
       COUNT(Project.project_id) AS project_count
FROM Department
LEFT JOIN Project
ON Department.department_id = Project.department_id
GROUP BY Department.name
ORDER BY project_count DESC;

--------------------------------------------------

-- Question 64: Select the employee name with the highest salary in each department
SELECT department_id, name, salary
FROM Employee e1
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);

--------------------------------------------------

-- Question 65: Select the names and salaries of employees who are older than the average age of employees in their department
SELECT name, salary
FROM Employee e1
WHERE age > (
    SELECT AVG(age)
    FROM Employee e2
    WHERE e1.department_id = e2.department_id
);
```


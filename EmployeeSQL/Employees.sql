
CREATE TABLE "departments" (
    "dept_no" varchar NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);


CREATE TABLE "dept_emp" (
    "emp_no" int not null,
    "dept_no" varchar  NOT NULL
     );


CREATE TABLE "dept_manager" (
    "dept_no" varchar not null,
    "emp_no" int not null
);

create table dept_manager(
dept_no varchar not null,
	emp_no int not null
)

CREATE TABLE "employees" (
  "emp_no" int  PRIMARY KEY,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" varchar   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" varchar   NOT NULL
     )

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL
);

select * from employees
select * from salaries
select * from titles
SELECT * FROM departments
select * from dept_emp
select * from dept_manager
------------------------------------------------------------------------------------------------------------
----List the employee number, last name, first name, sex, and 
----salary of each employee.


select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries on
salaries.emp_no=employees.emp_no;

------------------------------------------------------------------------------------------------------------
------List the first name, last name, and hire date for the
------employees who were hired in 1986

select first_name, last_name, hire_date 
from employees
where hire_date like '%/1986';
------------------------------------------------------------------------------------------------------------
-----List the manager of each department along with their department number, 
-----department name, employee number, last name, and first name

select employees.emp_no, employees.last_name, employees.first_name,
 dept_manager.dept_no,  departments.dept_name
from employees
inner join dept_manager on employees.emp_no = dept_manager.emp_no
inner join departments on dept_manager.dept_no = departments.dept_no;

------------------------------------------------------------------------------------------------------------
-----List the department number for each employee along with 
-----that employee’s employee number, last name, first name,
-----and department name 

select employees.emp_no, employees.last_name, employees.first_name,
 dept_emp.dept_no,  departments.dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no;

------------------------------------------------------------------------------------------------------------
---List first name, last name, and sex of each employee whose first name is
---Hercules and whose last name begins with the letter B 
select employees.first_name, employees.last_name, employees.sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

------------------------------------------------------------------------------------------------------------
----List each employee in the Sales department, including their employee
----number, last name, and first name 
select employees.emp_no, employees.last_name, employees.first_name
from employees
where emp_no in
(
select emp_no
from dept_emp
where dept_no in (

select dept_no
from departments
where dept_name = 'Sales'));

------------------------------------------------------------------------------------------------------------
---List each employee in the Sales and Development departments, including their
---employee number, last name, first name, and department name 

select employees.emp_no, employees.last_name, employees.first_name
from employees
where emp_no in
(
select emp_no
from dept_emp
where dept_no in (

select dept_no
from departments
where dept_name = 'Sales'))

union

select employees.emp_no, employees.last_name, employees.first_name
from employees
where emp_no in
(
select emp_no
from dept_emp
where dept_no in (

select dept_no
from departments
where dept_name = 'Development'));

------------------------------------------------------------------------------------------------------------
--List the frequency counts, in descending order, of all the employee last names
--(that is, how many employees share each last name)

select last_name, count(*) as frequency
from employees
group by last_name
order by frequency DESC;

-----------------------------------------------------------------------------------------------------------

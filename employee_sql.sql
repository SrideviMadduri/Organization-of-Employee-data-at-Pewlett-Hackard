select * from department
select * from dept_emp
select * from dept_manager
select * from employee
select * from salaries
select * from title

-- 1. List the following details of each employee: employee number,
-- last name, first name, sex, and salary.

select e.emp_no , e.last_name,e.first_name, e.sex, s.salary
from  employee as e inner join salaries as s on e.emp_no = s.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.


select first_name , last_name , hire_date from employee
where hire_date BETWEEN '1986-01-01' AND '1986-12-31' order by hire_date ;

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number,
-- last name, first name.

select * from department
select * from dept_manager
select * from employee



select dm.dept_no ,dm.emp_no ,d.dept_name , e.last_name , e.first_name 
from  dept_manager dm inner join department d on dm.dept_no =d.dept_no
inner join employee e on e.emp_no = dm.emp_no

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
-- select * from dept_emp
select  de.emp_no , d.dept_name ,
e.last_name , e.first_name
from dept_emp de inner join department d on de.dept_no =d.dept_no
inner join employee e on e.emp_no =de.emp_no


-- List first name, last name, and sex for employees whose 
-- first name is "Hercules" and last names begin with "B."

select first_name , last_name , sex from employee
where first_name = 'Hercules' 
 and last_name like 'B%'


-- 6. List all employees in the Sales department, including their employee number,
-- last name, first name, and department name.
select * from department
select * from employee

select employee.emp_no , employee.last_name , employee.first_name , department.dept_name
from department inner join dept_emp on department.dept_no = dept_emp.dept_no
inner join employee on employee.emp_no = dept_emp.emp_no 
where department.dept_name='Sales'
				 
 
 
--  7. List all employees in the Sales and Development departments, 
--  including their employee number, 
--  last name, first name, and department name

select employee.emp_no , employee.last_name , employee.first_name , department.dept_name
from department inner join dept_emp on department.dept_no = dept_emp.dept_no
inner join employee on employee.emp_no = dept_emp.emp_no 
where department.dept_name='Sales' or department.dept_name='Development'


-- 8. List the frequency count of employee last names
-- (i.e., how many employees share each last name) in descending order.
				 
select last_name ,count(last_name) as count from  employee group by last_name  order by count desc

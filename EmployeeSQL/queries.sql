-- Question 1
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees as e, salaries as s
where e.emp_no = s.emp_no;

-- Question 2
select first_name, last_name, hire_date
from employees
where hire_date >= '1986-01-01'
and hire_date <= '1986-12-31';

-- Question 3
select dm.dept_no, ds.dept_name, dm.emp_no, es.last_name, es.first_name
from dept_manager as dm, departments as ds, employees as es
where dm.dept_no = ds.dept_no
and dm.emp_no = es.emp_no;

-- Question 4
select de.dept_no, em.emp_no, em.last_name, em.first_name, ds.dept_name
from dept_emp as de, employees as em, departments as ds
where de.emp_no = em.emp_no 
and de.dept_no = ds.dept_no;

-- Question 5
select first_name, last_name, sex
from employees 
where first_name = 'Hercules'
and last_name like 'B%';

-- Question 6
select e.emp_no, e.last_name, e.first_name
from employees as e, departments as ds, dept_emp as de
where e.emp_no = de.emp_no 
and ds.dept_no = de.dept_no 
and ds.dept_name = 'Sales';

-- Question 7
select e.emp_no, e.last_name, e.first_name
from employees as e, departments as ds, dept_emp as de
where e.emp_no = de.emp_no 
and ds.dept_no = de.dept_no 
and (ds.dept_name = 'Sales' or ds.dept_name='Development');

-- Question 8
select last_name, count(first_name)
from employees
group by last_name
order by count(first_name) desc;
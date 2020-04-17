--1
select locations.location_id, street_address, city, locations.state_province, country_name from locations
natural join countries;

--2
select last_name, department_id, department_name from employees
join departments using(department_id);

--3
select last_name, job_id, d.department_id, department_name from employees e
join departments d on e.department_id = d.department_id
join locations l on l.location_id = d.location_id
where l.city='Toronto';

--4
select e1.last_name "Employee", e1.manager_id "EMP#", e2.last_name "Manager", e2.employee_id "Mgr#" from employees e1
join employees e2 on e1.manager_id=e2.employee_id;

--5
select e1.last_name "Employee", e1.manager_id "EMP#", e2.last_name "Manager", e2.employee_id "Mgr#" from employees e1
left join employees e2 on e1.manager_id=e2.employee_id
order by e1.employee_id;

--6
select e1.department_id, e1.last_name, e2.last_name from employees e1
cross join employees e2;
--笛卡尔积

--7
desc job_grades;

select e.last_name, e.job_id, department_name, salary, grade_level from employees e
join departments using(department_id)
join job_grades on salary between job_grades.lowest_sal and job_grades.highest_sal;
--通过别的表打等级,join中使用条件

--8
select last_name, hire_date from employees
where hire_date<(select hire_date from employees where last_name='Davies');

--9
select e1.last_name, e1.hire_date, e2.last_name, e2.hire_date from employees e1
join employees e2 on e1.manager_id=e2.employee_id
where e1.hire_date<e2.hire_date;













--1
select last_name, department_id from employees
where department_id = (select department_id from employees where last_name='&&Enter_name')
and last_name <> '&Enter_name';

--2
select employee_id, last_name, salary from employees
where salary>(select avg(salary) from employees)
order by 3;

--3
select employee_id, last_name from employees
where department_id in (select department_id from employees where lower(last_name) like '%u%');

--4
select last_name, department_id, job_id from employees
join departments d using (department_id)
where d.location_id = 1700;

select last_name, department_id, job_id from employees
join departments d using (department_id)
where d.location_id = '&location_id';

--5
select last_name, salary from employees
where manager_id in (select employee_id from employees where lower(last_name)='king');

--6
select department_id, last_name, job_id from employees
join departments using(department_id)
where lower(department_name) like '%overment%';

--7
select employee_id, last_name, department_id from employees
where salary>(select min(salary) from employees where department_id = 60 )
and department_id <> 60;

--8
select employee_id, last_name, salary from employees
where salary>(select avg(salary) from employees)
and department_id in (select department_id from employees where lower(last_name) like '%u%');











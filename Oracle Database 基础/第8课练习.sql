--1
select department_id from employees
minus
select department_id from employees
where job_id = 'ST_CLERK';

--2
select d.department_id, l.location_id, c.country_id, c.country_name from countries c
left join locations l on c.country_id = l.country_id
left join departments d on l.location_id = d.location_id
where d.department_id is null;

select country_id, country_name from countries
minus
select c.country_id, c.country_name from countries c
left join locations l on c.country_id = l.country_id
left join departments d on l.location_id = d.location_id
where d.department_id is not null;

--3
select job_id, department_id from employees where department_id = '10'
union
select job_id, department_id from employees where department_id = '50'
union
select job_id, department_id from employees where department_id = '20';

--4  入职时与现在工作相同
select employee_id, job_id from employees
intersect
select employee_id, job_id from job_history;

--5  匹配select
select last_name, department_id, to_char(null) from employees
union
select to_char(null), department_id, department_name from departments;


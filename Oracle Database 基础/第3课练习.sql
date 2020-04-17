--1
select sysdate "Date" from dual;

--2--3
select employee_id, last_name, salary, round(salary*1.155,0) "New Salary" from employees;

--4
select employee_id, last_name, salary, round(salary*1.155,0) "New Salary", round(salary*1.155,0)-salary "Increase" from employees;

--5
select initcap(last_name), length(last_name) "Len" from employees
where lower(substr(last_name, 1, 1)) in ('j', 'a', 'm');

select initcap(last_name), length(last_name) "Len" from employees
where lower(substr(last_name, 1, 1)) in lower('&Start_LETTER');

--6
select last_name, trunc(months_between(sysdate,hire_date),0) "Months worked" from employees;

--7
select last_name, lpad(salary, 15, '$') "Salary" from employees;

--8
select rpad(last_name,8)||'  '||rpad(' ',salary/1000+1,'*') as employees_and_their_salaries from employees
order by salary;

--9
select last_name, trunc((sysdate-hire_date)/7,0) "TENURE" from employees
where department_id=90
order by 2 desc;
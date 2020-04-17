--4
select max(salary) "Maximum", min(salary) "minimum", sum(salary) "SUM", round(avg(salary)) "Average" from employees; 

--5
select job_id, max(salary) "Maximum", min(salary) "minimum", sum(salary) "SUM", round(avg(salary)) "Average" from employees
group by job_id;

--6
select job_id, count(job_id) from employees
group by job_id;

select &job_id, count(*) from employees
group by 1;

--7
select count(distinct(manager_id)) "Number of managers" from employees;

--8
select max(salary)-min(salary) "DIFFERENCE" from employees;

--9
select manager_id, min(salary) from employees
group by manager_id, employee_id
having min(salary)>6000
order by 2 desc;

--10
select count(employee_id) "Total", 
  sum(case to_char(hire_date, 'YYYY') when '1995' then 1 else 0 end) "1995",
  sum(case to_char(hire_date, 'YYYY') when '1996' then 1 else 0 end) "1996",
  sum(case to_char(hire_date, 'YYYY') when '1997' then 1 else 0 end) "1997",
  sum(case to_char(hire_date, 'YYYY') when '1998' then 1 else 0 end) "1998"
from employees;

--11
select job_id "Job",
  sum(case department_id when 20 then salary end) "Dept 20",
  sum(case department_id when 50 then salary end) "Dept 50",
  sum(case department_id when 80 then salary end) "Dept 80",
  sum(case department_id when 90 then salary end) "Dept 90",
  sum(salary) "Total"
from employees
group by job_id;

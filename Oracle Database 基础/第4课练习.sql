--1
select last_name||' ears '||to_char(salary, '$999,999.99')
      ||' monthly but wants'||to_char(salary*3, '$999,999.99')||'.' "Dream Salaries" from employees; 

--2
select last_name, hire_date, to_char(add_months(hire_date, 6), 'Day", the" fmddspth "of" Month", "YYYY') from employees;  
--fm去除前面的空 sp显示为完整的英文 th加上后缀

--3
select last_name, hire_date, to_char(hire_date, 'Day') "Day" from employees
order by 3;

--4
select last_name, NVL(to_char(commission_pct), 'No commission') "COMM" from employees;
--NVL参数格式相同

--5
select job_id, decode(job_id,'AD_PRES','A',
                             'ST_MAN','B',
                             'IT_PROG','C',
                             'SA_REP','D',
                             'ST_CLERK','E',
                             0) Grade
from employees;

--6
select job_id, case job_id when 'AD_PRES' then 'A'
                           when 'ST_MAN' then 'B'
                           when 'IT_PROG' then 'C'
                           when 'SA_REP' then 'D'
                           when 'ST_CLERK' then 'E'
                           else '0' end Grade
from employees;

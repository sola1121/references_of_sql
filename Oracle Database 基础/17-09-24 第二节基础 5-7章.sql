select hire_date from employees;

--转换函数to_char 字符串格式放在单引号中, to_number
--日期间的表达    fm 去掉前面的站位字符
select last_name, to_char(hire_date, 'fmDD-MM -YYYY') as hire_date from employees;

select to_char(salary, 'L99,9999.000') from employees;    --L本地货币符号

--national language system NLS

--NVL  NVL2  NULLIF   coalesce
select last_name, salary, NVL2(commission_pct, 'SAL+COMM', 'SAL') income from employees
where department_id in (80, 90);

--条件表达式 case表达式(标准SQL)  decode函数
select last_name, job_id, salary "Original Salary", --根据职位涨工资
  case job_id
    when 'IT_PROG' then salary*1.1
    when 'ST_CLER' then salary*1.15
    when 'SA_REP' then salary*1.2
    else salary end "Revised Salary"  --要有end结束
from employees;

select last_name, job_id, salary "Original Salary",  --根据职位涨工资
  decode(job_id,
    'IT_PROG', salary*1.1,
    'ST_CLER', salary*1.15,
    'SA_REP', salary*1.2,
    salary
  ) "Revised Salary"
from employees;

--组函数
select max(salary), min(salary), round(avg(salary),2) from employees
where job_id like '%REP%';

--分组 group by   单独出现的列必须出现在group by中, group by 出现的列可以不用在select里面
select job_id, last_name, manager_id from employees
group by job_id, last_name, manager_id
order by 1;

select department_id, avg(salary) from employees
group by department_id;

--where限制单独的行, having限制组
select e.department_id, d.department_name, max(salary) from employees e
join departments d on e.department_id=d.department_id
group by e.department_id, d.department_name
having max(salary)>10000;

select min(avg(salary)), max(avg(salary)) from employees
group by department_id;   --select中不能出现列名, 这样会造成分组的混乱



select last_name, avg(nvl2(commission_pct, salary + (salary * commission_pct), salary)) from employees
group by last_name;





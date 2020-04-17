select hire_date from employees;

--ת������to_char �ַ�����ʽ���ڵ�������, to_number
--���ڼ�ı��    fm ȥ��ǰ���վλ�ַ�
select last_name, to_char(hire_date, 'fmDD-MM -YYYY') as hire_date from employees;

select to_char(salary, 'L99,9999.000') from employees;    --L���ػ��ҷ���

--national language system NLS

--NVL  NVL2  NULLIF   coalesce
select last_name, salary, NVL2(commission_pct, 'SAL+COMM', 'SAL') income from employees
where department_id in (80, 90);

--�������ʽ case���ʽ(��׼SQL)  decode����
select last_name, job_id, salary "Original Salary", --����ְλ�ǹ���
  case job_id
    when 'IT_PROG' then salary*1.1
    when 'ST_CLER' then salary*1.15
    when 'SA_REP' then salary*1.2
    else salary end "Revised Salary"  --Ҫ��end����
from employees;

select last_name, job_id, salary "Original Salary",  --����ְλ�ǹ���
  decode(job_id,
    'IT_PROG', salary*1.1,
    'ST_CLER', salary*1.15,
    'SA_REP', salary*1.2,
    salary
  ) "Revised Salary"
from employees;

--�麯��
select max(salary), min(salary), round(avg(salary),2) from employees
where job_id like '%REP%';

--���� group by   �������ֵ��б��������group by��, group by ���ֵ��п��Բ�����select����
select job_id, last_name, manager_id from employees
group by job_id, last_name, manager_id
order by 1;

select department_id, avg(salary) from employees
group by department_id;

--where���Ƶ�������, having������
select e.department_id, d.department_name, max(salary) from employees e
join departments d on e.department_id=d.department_id
group by e.department_id, d.department_name
having max(salary)>10000;

select min(avg(salary)), max(avg(salary)) from employees
group by department_id;   --select�в��ܳ�������, ��������ɷ���Ļ���



select last_name, avg(nvl2(commission_pct, salary + (salary * commission_pct), salary)) from employees
group by last_name;





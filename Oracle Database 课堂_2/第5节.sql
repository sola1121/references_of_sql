/*�麯��,  ���ԶԶ��ͬ�������ݽ��д���*/
--max min avg count sum stddev variance
select max(salary) from employees;

select round(avg(salary),2), sum(salary), min(salary), max(salary) from employees
  where job_id like '%REP%';
  
--����,�ַ�ʹ��min��max
select min(hire_date), max(hire_date) from employees;

select min(last_name), max(last_name) from employees;

--count ������������������
select count(employee_id) from employees;
select count(employee_id) from employees where department_id = 100;
select count(commission_pct) from employees;   --null ������, �ҷǿ��м���
select count(*) from employees where commission_pct is not null;
--ȥ�ظ�����
select count(distinct last_name) from employees;
select count(distinct first_name) from employees;
select distinct department_id from employees;
select count(distinct department_id) from employees;

--�麯�����������еĿ�ֵ
select avg(commission_pct) from employees;
select avg(nvl(commission_pct,0)) from employees;

--group by , having  
/*ʹ�� GROUP BY �Ӿ�ʱ��Ӧȷ���� SELECT �б���δ�������麯���е������ж������� GROUP BY �Ӿ���*/
select department_id, round(avg(salary)) from employees
  group by department_id    --����
  order by department_id;   --����
  
select department_id, manager_id, round(avg(salary)) from employees
  group by department_id, manager_id   --�����ϸ
  order by department_id;
--group by ���в�һ��Ҫ������select�����
select round(avg(salary),0) from employees
  group by department_id;   --��Ϊselect��ֻ��һ���麯�����ʽ

select department_id, job_id, round(sum(salary),0) from employees
  group by department_id, job_id;   --select����������͵�д����

select department_id, round(sum(salary),0) from employees
  where department_id>80
  group by department_id;    --������where�����ݽ���ɸѡ, ��������where���޶���
  
select department_id, round(avg(salary),0) from employees
  group by department_id
  having avg(salary)>8000   --�麯����having�����޶���ɸѡ
  order by department_id;   --ƽ�����ʴ���8000�Ĳ���id, ʹ��having�������ɸѡ

select job_id, sum(salary) Payroll from employees
  where job_id not like '%REP%'
  group by job_id
  having sum(salary)>20000;
--�麯��Ƕ�� 
select max(avg(salary)) from employees
  group by department_id;  --avg�����Ķ�ֵ, ��max����Ϊһ��ֵ



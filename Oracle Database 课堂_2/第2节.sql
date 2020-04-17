select first_name from employees where first_name like 'M%';
select first_name||'_'||last_name, department_id from employees where department_id=90;
select first_name||'_'||last_name "Name",salary  from employees where salary<5000;
select * from employees where last_name='Whalen';
select hire_date from employees;
select first_name||'_'||last_name "Name" from employees where hire_date='17-6�� -03';  --Ĭ�����ڸ�ʽ DD-MM-YY

--Between and
select last_name, salary from employees where salary between 2500 and 3500;   --between ... and ...
select last_name, salary from employees where salary>=2500 and salary<=3500;

--and or 
select last_name from employees where last_name between 'David' and 'George';   --����ASCII���ַ�˳���ѯ
select employee_id, last_name, salary, manager_id from employees where manager_id in (100, 101, 201);
--����ָ��ֵ���е�ֵ��ʹ�� IN �����. ��ʾ��manager_idΪ100��101��201��Ͻ�µ�Ա��
select employee_id, last_name, salary, manager_id from employees 
  where manager_id=100 or manager_id=101 or manager_id=201;
  
--like
select last_name from employees where last_name like '_o%';   -- _ ��ʾһ���ַ�, % ��ʾ��������ַ�
select first_name from employees where first_name like 'S%';
select first_name, hire_date from employees where hire_date like '%-% -05';   --�鿴05�걻��Ӷ�Ĺ�Ա

select substr(job_id,1,2) ǰ�ν�ȡ, job_id, last_name from employees;
select job_id, last_name from employees where job_id like 'ST\_%' escape '\';
--�������� SA_ ���ַ���,escape���Զ���ת���ַ�,������escape����\Ϊת��, \����ת��Ϊ����

select last_name, manager_id from employees where manager_id is null;   --is
select last_name, manager_id from employees where manager_id is not null;   --is not
select employee_id, last_name, job_id, salary from employees where salary >= 10000 and job_id like '%MAN%';
select last_name, job_id from employees where job_id not in('IT_PROG', 'ST_CLERK', 'SA_ERP');
SELECT last_name, job_id, salary FROM employees 
  WHERE job_id = 'SA_REP' OR job_id = 'AD_PRES' AND salary > 15000;
--���ĳ��Ա��AD_ ��salary���� $15,000�����߸ù�Ա��SA_ ����ѡ����Ӧ���С�
SELECT last_name, job_id, salary FROM employees 
  WHERE (job_id = 'SA_REP' OR job_id = 'AD_PRES') AND salary > 15000;
--Ԥ��˳��ı�, ѡ��job_id ΪSA_ �� AD_ salary ���� 15000

--order by
select last_name, job_id, department_id, hire_date from employees order by hire_date;   --Ĭ������Ϊ����
select last_name, job_id, department_id, hire_date as "Enter_date" from employees order by "Enter_date";
select last_name, job_id, department_id, hire_date from employees order by 4;   --��������ĵڼ�������
select last_name, job_id, department_id, hire_date from employees order by 1,4;   --��������ĵ�1�е�4������

--& �����
select last_name, salary, department_id, manager_id from employees order by 4 desc nulls first;   --������null������ʾ
SELECT employee_id, last_name, salary, department_id FROM employees WHERE employee_id = &employee_num;
-- & �������ֵ, �䶨��ı����ǿ������, ������ֵ��
select last_name, employee_id, salary from employees where last_name = '&Last_Name';  --���ִ�Сд,���ַ�ʹ�õ�����
SELECT &�����1, last_name, salary, department_id FROM employees WHERE &�������2;   --ֱ�ӵ����
select last_name, &&�ظ��滻ֵ1, salary from employees order by &�ظ��滻ֵ;   --һ������������ͬ���滻ֵ

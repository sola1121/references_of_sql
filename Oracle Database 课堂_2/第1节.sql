select count(Department_id) from departments;
select first_name, last_name from employees;
select last_name, salary, salary+3 from employees;
select last_name, salary ÿ��, (salary+100)*12 from employees;  --��н��100
select last_name, salary ÿ��, salary*12+100 from employees;  --��н��100
SELECT last_name, job_id, salary, commission_pct commission_pct������ֵ FROM employees;
select last_name, commission_pct as "����" from employees;  --˫�����Ǳ�֤��ʾΪ����ı�������仯
SELECT last_name AS name, commission_pct comm FROM employees;
SELECT last_name "Name" , salary*12 "Annual Salary" FROM employees;

--||
select last_name || job_id "Employees" from employees;  --��������� ||
select first_name ||'_'|| last_name || '''' || 's job is ' || job_id as "Employees" from employees;  -- ' ��ת���ַ�
select department_name || q'( department manager id: )' || manager_id as "Department and Manager" from departments;
--�������� q �����, ����ԭ�ⲻ����������������е��ַ�
select distinct department_id from employees order by department_id;  --ditinct�����ظ�
desc employees;  --��ṹ��ѯ
select first_name ||'_'|| last_name as name, job_id, salary*12 yearly_sal from employees;

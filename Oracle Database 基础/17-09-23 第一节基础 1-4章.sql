select * from departments;

select last_name, salary from employees;

select last_name||job_id as name&job from employees;

select sysdate from dual;

select last_name, hire_date from employees 
where hire_date between '1-1�� -00' and '12-12�� -05';

select manager_id from employees
where manager_id in(100, 101, 201);

-- ' ת��  q'  ֻ�����ڵ�����
select last_name || q'[ departments' manager ]'  ||job_id  from employees;

-- escape ˵��ʲô��ת��� ֻ������ͨ�����
select last_name from employees where last_name like '%\_%' escape '\'; 


select last_name from employees where last_name like '_o%';

select last_name, job_id, salary from employees
where salary>=6000 and job_id like '%MAN%';


--���� ASC, ����desc,  order by�����ñ���Ҳ������λ��˳������
select last_name, job_id, hire_date from employees
order by hire_date;
select last_name, job_id, hire_date from employees
order by 3 desc;

--&  ���ֵ, �ӵ����ź�����������Ϊһ���ַ��������Ǵ�������ֵ
print a=&f;

select &a from employees;

--&& ��ͬ��������ֵֻ��Ҫ����һ�α�ȷ����

select last_name, &&hire from employees
order by &hire;

--define ����һ������
define ename='Whalen';
select last_name, job_id from employees
where last_name='&ename';

--ʹ��verify���滻��ʾ
set verify on;

select last_name, job_id from employees where last_name=&n;

--SQL����
select lower('Hello'), upper('world'), initcap('hello, wold.') from dual;

select employee_id, concat(last_name, first_name), job_id, length(last_name)instr(last_name, 'a') from employees
where substr(job_id, 4)='ERP';

select round(45.963, 2), round(45.923, -1), trunc(49.265, 1) from dual;

--���ں���   Ĭ��:DD-MON-RR
select last_name, (sysdate-hire_date)/7 as "Worked Weeks" from employees;

select months_between('01-3�� -17', '01-6�� -17') from dual;

select add_months('01-3�� -17' , 5) from dual;


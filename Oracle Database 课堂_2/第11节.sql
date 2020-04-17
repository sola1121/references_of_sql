--������ͼ
/*create or replace force view ()
**as subquery
**with check option
*/

create view empvu80
as (select employee_id, last_name, first_name, salary from employees
    where employee_id = 80);
    
desc empvu80;

create view fiscalyearsalary
as (select employee_id, last_name "��", first_name "��", salary * 12 "Annual Salary" from employees
    where department_id = 50);
    
desc fiscalyearsalary;

select "Annual Salary" from fiscalyearsalary where ��='Bull';   --˫���Ŵ���������ֵ�ı���ַ�

--�޸���ͼ
create or replace view empvu80
as (select employee_id, first_name || ' ' ||last_name "Name", 
    salary * 12 "Annual_Salary", department_id from employees
    where department_id=80);
    
desc empvu80;


create or replace view sa
as (select department_id, max(salary) "MaxSalary", min(salary) "MinSalary", 
    round(avg(salary),2) "Average" from employees 
    group by department_id);

drop view sa;

CREATE OR REPLACE VIEW dept_sum_vu (name, minsal, maxsal, avgsal)
as select  d.department_name, MIN(e.salary), MAX(e.salary),AVG(e.salary) from employees e 
   join departments d on (e.department_id = d.department_id)
   group by d.department_name;

create or replace view dept_sum_vu (name, minsal, maxsal, avgsal)
as select nvl(d.department_name, 'Others') "Department_name",    --nvl(ifnull, '')  �滻null
   MIN(e.salary), MAX(e.salary),round(AVG(e.salary),2) from employees e 
   left outer join departments d on (e.department_id = d.department_id)
   group by department_name;
   
desc dept_sum_vu;
/*
insert into dept_sum_vu
  values('TestTTT', 10000, 5000, 4500);  --�ᱨ��, �����������ͼ���޸�, ��Ϊ��ͼ�Ǳ�ı����ɵ�,�л�����
*/

create or replace view dept80
as select department_id, department_name from departments;

insert into dept80 values (330, 'TestTTT 2');   --�򵥵���ͼ���Բ���, ��ͬʱҲ��Ӱ�쵽���Ļ��������
rollback;

rename dept80 to deptIDName;

select * from departments where department_id =330;

create or replace view empvu20
  as (select * from employees where department_id = 20)
  with check option constraint empuv20_constraint;    
  --with check option ǿ����ͼ��ִ�е����������޸���䶼��������� select_statement ���õ�׼��
  
create or replace view empvu20
  as (select * from employees where department_id = 20)
  with read only;   --ֻ��
  
--���к�  sequence
create sequence dept_seq1
  start with 500    --��ʼ��
  increment by 10   --����
  maxvalue 2000;   --���ֵ

desc departmentsxx;

insert into departmentsxx (department_id, department_name, location_id)
values (dept_seq1.nextval, 'test squence', 1000);     --ʹ������, �Զ�λid��������˳������������

select dept_seq1.currval from dual;  --���ص�ǰ������ֵ

--����   index   �������ǵĲ�ѯ
create index emp_last_name_index
on employees(last_name);


--ͬ���    synonym  ���Ǳ���
/*
**CREATE [PUBLIC] SYNONYM synonym
**FOR    object;
*/

create  synonym  elni
for emp_last_name_index;
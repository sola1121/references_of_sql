
--�������㶼�����������㼯����ͬ(������,����)
select employee_id, job_id from employees
union     --��������ȡ��,ȥ����ͬ������,ȡ�����ϵ���������ͬ
select employee_id, job_id from job_history;

select employee_id, job_id, department_id from employees
union all    --����������һ��,����һ��,�����������.
select employee_id, job_id, department_id from job_history;

select employee_id, job_id from employees
intersect  --��
select employee_id, job_id from job_history;

select employee_id, job_id from employees
minus  --��
select employee_id, job_id from job_history;

--���һ�����ϲ���������ͬ, ʹ��to_char�κ�����ת���������в���
select location_id, department_name, to_char(null) "state_province" from departments   --ʹ�õ�һ����ѯ����Ҫ����
union
select location_id, to_char(null), state_province from locations;

--DML ���ݲ������� ��ɾ��
--insert һ�в���
insert into departmentsxx(department_id, department_name, manager_id, location_id)
values (310 , 'Public Relations', 100, 1700);

insert into departmentsxx(department_id, department_name, manager_id, location_id)
values (&d_id, '&name', NULL, &l_id);  --ʹ��ռλ��&

desc departmentsxx;

--insert ʹ�ø��ϲ�ѯ�Ĳ������,select������������һ��,����һ��
insert into sal_rep
select employee_id, last_name, salary, commision_pct from employees
where job_id like '%REP%';

--update �޸ı��е�����ֵ where
update employeesss
set employee_id = 120
where employee_id = 113;

update employeesss
set job_id = (select job_id from employees where emplyee_id=205),
    salary = (select salary from employees where employee_id=205),
where employee_id = 113;

--delete �ӱ���ɾ��������, where
delete employeesss where employee_id = 101;

delete departmentsxx 
where department_id in (select department_id from departmentsxx where department_name like '%Public%');

/*
  DDL ���ݶ�������,��ֱ���ύ, ����һ���Ǹ�һ�����ݿ�������� ��:create table ����table����(����,����,������);
  ��DML���ݲ������Բ���(����,������). ���ݿ����һ��Ҫʹ��DDL�����б༭
  */
--truncate �ӱ���ɾ��������, ʹ��Ϊ�ղ�������ṹ, ���������κβ���

--DCL���ݿ������� ��Ҫ����Ȩ
-- commit,  rollback,  savepoint

--select �е� for update
--�Ὣ����ȡ�����ݼ������������˸���,ֱ����Ϊ����,���Լ�Ҳֻ������Щ������

--create table 
create table hr.TheTestForCreateTable(
  deptno number(2),
  dname varchar2(50),
  time_ date default sysdate
);

drop table hr.TheTestForCreateTable;

create table hr.TheTestForCreateTable(
  student_id number(6) constraint student_pk primary key,
  name varchar2(16) constraint name_not_null not null,
  register_date date default sysdate,
  grade number constraint ch_grade_min check (grade>0)
);

--ʹ���Ӳ�ѯ������ʱ�������
create table hr.TheTestForCreateTable
as (select * from departments);

--alter table �������,�޸������ж���,�������е�Ĭ��ֵ,ɾ����,��������,�����״̬��Ϊֻ��read only �� read write

--drop table ɾ����������վ(����Ա��ֱ��ɾ��), purge����ֱ��ɾ��

--��ͼ  ���Կ���һ����ѯ�Ľ��,��select���洢�����ݿ��ֵ���
--create view
--�������޸���ͼ
create or replace view empv80
as 
select employee_id, last_name, salary from employees
where department_id=80;

desc empv80;

create or replace view salv50(id, name, sal)  --��������
as 
select employee_id, last_name, salary from employees
where department_id=50;

desc salv50;
select * from salv50;

drop view empv80;
drop view salv50;

create or replace view report_vu
as
select e.department_name, min(salary), max(salary), avg(salary) from employees e
join departments d using(department_id)
group by 1;

--with check option ...
--with read only �ܾ�DML����,����ڸ�����ͼ������

--����   sequence �Զ����ɱ��
--nextval  currval α��, currvalֻ�е��ù�һ��nextval crrval�Ż���ֵ
create sequence seq_class
  start with 10   --��ʼֵ
  increment by 10   --����
  maxvalue 120  --���ֵ
  cycle   --ѭ��ʹ��
  nocache;   --��Ԥ������
drop sequence seq_class;
select seq_class.nextval from dual; --ѭ�����1��ʼ
select seq_class.currval from dual;

--���� index һ����������,��ͬһ��ָ��,��ߴ����ٶ�
--�����ڴ��ͱ�,�����ݽ���2%-4%ռ��ѯ���ݱ�ı���,����������where����
create index index_emp_lname
on employees(last_name);

--ͬ��� synonym,  create pubilc synonym...�������е�
create synonym emp for employees;  --����emp����employees
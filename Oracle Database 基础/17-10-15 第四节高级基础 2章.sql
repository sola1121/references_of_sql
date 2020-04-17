--alter table ����޸�ɾ����
/*
alter table ... add ();
alter table ... modify ();
alter table ... drop ();
*/
create table deptv80
as select employee_id, last_name, salary from emloyees where department_id = 80;

alter table deptv80
add (job_id varchar2(19));   --�����

alter table deptv80
modify (last_name varchar2(40));   --�޸���

alter table deptv80
drop (salary);   --ɾ����

--set unused ���δʹ����
alter table deptv80
set unused (salary);   --����salary��Ϊunused

alter table deptv80
drop unused column;   --ɾ������Ϊunused����

--���Լ���������﷨
alter table emp2
add constraint emp_fk_dept foreign key(manager_id) references departments(manager_id) on delete cascade;   --��Ӽ��� on delete set null

create table emp2
as select * from employees
where 1=2;   --����ṹ�Ĵ���

alter table emp2
add constraint the_test_emp2_dept_fk foreign key(department_id) references departments(department_id)
deferrable initially deferred;  --�ӳ�Լ������ ���� deferrable initially immediately(Ĭ��)

drop table emp2;

--ɾ��Լ������
alter table emp2
drop constraint the_test_emp2_dept_fk;

alter table emp2
drop constraint primary key cascade;  --���������Ϊ��������, ʹ�ü���cascade

--����Լ������
alter table emp2
disable constraint the_test_emp2_dept_fk;

--����Լ������
alter table emp2
enable constraint the_test_emp2_dept_fk;

--����Լ������ cascade constraint 

--���������к�Լ������
alter table emp2 rename column emp_id to id;
alter table emp2 rename constraint the_test_emp2_dept_fk to fk;

--��������
/*
�Զ�����
�ֶ�����
*/
create table new_emp(
  id number(7) primary key using index(create index ne_id_index on new_emp(id))
);

--flashback ����, ��DDLҲ��
desc recyclebin;   --����վ
select object_name, original_name, operation, type from recyclebin;
flashback table emp2 to before drop;

--������ʱ��

--�����ⲿ��
create or replace directory emp_data --������Ŀ¼
as '/home/oracle/emp';
grant read, write,  on emp_data to hr;   --DBA����Ȩ��
create table emp_txt(fname char(25), lname char(25)) --�������ӱ�
organization external
(type oracle_datapump
  default














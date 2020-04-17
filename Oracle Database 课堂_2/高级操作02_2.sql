/*deferrable �ӳ�����,  INITIALLY DEFERRED �д��󲻻ᱨ, ���ύʱ�ᱨ�� �� INITIALLY IMMEDIATE */


desc dept;

alter  table dept
add constraint cons_dept_pk
primary key (id)
deferrable initial deferred;

insert into dept
values(10, 'Department_One');

insert into dept (name)
values ('Department_Two');

--
create table emp_new_sal (   --���������checkԼ�� �� ���ӳ���
  salary number(5) constraint con_sal_check check (salary>100) deferrable initially immediate,
  bounds number(30) constraint con_bounus_check check (bounds>0) deferrable initially deferred
);

insert into emp_new_sal
  values(101, -1);
rollback;

alter table emp_new_sal rename column salary to sal;   --��������


alter table emp_new_sal 
  drop primary key cascade;   --����ʽɾ�����Լ������
  
--ͣ��Լ��, ����Լ��
alter table dept
  add constraint dept_id_check check (id>0);

insert into dept 
  values (-8, 'TTTTT');
rollback;
--�� ALTER TABLE �����ʹ�� DISABLE �Ӿ��ͣ��������Լ������
alter table dept
  disable constraint dept_id_check;

--ʹ�� ENABLE �Ӿ�ɼ�������е�ǰ���õ�������Լ������
alter table dept
enable constraint dept_id_check;

/*
CASCADE CONSTRAINTS �Ӿ�Ӧ�� DROP COLUMN�Ӿ�һ��ʹ�á�
CASCADE CONSTRAINTS �Ӿ��ɾ���������ڱ�ɾ�����϶����������Ψһ�ؼ��ֵ���������������Լ��������
CASCADE CONSTRAINTS �Ӿ仹��ɾ���ڱ�ɾ�����϶�������ж���Լ��������

ALTER TABLE emp2
DROP COLUMN employee_id CASCADE CONSTRAINTS;

ALTER TABLE test1
DROP (col1_pk, col2_fk, col1) CASCADE CONSTRAINTS;
*/


--�������ʱ�򴴽�����
create table new_emp (
  employee_id number(6) primary key 
  using index ( create index new_emp_index on new_emp(employee_id) ),
  last_name varchar2(20),
  first_name varchar2(20)
);

SELECT INDEX_NAME, TABLE_NAME
  FROM USER_INDEXES
  WHERE TABLE_NAME = 'new_emp';

--���ں���������
create index upper_last_name_newemp
  on new_emp(upper(last_name));    --�ڲ�ȷ������Ѱ�����Ƿ�Ϊ��д,Ϊ�����������Ч��, ����һ����д��index
  
--drop  index  ������;

--ɾ����
drop table new_emp;
drop table new_emp purge;   --����ɾ��

flashback table �ڻ���վ�еı� to before drop;    --����ɾ��ǰ

desc recyclebin;   --���Ǽ�¼ϵͳ�����ı�

select * from recyclebin;

--������ʱ��
create global temporary table cart on commit delete rows;

create global temporary table today_salary on commit delete rows
  as select *��from orders where order_date=sysdate;
  
--�ⲿ��
CREATE TABLE oldemp (
fname char(25), lname CHAR(25))
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY emp_dir
ACCESS PARAMETERS
(RECORDS DELIMITED BY NEWLINE
NOBADFILE
NOLOGFILE
FIELDS TERMINATED BY ','
(fname POSITION ( 1:20) CHAR,
lname POSITION (22:41) CHAR))
LOCATION ('emp.dat'))
PARALLEL 5
REJECT LIMIT 200;

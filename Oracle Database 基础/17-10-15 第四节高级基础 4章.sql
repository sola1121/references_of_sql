--DML
--ʹ���Ӳ�ѯ��������
--�Ӳ�ѯ�൱����ͼ
desc regions;
desc locations;

select department_name, city from departments
natural join (select l.location_id, l.city, l.country_id from locations l
                join countries c on l.country_id = c.country_id
                join regions r on c.region_id = r.region_id
                where region_name = 'Europe');
                
--DML�����ʹ�� with check option ��ֹ�Բ����Ӳ�ѯ�е��н��и���

--defaultʹ��ȱʡֵ

--���������и�����
create table sals_reps(id, last_name, sal)
  select employee_id, last_name, salary from employees where 1=2;   --���Ʊ��нṹ

insert into sals_reps
  select employee_id, last_name, salary from employees;    --��������
  
--����insert
create table sal_his(id, name, sal)
as select employee_id, last_name, salary from employees where 1=2;

create table mgr_his(id, mgr, sal)
as select manager_id, last_name, salary from employees where 1=2;
--������������ű�
insert all
into sal_his values(employee_id, last_name, salary)
into mgr_his values(manager_id, last_name, salary)
select employee_id, last_name, manager_id, salary from employees   --�ṩԴ��������Դ
where employee_id>= 200;

select * from mgr_his;
select * from sal_his;
--������������ű�, ����������ִ�в������, ƥ����������, �൱�ڶ��if��䲢��
insert all 
when hiredate < 

--����������, ѡ��һ�����������Ĳ���, �൱�ڶ�� if... else if...����
insert first
when salary < 500 then 
  into sal_low values (employee_id, last_name, salary)
when salary <10000 then
  into sal_mid values (employee_id, last_name, salary)
else 
  into sal_high values (empolyee_id, last_name, salary)
select empolyee_id, last_name, salary from employees;

--ת��insert����   Pivoting insert

--�ϲ������ merge
create table stu(
  id number(4),
  name varchar2(16),
  score number(5)
);

insert into stu values(4,'D',104);

create table stu_cp
as select * from stu where 1=2;

insert into stu_cp values(5,'E',105);

merge into stu_cp sc
using (select * from stu) s on (sc.id=s.id)
when matched then
  update set sc.name = s.name, sc.score = s.score
when not matched then
  insert (id, name, score) values(s.id, s.name, s.score);     
                
--���ذ汾��ѯ
select versions_starttime, versions_endtime, score 
from stu versions between SCN minvalue and maxvalue where id = 4;












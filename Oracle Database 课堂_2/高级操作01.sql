

/* �����û����� */

/*
���ݿⰲȫ��
  ϵͳ��ȫ��
  ���ݰ�ȫ��
ϵͳȨ��: �����ݿ���ִ���ض��Ĳ���
����Ȩ��: �������ݿ���������
����: �����, ��ͼ�����еȶ���ļ���

ϵͳȨ��
���õ�ϵͳȨ�޳�����
���ݿ����Ա: �����û�, ɾ���û�, ɾ�������, ...

--�������޸��û�
create user �û��� identified by ����;

alter user �û��� identified by ������;

conn �û���;    ���Ӹ�����½�û�

show user;   ��ʾ��ǰ�û�

*/

/* 

�û�ϵͳȨ��

grant privilege [,privilege...] to user [,user | role, PUBLIC];   public��ʾ�����û���Ӵ������Ȩ��

--����Ȩ��
create session   //�������ݿ�Ȩ��
create table
create sequence
create view
create procedure

ϵͳȨ��

*/

/*
������ɫ role
����һ��Ȩ�޼�

--������ɫ
create role manager;   manager�ǽ�ɫ��

grant manager to �û���;   ��manager��ɫ���е�Ȩ�޸����û�

*/


/* ����Ȩ��

������:
alter
delete
index 
insert
references
select
update


--�������Ȩ��
? ����Ȩ���������졣
? ������ӵ�ж����ȫ��Ȩ�ޡ�
? �����߿ɽ��Լ�������ض�Ȩ�����������û���

grant select on hr.employees to �û���;    ��ʹ��select����hr.employees���Ȩ�޸��û���

grant update(department_name, location_id)
on hr.departments
to �û���, manager;      --������hr.departments�����е�Ȩ�޸����û��� �� role(��ɫ)

--����Ȩ��
grant select, insert
on hr.departments
to �û���
with grant option;



*/
create user demo identified by demo;

grant create session , create table to demo;

grant select 
on HR.departments
to demo
with grant option;

create user alice identeified by alice;
grant create session to alice;

conn demo/demo;   --�����û�, �û���/����

grant select 
on hr.departments
to alice;

conn alice/alice;

select * from hr.departments;


/* ��������Ȩ�� 

--Revoke

revoke all 
on departments 
from �û���;    --�ջ��û����� departments�ϵ�����Ȩ��

revoke all 
on departments 
from �û���
cascade constraints;   --����, ͨ���û������������department�ϵ�Ȩ��ȫ�ջ�

*/

revoke all 
on hr.departments 
from demo
cascade constraints;

conn Alice/alice;

select * from hr.departments;
--//error : table or view not excited


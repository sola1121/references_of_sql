--alter table 

/*
alter table ���, �������, �޸Ļ�ɾ����

alter table ����
add (�½����� ����, ... );

alter table ����
modify (���� ������, ...);

alter table ����
drop (����, ...);

set unused
ʹ�� SET UNUSED ѡ��ɽ�һ�л���б��Ϊ��δʹ�á���
ʹ�� DROP UNUSED COLUMNS ѡ���ɾ���ѱ��Ϊ��δʹ�á����С�

��ѡ�н��᲻����, Ҳ�᲻�ɼ�

ALTER TABLE <table_name>
SET UNUSED(<column_name> [ , <column_name>] );

ALTER TABLE <table_name>
SET UNUSED COLUMN <column_name> [ , <column_name>] ;

ALTER TABLE <table_name>
DROP UNUSED COLUMNS;

*/

select * from HR.job_grades;

alter table HR.job_grades
set unused (highest_sal);   --��ӱ��ϵ�δʹ�ñ��

alter table HR.job_grades
DROP UNUSED COLUMNS;    --ɾ���������ϵ�δʹ�ñ��

create table departments10
 as(select * from departments);
 
alter table departments10
add ( XXX varchar2(60));

alter table departments10
modify ( XXX varchar2(9));

alter table departments10
drop ( XXX);

/* ����Լ������

���Լ������
alert table 

ALTER TABLE emp2
MODIFY employee_id PRIMARY KEY;   --���ı�����

ALTER TABLE emp2
ADD CONSTRAINT emp_mgr_fk FOREIGN KEY(manager_id) REFERENCES emp2(employee_id);   --��ӱ�Լ��, ���


*/

/*
on delete�Ӿ�

��ɾ�����ؼ��ֺ�ʹ�� ON DELETE CASCADE �Ӿ�ɾ������
ALTER TABLE emp2 
  ADD CONSTRAINT emp_dt_fk FOREIGN KEY (Department_id)
  REFERENCES departments(department_id) ON DELETE CASCADE;   --����

��ɾ�����ؼ��ֺ�ʹ�� ON DELETE SET NULL �Ӿ佫����ֵ����Ϊ��ֵ
ALTER TABLE emp2 
  ADD CONSTRAINT emp_dt_fk FOREIGN KEY (Department_id) 
  REFERENCES departments(department_id) ON DELETE SET NULL;


deferrable �� not deferrable  �ӳ�Լ������
*/









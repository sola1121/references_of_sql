/* �����ֵ� */

--�����ֵ�, ���ݿⱾ��ı�
desc dictionary;

select * from dictionary order by 1;

--���ù���Ա�˻�
select owner from dba_tables where table_name=upper('dictionary');  --��ѯ���������

select *��from dba_tables;

/*
USER_OBJECTS��
? �� USER_OBJECTS �н��в�ѯ�ɲ鿴��ӵ�е����ж���
? ʹ�� USER_OBJECTS���ɻ���������е����ж���
���Ƽ����͵��б��Լ�������Ϣ��
�C ��������
�C �ϴ��޸�����
�C ״̬����Ч����Ч��
ALL_OBJECTS��
? �� ALL_OBJECTS �н��в�ѯ�ɲ鿴��ӵ�з���Ȩ�޵����ж���
*/

select * from  user_objects order by 1;

--�û�����Ϣ
desc user_tables;
select * from user_tables;

--����Ϣ
desc sys.user_tab_columns;

--Լ��������Ϣ
desc user_constraints;

select constraint_name, constraint_type from user_constraints
  where lower(table_name)='employees';
/* 
c check
r reference
u unique
p primary
*/

 --��ͼ��Ϣ
 desc user_views;
 
 select *��from user_views;
 
 SELECT text FROM user_views
WHERE view_name = 'EMP_DETAILS_VIEW';

 --������Ϣ
 desc user_sequences;
 
 select * from user_sequences;
 
 
 
 --������Ϣ
 desc user_indexes;
 
 select * from user_indexes;
 
 SELECT index_name, table_name
FROM user_indexes
WHERE table_name = 'emp_lib';

--ͬ�����Ϣ
DESCRIBE user_synonyms;

select * from user_synonyms;
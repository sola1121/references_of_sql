--���ݿ��ֵ�, ���а�����������ͼ, �����ݿ����е���Ϣ
desc dictionary;
select * from dictionary;   --user�û���, all��չ�û�����ͼ, DBA���ݿ����Ա��ͼ, V$������ز���

desc user_objects;   --��ǰ�˺ŵĶ���

select table_name from user_tables;  --����Ϣ

--Լ��������Ϣ
desc user_constraints;   --Լ����
desc user_cons_columns;   --����Ϣ��

--���ֵ��в�ѯ������Ϣ
--user_views��ͼ, user_sqquences����, user_indexes����, user_Synonymsͬ���

desc user_indexes;
select index_name, index_type, table_name, table_type from user_indexes where table_name = 'EMPLOYEES';
--�鿴employees�������index

--comment �������ע��
comment on table employees
is 'Ա����';

select * from user_tab_comments;










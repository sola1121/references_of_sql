/* 数据字典 */

--数据字典, 数据库本身的表
desc dictionary;

select * from dictionary order by 1;

--得用管理员账户
select owner from dba_tables where table_name=upper('dictionary');  --查询表的所属人

select *　from dba_tables;

/*
USER_OBJECTS：
? 在 USER_OBJECTS 中进行查询可查看您拥有的所有对象。
? 使用 USER_OBJECTS，可获得您方案中的所有对象
名称及类型的列表以及下列信息：
– 创建日期
– 上次修改日期
– 状态（有效或无效）
ALL_OBJECTS：
? 在 ALL_OBJECTS 中进行查询可查看您拥有访问权限的所有对象。
*/

select * from  user_objects order by 1;

--用户表信息
desc user_tables;
select * from user_tables;

--列信息
desc sys.user_tab_columns;

--约束条件信息
desc user_constraints;

select constraint_name, constraint_type from user_constraints
  where lower(table_name)='employees';
/* 
c check
r reference
u unique
p primary
*/

 --视图信息
 desc user_views;
 
 select *　from user_views;
 
 SELECT text FROM user_views
WHERE view_name = 'EMP_DETAILS_VIEW';

 --序列信息
 desc user_sequences;
 
 select * from user_sequences;
 
 
 
 --索引信息
 desc user_indexes;
 
 select * from user_indexes;
 
 SELECT index_name, table_name
FROM user_indexes
WHERE table_name = 'emp_lib';

--同义词信息
DESCRIBE user_synonyms;

select * from user_synonyms;
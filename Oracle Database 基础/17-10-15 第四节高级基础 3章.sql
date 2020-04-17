--数据库字典, 其中包含了数据视图, 是数据库所有的信息
desc dictionary;
select * from dictionary;   --user用户表, all扩展用户的视图, DBA数据库管理员视图, V$性能相关参数

desc user_objects;   --当前账号的对象

select table_name from user_tables;  --表信息

--约束条件信息
desc user_constraints;   --约束表
desc user_cons_columns;   --列信息表

--在字典中查询各种信息
--user_views视图, user_sqquences序列, user_indexes索引, user_Synonyms同义词

desc user_indexes;
select index_name, index_type, table_name, table_type from user_indexes where table_name = 'EMPLOYEES';
--查看employees表的所有index

--comment 给表加上注释
comment on table employees
is '员工表';

select * from user_tab_comments;










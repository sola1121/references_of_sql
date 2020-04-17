--1
select * from user_tables;

--2
select table_name from all_tables
minus
select table_name from user_tables;

--3
select * from user_tab_columns where table_name = '&table_name';

--4
desc user_constraints;
desc user_cons_columns;

select column_name, constraint_name, constraint_type, search_condition, status from user_constraints
join user_cons_columns using(constraint_name);

--5
comment on table departments is 'This is a comment.';
select * from user_tab_comments;

--6
create synonym emp for employees;
select * from user_synonyms;

--7
select * from user_views;

--8
select sequence_name, min_value, max_value, increment_by, last_number from user_sequences;

--9
select table_name from user_tables
where lower(table_name) in('emp2', 'dept2'); 

--10
select constraint_name, constraint_type from user_constraints
where lower(constraint_name) like '%emp_id%' and lower(constraint_name) like '%dept_id%';

--11
select object_name, object_type from user_objects
where lower(object_name) like '%emp%' and lower(object_name) like '%dept%';

--12
create table sales_dept(
  team_id number(3) primary key using index (create index SALES_PK_IDX on sales_dept(team_id)),
  location varchar2(30)  
); 

select index_name, table_name, uniqueness from user_indexes
where lower(table_name) = 'sales_dept';




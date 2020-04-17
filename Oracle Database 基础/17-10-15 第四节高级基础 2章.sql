--alter table 添加修改删除列
/*
alter table ... add ();
alter table ... modify ();
alter table ... drop ();
*/
create table deptv80
as select employee_id, last_name, salary from emloyees where department_id = 80;

alter table deptv80
add (job_id varchar2(19));   --添加列

alter table deptv80
modify (last_name varchar2(40));   --修改列

alter table deptv80
drop (salary);   --删除列

--set unused 标记未使用列
alter table deptv80
set unused (salary);   --设置salary列为unused

alter table deptv80
drop unused column;   --删除设置为unused的列

--添加约束条件的语法
alter table emp2
add constraint emp_fk_dept foreign key(manager_id) references departments(manager_id) on delete cascade;   --添加级联 on delete set null

create table emp2
as select * from employees
where 1=2;   --保存结构的创建

alter table emp2
add constraint the_test_emp2_dept_fk foreign key(department_id) references departments(department_id)
deferrable initially deferred;  --延迟约束条件 还有 deferrable initially immediately(默认)

drop table emp2;

--删除约束条件
alter table emp2
drop constraint the_test_emp2_dept_fk;

alter table emp2
drop constraint primary key cascade;  --如果主键作为它表的外键, 使用级联cascade

--禁用约束条件
alter table emp2
disable constraint the_test_emp2_dept_fk;

--启用约束条件
alter table emp2
enable constraint the_test_emp2_dept_fk;

--级联约束条件 cascade constraint 

--重命名表列和约束条件
alter table emp2 rename column emp_id to id;
alter table emp2 rename constraint the_test_emp2_dept_fk to fk;

--创建索引
/*
自动创建
手动创建
*/
create table new_emp(
  id number(7) primary key using index(create index ne_id_index on new_emp(id))
);

--flashback 闪回, 对DDL也可
desc recyclebin;   --回收站
select object_name, original_name, operation, type from recyclebin;
flashback table emp2 to before drop;

--创建临时表

--创建外部表
create or replace directory emp_data --创建的目录
as '/home/oracle/emp';
grant read, write,  on emp_data to hr;   --DBA赋予权限
create table emp_txt(fname char(25), lname char(25)) --创建连接表
organization external
(type oracle_datapump
  default














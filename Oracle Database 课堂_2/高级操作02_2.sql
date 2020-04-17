/*deferrable 延迟属性,  INITIALLY DEFERRED 有错误不会报, 到提交时会报错 与 INITIALLY IMMEDIATE */


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
create table emp_new_sal (   --创建表包括check约束 和 可延迟性
  salary number(5) constraint con_sal_check check (salary>100) deferrable initially immediate,
  bounds number(30) constraint con_bounus_check check (bounds>0) deferrable initially deferred
);

insert into emp_new_sal
  values(101, -1);
rollback;

alter table emp_new_sal rename column salary to sal;   --重命名列


alter table emp_new_sal 
  drop primary key cascade;   --级联式删除表的约束条件
  
--停用约束, 启用约束
alter table dept
  add constraint dept_id_check check (id>0);

insert into dept 
  values (-8, 'TTTTT');
rollback;
--在 ALTER TABLE 语句中使用 DISABLE 子句可停用完整性约束条件
alter table dept
  disable constraint dept_id_check;

--使用 ENABLE 子句可激活表定义中当前禁用的完整性约束条件
alter table dept
enable constraint dept_id_check;

/*
CASCADE CONSTRAINTS 子句应与 DROP COLUMN子句一起使用。
CASCADE CONSTRAINTS 子句会删除引用了在被删除列上定义的主键和唯一关键字的所有引用完整性约束条件。
CASCADE CONSTRAINTS 子句还会删除在被删除列上定义的所有多列约束条件。

ALTER TABLE emp2
DROP COLUMN employee_id CASCADE CONSTRAINTS;

ALTER TABLE test1
DROP (col1_pk, col2_fk, col1) CASCADE CONSTRAINTS;
*/


--创建表的时候创建索引
create table new_emp (
  employee_id number(6) primary key 
  using index ( create index new_emp_index on new_emp(employee_id) ),
  last_name varchar2(20),
  first_name varchar2(20)
);

SELECT INDEX_NAME, TABLE_NAME
  FROM USER_INDEXES
  WHERE TABLE_NAME = 'new_emp';

--基于函数的索引
create index upper_last_name_newemp
  on new_emp(upper(last_name));    --在不确认所搜寻的列是否为大写,为了能提高搜索效率, 建立一个大写的index
  
--drop  index  索引名;

--删除表
drop table new_emp;
drop table new_emp purge;   --彻底删除

flashback table 在回收站中的表 to before drop;    --闪回删除前

desc recyclebin;   --这是记录系统操作的表

select * from recyclebin;

--创建临时表
create global temporary table cart on commit delete rows;

create global temporary table today_salary on commit delete rows
  as select *　from orders where order_date=sysdate;
  
--外部表
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

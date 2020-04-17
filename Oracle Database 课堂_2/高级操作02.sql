--alter table 

/*
alter table 语句, 可以添加, 修改或删除列

alter table 表名
add (新建列名 类型, ... );

alter table 表名
modify (列名 新类型, ...);

alter table 表名
drop (列名, ...);

set unused
使用 SET UNUSED 选项可将一列或多列标记为“未使用”。
使用 DROP UNUSED COLUMNS 选项可删除已标记为“未使用”的列。

所选列将会不可用, 也会不可见

ALTER TABLE <table_name>
SET UNUSED(<column_name> [ , <column_name>] );

ALTER TABLE <table_name>
SET UNUSED COLUMN <column_name> [ , <column_name>] ;

ALTER TABLE <table_name>
DROP UNUSED COLUMNS;

*/

select * from HR.job_grades;

alter table HR.job_grades
set unused (highest_sal);   --添加表上的未使用标记

alter table HR.job_grades
DROP UNUSED COLUMNS;    --删除表中列上的未使用标记

create table departments10
 as(select * from departments);
 
alter table departments10
add ( XXX varchar2(60));

alter table departments10
modify ( XXX varchar2(9));

alter table departments10
drop ( XXX);

/* 管理约束条件

添加约束条件
alert table 

ALTER TABLE emp2
MODIFY employee_id PRIMARY KEY;   --更改表主键

ALTER TABLE emp2
ADD CONSTRAINT emp_mgr_fk FOREIGN KEY(manager_id) REFERENCES emp2(employee_id);   --添加表约束, 外键


*/

/*
on delete子句

在删除父关键字后，使用 ON DELETE CASCADE 子句删除子行
ALTER TABLE emp2 
  ADD CONSTRAINT emp_dt_fk FOREIGN KEY (Department_id)
  REFERENCES departments(department_id) ON DELETE CASCADE;   --级联

在删除父关键字后，使用 ON DELETE SET NULL 子句将子行值设置为空值
ALTER TABLE emp2 
  ADD CONSTRAINT emp_dt_fk FOREIGN KEY (Department_id) 
  REFERENCES departments(department_id) ON DELETE SET NULL;


deferrable 或 not deferrable  延迟约束条件
*/









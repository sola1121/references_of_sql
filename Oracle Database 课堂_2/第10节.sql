--SELECT * FROM   usera.employees; 访问另一个用户的表 


--创建表
create table job_grades2(
  grade_level varchar(2),
  minsalary number(10,2),
  max_salary number(10,2)
  );
  
--对创建的表进行修改
alter table job_grades2 add (myday date);

desc job_grades;

--default  缺省的默认值,  modify  修改列使用
alter table job_grades2 modify (myday default sysdate);

insert into job_grades2 (grade_level,min_salary,max_salary)
  values ('A',1000,2999);   --使用插入测试,没有myday及数据, 但会自动生成
  
--添加约束
create table HR.sale_rep (
  employee_id number not null,
  last_name varchar2(40) not null,
  salary number(8,2) constraint "salary_Check_0_" check (salary>0),  --列级别的约束条件
  commission_pct number(2,2),
  department_id number(4), 
  constraint "pk_empoyee_id" primary key (employee_id),   --表级别的约束条件
  constraint "departId_fk_" foreign key (department_id) references departments(department_id)   --表级别的约束条件
  );

drop table hr.sale_rep;
--更改约束条件
alter table sale_rep modify (salary not null);   --更改列
alter table sale_rep add (email varchar2(40) unique);   --添加列

/*
**FOREIGN KEY 用于在表约束条件级别定义子表中的列。 
**REFERENCES 用于标识父表中的表和列。 
**ON DELETE CASCADE 指出在删除父表中的行时，还删除子表中的相关行。 级联删除
**ON DELETE SET NULL 指出在删除父表中的行时，将外键值设为空值。 
*/
--not null ,check, unique, primary key, foreign key

select department_id as d_e_dept_id from departments;

desc job_history;

--on delete set ...
alter table sale_rep modify
(department_id number(4), constraint "salae_rep_fk" foreign key (department_id)
  references department3(department_id) on delete set null);

--子查询创建表 create table ... as ...
create table departmentsx as
select * from departments;

desc departmentsx;

--alter table add()
--alter table modify()

alter table departmentsx add (testCol varchar(4));  --添加列

alter table departmentsx drop (testCol);   --删除列

desc departmentsx;
commit;

rollback;

alter table departmentsx rename column testcol to xx;

alter table departmentsx rename to departmentsxx;
rollback;
desc departmentsxx;

insert into departmentsxx(department_id, department_name,location_id,manager_id)  select * from departments ;

--read only  设置表只读     read write  可写入
alter table departmentsxx read only;
alter table departmentsxx read write;

--purge 删除所有表及内容
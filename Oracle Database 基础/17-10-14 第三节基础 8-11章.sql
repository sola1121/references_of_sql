
--集合运算都必须满足运算集合相同(列数量,类型)
select employee_id, job_id from employees
union     --两个集合取并,去掉向同行排序,取并集合得满足列相同
select employee_id, job_id from job_history;

select employee_id, job_id, department_id from employees
union all    --两个列数量一样,类型一样,不会进行排序.
select employee_id, job_id, department_id from job_history;

select employee_id, job_id from employees
intersect  --交
select employee_id, job_id from job_history;

select employee_id, job_id from employees
minus  --减
select employee_id, job_id from job_history;

--如果一个集合不满足列相同, 使用to_char任何其他转换函数进行补齐
select location_id, department_name, to_char(null) "state_province" from departments   --使用第一个查询的主要内容
union
select location_id, to_char(null), state_province from locations;

--DML 数据操作语言 增删改
--insert 一行插入
insert into departmentsxx(department_id, department_name, manager_id, location_id)
values (310 , 'Public Relations', 100, 1700);

insert into departmentsxx(department_id, department_name, manager_id, location_id)
values (&d_id, '&name', NULL, &l_id);  --使用占位符&

desc departmentsxx;

--insert 使用复合查询的插入多行,select与插入的列数量一致,类型一致
insert into sal_rep
select employee_id, last_name, salary, commision_pct from employees
where job_id like '%REP%';

--update 修改表中的现有值 where
update employeesss
set employee_id = 120
where employee_id = 113;

update employeesss
set job_id = (select job_id from employees where emplyee_id=205),
    salary = (select salary from employees where employee_id=205),
where employee_id = 113;

--delete 从表中删除现有行, where
delete employeesss where employee_id = 101;

delete departmentsxx 
where department_id in (select department_id from departmentsxx where department_name like '%Public%');

/*
  DDL 数据定义语言,会直接提交, 后面一定是跟一个数据库对象名字 如:create table 这里table就是(动词,类型,对象名);
  而DML数据操作语言不必(动词,对象名). 数据库对象一般要使用DDL语句进行编辑
  */
--truncate 从表中删除所有行, 使表为空并保留表结构, 不会留下任何残留

--DCL数据控制语言 主要做授权
-- commit,  rollback,  savepoint

--select 中的 for update
--会将所读取的数据加锁不允许他人更改,直到行为结束,且自己也只能用这些锁定列

--create table 
create table hr.TheTestForCreateTable(
  deptno number(2),
  dname varchar2(50),
  time_ date default sysdate
);

drop table hr.TheTestForCreateTable;

create table hr.TheTestForCreateTable(
  student_id number(6) constraint student_pk primary key,
  name varchar2(16) constraint name_not_null not null,
  register_date date default sysdate,
  grade number constraint ch_grade_min check (grade>0)
);

--使用子查询创建表时添加数据
create table hr.TheTestForCreateTable
as (select * from departments);

--alter table 添加新列,修改现有列定义,定义新列的默认值,删除列,重命名列,将表的状态改为只读read only 或 read write

--drop table 删除表至垃圾站(管理员会直接删除), purge参数直接删除

--视图  可以看做一个查询的结果,以select语句存储在数据库字典中
--create view
--创建和修改视图
create or replace view empv80
as 
select employee_id, last_name, salary from employees
where department_id=80;

desc empv80;

create or replace view salv50(id, name, sal)  --创建别名
as 
select employee_id, last_name, salary from employees
where department_id=50;

desc salv50;
select * from salv50;

drop view empv80;
drop view salv50;

create or replace view report_vu
as
select e.department_name, min(salary), max(salary), avg(salary) from employees e
join departments d using(department_id)
group by 1;

--with check option ...
--with read only 拒绝DML操作,这对于复杂视图很有用

--序列   sequence 自动生成编号
--nextval  currval 伪列, currval只有调用过一次nextval crrval才回有值
create sequence seq_class
  start with 10   --起始值
  increment by 10   --步长
  maxvalue 120  --最大值
  cycle   --循环使用
  nocache;   --不预先生成
drop sequence seq_class;
select seq_class.nextval from dual; --循环会从1开始
select seq_class.currval from dual;

--索引 index 一个方案对象,如同一个指针,提高处理速度
--适用于大型表,但内容较少2%-4%占查询内容表的比率,经常出现在where后面
create index index_emp_lname
on employees(last_name);

--同义词 synonym,  create pubilc synonym...创建公有的
create synonym emp for employees;  --这样emp就是employees
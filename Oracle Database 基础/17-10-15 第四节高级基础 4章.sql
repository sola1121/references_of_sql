--DML
--使用子查询处理数据
--子查询相当于视图
desc regions;
desc locations;

select department_name, city from departments
natural join (select l.location_id, l.city, l.country_id from locations l
                join countries c on l.country_id = c.country_id
                join regions r on c.region_id = r.region_id
                where region_name = 'Europe');
                
--DML语句中使用 with check option 禁止对不在子查询中的行进行更改

--default使用缺省值

--从其他表中复制行
create table sals_reps(id, last_name, sal)
  select employee_id, last_name, salary from employees where 1=2;   --复制表列结构

insert into sals_reps
  select employee_id, last_name, salary from employees;    --复制数据
  
--多表的insert
create table sal_his(id, name, sal)
as select employee_id, last_name, salary from employees where 1=2;

create table mgr_his(id, mgr, sal)
as select manager_id, last_name, salary from employees where 1=2;
--无条件插入多张表
insert all
into sal_his values(employee_id, last_name, salary)
into mgr_his values(manager_id, last_name, salary)
select employee_id, last_name, manager_id, salary from employees   --提供源数据列来源
where employee_id>= 200;

select * from mgr_his;
select * from sal_his;
--有条件插入多张表, 满足条件就执行插入语句, 匹配所有条件, 相当于多个if语句并排
insert all 
when hiredate < 

--有条件插入, 选第一个满足条件的插入, 相当于多个 if... else if...并排
insert first
when salary < 500 then 
  into sal_low values (employee_id, last_name, salary)
when salary <10000 then
  into sal_mid values (employee_id, last_name, salary)
else 
  into sal_high values (empolyee_id, last_name, salary)
select empolyee_id, last_name, salary from employees;

--转换insert插入   Pivoting insert

--合并表的行 merge
create table stu(
  id number(4),
  name varchar2(16),
  score number(5)
);

insert into stu values(4,'D',104);

create table stu_cp
as select * from stu where 1=2;

insert into stu_cp values(5,'E',105);

merge into stu_cp sc
using (select * from stu) s on (sc.id=s.id)
when matched then
  update set sc.name = s.name, sc.score = s.score
when not matched then
  insert (id, name, score) values(s.id, s.name, s.score);     
                
--闪回版本查询
select versions_starttime, versions_endtime, score 
from stu versions between SCN minvalue and maxvalue where id = 4;












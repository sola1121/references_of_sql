--创建视图
/*create or replace force view ()
**as subquery
**with check option
*/

create view empvu80
as (select employee_id, last_name, first_name, salary from employees
    where employee_id = 80);
    
desc empvu80;

create view fiscalyearsalary
as (select employee_id, last_name "姓", first_name "名", salary * 12 "Annual Salary" from employees
    where department_id = 50);
    
desc fiscalyearsalary;

select "Annual Salary" from fiscalyearsalary where 姓='Bull';   --双引号代表不想让其值改变的字符

--修改视图
create or replace view empvu80
as (select employee_id, first_name || ' ' ||last_name "Name", 
    salary * 12 "Annual_Salary", department_id from employees
    where department_id=80);
    
desc empvu80;


create or replace view sa
as (select department_id, max(salary) "MaxSalary", min(salary) "MinSalary", 
    round(avg(salary),2) "Average" from employees 
    group by department_id);

drop view sa;

CREATE OR REPLACE VIEW dept_sum_vu (name, minsal, maxsal, avgsal)
as select  d.department_name, MIN(e.salary), MAX(e.salary),AVG(e.salary) from employees e 
   join departments d on (e.department_id = d.department_id)
   group by d.department_name;

create or replace view dept_sum_vu (name, minsal, maxsal, avgsal)
as select nvl(d.department_name, 'Others') "Department_name",    --nvl(ifnull, '')  替换null
   MIN(e.salary), MAX(e.salary),round(AVG(e.salary),2) from employees e 
   left outer join departments d on (e.department_id = d.department_id)
   group by department_name;
   
desc dept_sum_vu;
/*
insert into dept_sum_vu
  values('TestTTT', 10000, 5000, 4500);  --会报错, 不会允许对视图的修改, 因为视图是别的表生成的,有基础的
*/

create or replace view dept80
as select department_id, department_name from departments;

insert into dept80 values (330, 'TestTTT 2');   --简单的视图可以插入, 但同时也会影响到它的基表的数据
rollback;

rename dept80 to deptIDName;

select * from departments where department_id =330;

create or replace view empvu20
  as (select * from employees where department_id = 20)
  with check option constraint empuv20_constraint;    
  --with check option 强制视图上执行的所有数据修改语句都必须符合由 select_statement 设置的准则
  
create or replace view empvu20
  as (select * from employees where department_id = 20)
  with read only;   --只读
  
--序列号  sequence
create sequence dept_seq1
  start with 500    --起始数
  increment by 10   --步长
  maxvalue 2000;   --最大值

desc departmentsxx;

insert into departmentsxx (department_id, department_name, location_id)
values (dept_seq1.nextval, 'test squence', 1000);     --使用序列, 自动位id插入满足顺序与规则的整数

select dept_seq1.currval from dual;  --返回当前的序列值

--索引   index   加速我们的查询
create index emp_last_name_index
on employees(last_name);


--同义词    synonym  就是别名
/*
**CREATE [PUBLIC] SYNONYM synonym
**FOR    object;
*/

create  synonym  elni
for emp_last_name_index;
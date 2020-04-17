--系统表数据库参数, 可以查看如编码等
select * from nls_database_parameters;

create table testLength(gender varchar2(2));

insert into testLength values('男');


--成对比较子查询
/*
显示与名字为“John”的雇员在同一经理领导下且在同一部门中工作的雇员的详细资料。
*/
select employee_id, manager_id, department_id from employees
  where (manager_id, department_id) in (select manager_id, department_id from employees where first_name = 'John')
  and first_name <> 'John';
  
--不成对比较子查询
/*
显示与名字为“John”的雇员在同一经理领导下且在同一部门中工作的雇员的详细资料。
*/
select employee_id, manager_id, department_id from employees
  where manager_id in (select manager_id from employees where first_name = 'John')
  and department_id in (select department_id from employees where first_name = 'John')
  and first_name <> 'John';
  
--case
select employee_id, last_name,
(case when department_id =
                          (select department_id from departments where location_id = 1800)
      then 'Canada' 
      else 'USA' END) location
from employees;

--order by
select employee_id, last_name from employees e
  order by (select department_name from departments d
  where e.department_id = d.department_id);

--使用相关子查询
/*
查找其薪金高于所在部门的平均薪金的所有雇员
有点类似于自连接
*/
select last_name, salary, department_id from employees outer_table 
  where salary > (select avg(salary) from employees inner_table
  where inner_table.department_id = outer_table.department_id);
/*
显示至少调换过两次职务的那些雇员的详细资料
*/
select e.employee_id, last_name,e.job_id from employees e
  where 2 <= (select count(*) from job_history where employee_id = e.employee_id);
  
select department_name from departments d
  where 8000< all (select salary from employees where department_id=d.department_id);   --all

select department_name from departments d
  where 8000< any (select salary from employees where department_id=d.department_id);   --any
  



/*
EXISTS 运算符用来测试在子查询的结果集中是否存在有关行。
? 如果找到了子查询行值：
– 则不在内部查询中继续进行搜索
– 该条件会标记为 TRUE
? 如果未找到子查询行值：
– 该条件会标记为 FALSE
– 在内部查询中继续进行搜索
*/

select employee_id, last_name, job_id, department_id from employees e1
  where exists (select 'X' from employees e2 where e2.manager_id = e1.employee_id);

--查找没有任何雇员的所有部门  
select department_id, department_name from departments d
  where not exists ( select 'X' from employees where department_id = d.department_id);

--update
UPDATE table1 alias1
SET column = (SELECT expression from table2 alias2
              WHERE alias1.column = alias2.column);

--delete
ALTER TABLE empl6
  ADD(department_name VARCHAR2(25));

UPDATE empl6 e
  SET department_name = (SELECT department_name FROM departments d
                          WHERE e.department_id = d.department_id);
                          
--使用相关delete
DELETE FROM empl6 E
  WHERE employee_id =(SELECT employee_id FROM emp_history
                       WHERE employee_id = E.employee_id);

/*
WITH 子句
? 如果某个查询块在一个复杂查询内多次出现，则使用
WITH 子句时可以在 SELECT 语句中使用同一查询块。
? WITH 子句会检索查询块的结果，并将结果存储在用户
临时表空间中。
? WITH 子句可以提高性能。
*/

--使用 WITH 子句编写一个查询来显示薪金总额高于各个部门平均薪金的部门的部门名称和薪金总额。
WITH dept_costs AS (
  SELECT d.department_name, SUM(e.salary) AS dept_total FROM employees e 
  JOIN departments d ON e.department_id = d.department_id
  GROUP BY d.department_name),
  avg_cost AS (
        SELECT SUM(dept_total)/COUNT(*) AS dept_avg FROM dept_costs)
  SELECT * FROM dept_costs
  WHERE dept_total >
  (SELECT dept_avg FROM avg_cost)
  ORDER BY department_name;


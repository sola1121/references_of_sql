/* 子查询 */

select last_name, salary from employees
  where salary>(select salary from employees where last_name='Abel');

select last_name, department_id, salary from employees
  where department_id in (select distinct department_id from departments where department_name like 'IT%');
--in 可以表示一对多的关系, 等于列表中的任意一个成员

select last_name, first_name, job_id, salary from employees
  where last_name = 'Taylor';   --重名
--select last_name, job_id, salary from employees
--  where job_id = (select job_id from employees where last_name = 'Taylor');  重名出错

select last_name, job_id, salary from employees
  where salary=(select min(salary) from employees);   --工资最低的人, 组合函数也是返回一个值的,可以使用组合函数
  
select department_name from departments
  where department_id=
  (select department_id from employees where salary = 
  (select min(salary) from employees));

SELECT last_name, job_id, salary FROM   employees
WHERE  job_id in(SELECT job_id FROM   employees WHERE  last_name = 'Taylor')
AND    salary in(SELECT salary FROM   employees WHERE  last_name = 'Taylor');

--having 使用组函数
SELECT   department_id, MIN(salary) FROM employees
GROUP BY department_id
HAVING MIN(salary) >(SELECT MIN(salary) FROM employees WHERE department_id = 50);

SELECT   job_id, AVG(salary) FROM employees   ----查找具有最低平均薪金的职务。
GROUP BY job_id
HAVING   AVG(salary) = (SELECT   MIN(AVG(salary)) FROM employees GROUP BY job_id); 

--多行子查询
--in 等于列表中的任意一个成员
SELECT last_name, salary, department_id FROM employees
   WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id);


--any 前面必须是 =、!=、>、<、<=、>=。将某个值与列表中的每个值或查询返回的每个值进行比较。
--    如果查询没有返回任何行，则求值结果为 FALSE。
/*<ANY 表示低于最高值。  
**>ANY 表示高于最低值。  
**=ANY 等同于 IN。 
***/
SELECT employee_id, last_name, job_id, salary FROM employees
  WHERE  salary < ANY(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
  AND    job_id <> 'IT_PROG';



--all 前面必须是 =、!=、>、<、<=、>=。将某个值与列表中的每个值或查询返回的每个值进行比较。
--    如果查询没有返回任何行，则求值结果为 TRUE
/*>ALL 表示大于最高值
**<ALL 表示小于最低值。 
**NOT 运算符可以与 IN、ANY 和 ALL 运算符一起使用。 
*/
SELECT employee_id, last_name, job_id, salary FROM employees
  WHERE  salary < ALL(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
  AND    job_id <> 'IT_PROG';

--exists 在查询中使用 EXISTS 运算符，查询结果取决于某些行是否在表中存在。如果子查询至少返回一行，则求值结果为 TRUE
SELECT * FROM departments
WHERE NOT EXISTS(SELECT * FROM employees WHERE employees.department_id=departments.department_id);



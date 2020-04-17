/*
** insert into 所差入的表( 按顺序排的列 ) values ( 按顺序列的顺序加入表的值 );  只能插入一行
** insert into 所插入的表( 按顺序拍的列 ) 子查询语句 ;   这里的子查询的列顺序也应该和前面的声明顺序相同, 可插入多行
*/

--insert into ... values ...  只能插入一行
desc employees;
insert into employees(employee_id, last_name, email, hire_date, job_id)
values (208, 'TestName', 'Test@yahoo.com', '06-7月 -2017', 'AD_VP');

delete from employees where employee_id=208;

desc departments;
insert into departments
values ('300', 'Test_Service', null, null);

delete from departments where department_id=300;

--insert into ... values ... 调用函数
insert into employees(employee_id, last_name, email, hire_date, job_id)
values (208, 'TestName', 'Test@yahoo.com', sysdate, 'AD_VP');

delete from employees where employee_id=208;

insert into employees
values (208,'DenRaphealy', 'DRAPHEAL', 'QQ@QQ', '515.127.4561', 
        TO_DATE('2月 3, 1999', 'MON DD, YYYY'),   --使用to_char函数转换为正确日期
        'SA_REP', 11000, 0.2, 100, 60); 

delete from employees where employee_id = 208;

desc employees;

insert into departments (department_id, department_name, manager_id, location_id)
values (&depart_id, '&depart_name', null, null);  -- & 需要手动输入的

delete from departments where department_id=300;

--创建了一个 sales_reps 表
desc SALES_REP;
--编写带有子查询的 INSERT 语句  inset into ... 子查询语句
INSERT INTO sales_reps(employee_id, last_name, salary, commission_pct) 
  SELECT employee_id, last_name, salary, commission_pct FROM employees 
  WHERE job_id LIKE '%REP%'; 

delete from sales_rep;

INSERT INTO sales_reps(employee_id, last_name, salary, commission_pct, options) 
  SELECT employee_id, last_name, salary, commission_pct, salary*0.05 FROM employees 
  WHERE  job_id LIKE '%REP%'; 


--update set ... where..
update sales_reps
set options = 999
where salary>10000;

--update set ..子查询 where ..子查询
update set job_id = (select job_id from employees where employee_id = 205),
           salary = (select salary from employees where employee_id=205)   --子查询更新两列
                  where employee_id =103;
                  
UPDATE  copy_emp 
SET     department_id  =  (SELECT department_id 
                           FROM employees 
                           WHERE employee_id = 100) 
WHERE   job_id         =  (SELECT job_id 
                           FROM employees 
                           WHERE employee_id = 200); --根据另一个表更新行

--delete from ... where ...   无条件将会删除所有的行

--TRUNCATE table 数据定义语言 从表中删除所有行，使表为空并保留表结构不变 

/*
提交
commit


数据库失误处理

回滚rollback
savepoint xxx;
...
rollback xxx;   rollback to savepoint xxx;
在commit未提交之前, 可以对已经做出的delete alter update操作进行回滚

例子:
DELETE FROM test; 
25,000 rows deleted. 
 
ROLLBACK; 
Rollback complete. 
 
DELETE FROM test WHERE  id = 100; 
1 row deleted. 
 
SELECT * FROM   test WHERE  id = 100; 
No rows selected. 
 
COMMIT; 
Commit complete. 

*/

--select 语句中的 for update   禁止更改操作直到完成条件或commit,rollback
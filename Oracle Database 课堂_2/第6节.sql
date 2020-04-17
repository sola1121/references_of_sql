/* 表间连接 */
/*
**自然联接： 
**  NATURAL JOIN 子句 
**  USING 子句 
**  ON 子句 
**OUTER 联接： 
**  LEFT OUTER JOIN 
**  RIGHT OUTER JOIN 
**  FULL OUTER JOIN 
交叉联接 
*/

--natural join
select department_id, department_name, location_id, city from departments
  natural join locations
  where department_id >=100;
  
--join using()  指明具体的连接主键
select employee_id, last_name, department_id, location_id from employees 
  join departments using (department_id);

select l.city, d.department_name from locations l
  join departments d using (location_id)    --使用别名, 不能对using子句中的列加以限定
  where location_id=1400;   --location_id是using的子句,不能用l.location_id或d.location_id 来加以限定

--join on  子句可指定任意条件或指定要联接的列
select e.employee_id, e.last_name, d.department_id, d.location_id from employees e
  join departments d on d.department_id=d.department_id;   --这样得指明查询的列所属的表,依然可以使用别名

select employee_id, last_name, department_name, city from employees e
  join departments d on e.department_id = d.department_id
  join locations l on l.location_id = d.location_id;   --三表连接

--and 或 where 增加附加条件
select e.last_name, d.department_name, location_id, l.city from employees e  --location_id 不能加l.location_id
  join departments d using (department_id)
  join locations l using (location_id)
  where l.city like 'O%';
  
--自连接  将表链接到自身
select worker.last_name Worker, manager.last_name Manager from employees worker
  join employees manager on worker.employee_id=manager.manager_id;    --显示员工对应的管理者

--非等值连接
select e.last_name, e.salary, e.job_id, g.grade_level from employees e
  join job_grades g on e.salary between lowest_sal and g.highest_sal;
  
--使用outer 连接返回没有直接匹配的记录
--LEFT OUTER JOIN 此查询将检索 EMPLOYEES 表（它是左表）中的所有行，即使 DEPARTMENTS 表中没有匹配项也是如此。 
--RIGHT OUTER JOIN 此查询将检索 DEPARTMENTS 表（它是右表）中的所有行，即使 EMPLOYEES 表中没有匹配项也是如此。
--FULL OUTER JOIN 全连接
select e.last_name, d.department_id from employees e
  join departments d on e.department_id=d.department_id;   --自然连接
  
select e.last_name, d.department_id from employees e
  left outer join departments d on e.department_id=d.department_id;   --左外连接, 把department_id为空的也显示了

select e.last_name, d.department_id, d.department_name from employees e
  right outer join departments d on e.department_id=d.department_id;   --右外连接
  
select e.last_name, d.department_id, d.department_name from employees e
  full outer join departments d on e.department_id=d.department_id;    --全连接

--INNER JOIN 在表中存在至少一个匹配时，INNER JOIN 关键字返回行
  
--笛卡尔积
/**此时会显示行的所有组合
****联接条件被忽略 
****联接条件无效 
****第一个表中的所有行被联接到第二个表中的所有行,两个表行的所有的组合可能
如果要避免生成笛卡尔积，请始终包括有效的联接条件
*/
--CROSS JOIN 子句可生成两个表的叉积创建交叉连接(笛卡尔积)
SELECT last_name, department_name FROM employees 
CROSS JOIN departments;






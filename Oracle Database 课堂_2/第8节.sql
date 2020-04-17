desc job_history;

--union  集合的并运算
select employee_id, job_id from employees
union
select employee_id, job_id from job_history;   --会自动去除重复行

select employee_id, job_id from employees
union all
select employee_id, job_id from job_history;   --不会去掉重复行

--intersect 选择交集, 返回在两个表的选定列中具有相同值的那些记录
select employee_id, job_id from employees
intersect
select employee_id, job_id from job_history;

--minus 返回由第一个查询选定的但没有出现在第二个查询结果集中的所有不同行（第一个SELECT语句减去第二个SELECT语句）
select employee_id, job_id from employees
minus
select employee_id, job_id from job_history;   --到公司没有换过职位的员工

/*select employee_id, last_name, job_id from employees
where employee_id*/

select location_id, department_name, to_char(NULL) from departments
union
select location_id, to_char(NULL), state_province from locations;
--to_char 将表中没有数据的对应的行转换为空值显示

select employee_id, job_id, salary from employees
union
select employee_id, job_id, 0 from job_history;   --表中对用没有数据的数值型直接有一个数就可以替换掉


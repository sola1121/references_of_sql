select count(Department_id) from departments;
select first_name, last_name from employees;
select last_name, salary, salary+3 from employees;
select last_name, salary 每月, (salary+100)*12 from employees;  --月薪加100
select last_name, salary 每月, salary*12+100 from employees;  --年薪加100
SELECT last_name, job_id, salary, commission_pct commission_pct包含空值 FROM employees;
select last_name, commission_pct as "别名" from employees;  --双引号是保证显示为输入的别名不会变化
SELECT last_name AS name, commission_pct comm FROM employees;
SELECT last_name "Name" , salary*12 "Annual Salary" FROM employees;

--||
select last_name || job_id "Employees" from employees;  --连接运算符 ||
select first_name ||'_'|| last_name || '''' || 's job is ' || job_id as "Employees" from employees;  -- ' 是转义字符
select department_name || q'( department manager id: )' || manager_id as "Department and Manager" from departments;
--其它引号 q 运算符, 可以原封不动的输出定义在其中的字符
select distinct department_id from employees order by department_id;  --ditinct区别重复
desc employees;  --表结构查询
select first_name ||'_'|| last_name as name, job_id, salary*12 yearly_sal from employees;

select first_name from employees where first_name like 'M%';
select first_name||'_'||last_name, department_id from employees where department_id=90;
select first_name||'_'||last_name "Name",salary  from employees where salary<5000;
select * from employees where last_name='Whalen';
select hire_date from employees;
select first_name||'_'||last_name "Name" from employees where hire_date='17-6月 -03';  --默认日期格式 DD-MM-YY

--Between and
select last_name, salary from employees where salary between 2500 and 3500;   --between ... and ...
select last_name, salary from employees where salary>=2500 and salary<=3500;

--and or 
select last_name from employees where last_name between 'David' and 'George';   --按照ASCII的字符顺序查询
select employee_id, last_name, salary, manager_id from employees where manager_id in (100, 101, 201);
--测试指定值集中的值，使用 IN 运算符. 显示在manager_id为100或101或201管辖下的员工
select employee_id, last_name, salary, manager_id from employees 
  where manager_id=100 or manager_id=101 or manager_id=201;
  
--like
select last_name from employees where last_name like '_o%';   -- _ 表示一个字符, % 表示零个或多个字符
select first_name from employees where first_name like 'S%';
select first_name, hire_date from employees where hire_date like '%-% -05';   --查看05年被雇佣的雇员

select substr(job_id,1,2) 前段截取, job_id, last_name from employees;
select job_id, last_name from employees where job_id like 'ST\_%' escape '\';
--搜索包含 SA_ 的字符串,escape可以定义转移字符,在这里escape定义\为转义, \可以转换为其它

select last_name, manager_id from employees where manager_id is null;   --is
select last_name, manager_id from employees where manager_id is not null;   --is not
select employee_id, last_name, job_id, salary from employees where salary >= 10000 and job_id like '%MAN%';
select last_name, job_id from employees where job_id not in('IT_PROG', 'ST_CLERK', 'SA_ERP');
SELECT last_name, job_id, salary FROM employees 
  WHERE job_id = 'SA_REP' OR job_id = 'AD_PRES' AND salary > 15000;
--如果某雇员是AD_ 且salary高于 $15,000，或者该雇员是SA_ ，则选择相应的行。
SELECT last_name, job_id, salary FROM employees 
  WHERE (job_id = 'SA_REP' OR job_id = 'AD_PRES') AND salary > 15000;
--预算顺序改变, 选出job_id 为SA_ 或 AD_ salary 大于 15000

--order by
select last_name, job_id, department_id, hire_date from employees order by hire_date;   --默认排序为升序
select last_name, job_id, department_id, hire_date as "Enter_date" from employees order by "Enter_date";
select last_name, job_id, department_id, hire_date from employees order by 4;   --按照输出的第几列排序
select last_name, job_id, department_id, hire_date from employees order by 1,4;   --按照输出的第1列第4列排序

--& 替代符
select last_name, salary, department_id, manager_id from employees order by 4 desc nulls first;   --降序并且null优先显示
SELECT employee_id, last_name, salary, department_id FROM employees WHERE employee_id = &employee_num;
-- & 输入变量值, 其定义的变量是可替代的, 输入数值型
select last_name, employee_id, salary from employees where last_name = '&Last_Name';  --区分大小写,对字符使用单引号
SELECT &替代表1, last_name, salary, department_id FROM employees WHERE &替代条件2;   --直接的替代
select last_name, &&重复替换值1, salary from employees order by &重复替换值;   --一次输入两次相同的替换值

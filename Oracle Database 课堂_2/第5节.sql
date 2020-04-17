/*组函数,  可以对多个同属性数据进行处理*/
--max min avg count sum stddev variance
select max(salary) from employees;

select round(avg(salary),2), sum(salary), min(salary), max(salary) from employees
  where job_id like '%REP%';
  
--日期,字符使用min与max
select min(hire_date), max(hire_date) from employees;

select min(last_name), max(last_name) from employees;

--count 计算满足条件的行数
select count(employee_id) from employees;
select count(employee_id) from employees where department_id = 100;
select count(commission_pct) from employees;   --null 不计数, 找非空行计数
select count(*) from employees where commission_pct is not null;
--去重复计数
select count(distinct last_name) from employees;
select count(distinct first_name) from employees;
select distinct department_id from employees;
select count(distinct department_id) from employees;

--组函数将忽略列中的空值
select avg(commission_pct) from employees;
select avg(nvl(commission_pct,0)) from employees;

--group by , having  
/*使用 GROUP BY 子句时，应确保将 SELECT 列表中未出现在组函数中的所有列都包含在 GROUP BY 子句中*/
select department_id, round(avg(salary)) from employees
  group by department_id    --分组
  order by department_id;   --排序
  
select department_id, manager_id, round(avg(salary)) from employees
  group by department_id, manager_id   --分组更细
  order by department_id;
--group by 的列不一定要出现在select语句中
select round(avg(salary),0) from employees
  group by department_id;   --因为select中只有一个组函数表达式

select department_id, job_id, round(sum(salary),0) from employees
  group by department_id, job_id;   --select中有这两项就得写出来

select department_id, round(sum(salary),0) from employees
  where department_id>80
  group by department_id;    --可以用where对内容进行筛选, 但不能用where来限定组
  
select department_id, round(avg(salary),0) from employees
  group by department_id
  having avg(salary)>8000   --组函数用having来表限定的筛选
  order by department_id;   --平均工资大于8000的部门id, 使用having对组进行筛选

select job_id, sum(salary) Payroll from employees
  where job_id not like '%REP%'
  group by job_id
  having sum(salary)>20000;
--组函数嵌套 
select max(avg(salary)) from employees
  group by department_id;  --avg出来的多值, 而max返回为一个值



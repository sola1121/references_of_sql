select * from departments;

select last_name, salary from employees;

select last_name||job_id as name&job from employees;

select sysdate from dual;

select last_name, hire_date from employees 
where hire_date between '1-1月 -00' and '12-12月 -05';

select manager_id from employees
where manager_id in(100, 101, 201);

-- ' 转义  q'  只能用于单引号
select last_name || q'[ departments' manager ]'  ||job_id  from employees;

-- escape 说明什么是转义符 只能用于通配符中
select last_name from employees where last_name like '%\_%' escape '\'; 


select last_name from employees where last_name like '_o%';

select last_name, job_id, salary from employees
where salary>=6000 and job_id like '%MAN%';


--升序 ASC, 降序desc,  order by可以用别名也可以用位置顺序来排
select last_name, job_id, hire_date from employees
order by hire_date;
select last_name, job_id, hire_date from employees
order by 3 desc;

--&  替代值, 加单引号后整个都将视为一个字符串而不是代替后面的值
print a=&f;

select &a from employees;

--&& 相同变量名的值只需要输入一次便确定了

select last_name, &&hire from employees
order by &hire;

--define 定义一个变量
define ename='Whalen';
select last_name, job_id from employees
where last_name='&ename';

--使用verify可替换显示
set verify on;

select last_name, job_id from employees where last_name=&n;

--SQL函数
select lower('Hello'), upper('world'), initcap('hello, wold.') from dual;

select employee_id, concat(last_name, first_name), job_id, length(last_name)instr(last_name, 'a') from employees
where substr(job_id, 4)='ERP';

select round(45.963, 2), round(45.923, -1), trunc(49.265, 1) from dual;

--日期函数   默认:DD-MON-RR
select last_name, (sysdate-hire_date)/7 as "Worked Weeks" from employees;

select months_between('01-3月 -17', '01-6月 -17') from dual;

select add_months('01-3月 -17' , 5) from dual;


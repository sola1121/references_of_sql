select last_name from employees where hire_date > '08-2月 -03';

--to_char(date, 'format_model')
select last_name, to_char(hire_date, 'fmDD Month YYYY') as "TheDitailDate" from employees;   
--to_char()显示转化设置format_model格式, 使用显示转换设置日期的格式
select last_name, to_char(hire_date, 'fmDDspth "of" MM YYYY') from employees;
--设置显示日期的格式

--to_char(number, 'format_model')
select last_name, to_char(salary, 'fm$99,999.00') from employees;   --按照格式显示数字
select last_name, lpad(to_char(salary, 'fm$99,999.00'), 12, '#') from employees;
select last_name, concat('$',to_char(salary, 'fm99,999.00')) from employees;
select last_name, '$' || lpad(to_char(salary, 'fm99,999.00'),9,' ') from employees;   --对齐

--to_number() 将字符串转换为数字形式   to_date() 将字符串转化为日期型
select last_name, hire_date from employees where hire_date = to_date('17 Jun 03', 'DD-Mon-RR');
--日期格式得匹配
select last_name, to_char(hire_date, 'DD-Mon-YYYY') from employees
  where hire_date < to_date('01-Jan-04', 'DD-Mon-RR');   --格式得匹配
  
--嵌套函数
select TO_CHAR(ROUND((salary/7), 2), '99G999D99', 'NLS_NUMERIC_CHARACTERS = '',.'' ')  
	"Formatted Salary" 
  from employees;

select TO_CHAR(ROUND((salary/7), 2), '99G999D99')  
	"Formatted Salary" 
  from employees;

select ROUND((salary/7), 2) from employees;

--常规函数
--NVL(源, 目标) NVL2(源, 目标1, 目标2) 转换空值 null_value
--select last_name, nvl(commission_pct, 0), salary*12+salary*nvl(commission_pct, 0) "annual salary" from employees;
--转换空值为确定的值才能在计算中使用
--NULLIF() 函数用于对两个表达式进行比较, 两个形参相同返回NULL, 不同返回第一个非空形参
SELECT first_name, LENGTH(first_name) "expr1", 
       last_name,  LENGTH(last_name)  "expr2",
       NULLIF(LENGTH(first_name), LENGTH(last_name)) result
  FROM employees;
--COALESCE 函数用于返回列表中的第一个非空表达式,
/*
**COALESCE (expr1, expr2, ... exprn) 
**在该语法中： 
**expr1 返回此表达式（如果它不为空） 
**expr2 返回此表达式（如果第一个表达式为空，而此表达式不为空） 
**exprn 返回此表达式（如果前面的表达式都为空） 
**请注意，所有表达式都必须具有相同的数据类型。
**依次判断表达式是否为空为空,非空便显示当前表达式,为空进入下一个表达式继续判断直到最后
*/
SELECT last_name, employee_id, 
  COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'No commission and no manager') 
  FROM employees;
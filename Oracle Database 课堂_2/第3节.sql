/*
**要确认 SQL 语句中的更改，请使用 VERIFY 命令。
**设置 SET VERIFY ON 会强制 SQL Developer 在使用值替换替代变量之后显示命令的文本。
**要查看 VERIFY 输出，应使用 SQL 工作表中的“Run Script（运行脚本）”(F5) 图标。
**SQL Developer 使用值替换替代变量之后，将在“Script Output（脚本输出）”选项卡上显示命令文本，如幻灯片中所示。  
**幻灯片示例在 SQL 语句中显示了 EMPLOYEE_ID 列的新值，然后显示输出
*
**define 可以定确认值
*/

--函数
--大小写
select last_name, first_name from employees 
  where lower(last_name)='king' or lower(last_name)= 'king';   --转换小写字母然后用小写字母进行搜寻 lower

--lpad rpad
select lpad(salary, 10, '*') from employees;   --左填充字符到10位 lpad

--trim
select trim('T' from 'Thursday') from dual;   --裁去字符  trim 只能从首字母开始裁

--replace
select replace('Thursday', 'Th', 'W') from dual;   --找到Th字符替换为W  replace

--concat()连接字符串
SELECT employee_id, CONCAT(first_name, last_name) NAME,    --concat() 连接两个字符 相当于||
  job_id, LENGTH (last_name),   --length 返回字符长度
  INSTR(last_name, 'a') "Contains 'a'?"   --instr 判断字符'a'在源中的位置
  FROM   employees
  WHERE  SUBSTR(job_id, 4) = 'REP';
  
--四舍五入 round() 
select round(45.923, 2), round(45.923, 0), round(45.923, -1) from dual;   --将值舍入到指定的小数位

--mod()
select last_name, salary, mod(salary, 5000) from employees where job_id like 'AD_%';   --取余数运算

--日期的应用
select last_name, hire_date from employees;   --  DD-MM-RR
select last_name, '20'||substr(hire_date, 8, 9) from employees;
select last_name, hire_date from employees where hire_date>'20-9月 -05';

select sysdate from dual;

select last_name, (sysdate-hire_date)/7 as "Have Weeks" from employees;
select last_name, trunc((sysdate-hire_date)/7, 1) as "Have Weeks" from employees;   --trunc 截取到小数点多少位

select NEXT_DAY('1-9月 -95', 3) "NEXT DAY" from dual;
alter session set NLS_DATE_LANGUAGE = American;   --设置语言变量
select next_day(sysdate, 'Monday') from dual;   --现在时间中的下一个周一
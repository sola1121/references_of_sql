select last_name from employees where hire_date > '08-2�� -03';

--to_char(date, 'format_model')
select last_name, to_char(hire_date, 'fmDD Month YYYY') as "TheDitailDate" from employees;   
--to_char()��ʾת������format_model��ʽ, ʹ����ʾת���������ڵĸ�ʽ
select last_name, to_char(hire_date, 'fmDDspth "of" MM YYYY') from employees;
--������ʾ���ڵĸ�ʽ

--to_char(number, 'format_model')
select last_name, to_char(salary, 'fm$99,999.00') from employees;   --���ո�ʽ��ʾ����
select last_name, lpad(to_char(salary, 'fm$99,999.00'), 12, '#') from employees;
select last_name, concat('$',to_char(salary, 'fm99,999.00')) from employees;
select last_name, '$' || lpad(to_char(salary, 'fm99,999.00'),9,' ') from employees;   --����

--to_number() ���ַ���ת��Ϊ������ʽ   to_date() ���ַ���ת��Ϊ������
select last_name, hire_date from employees where hire_date = to_date('17 Jun 03', 'DD-Mon-RR');
--���ڸ�ʽ��ƥ��
select last_name, to_char(hire_date, 'DD-Mon-YYYY') from employees
  where hire_date < to_date('01-Jan-04', 'DD-Mon-RR');   --��ʽ��ƥ��
  
--Ƕ�׺���
select TO_CHAR(ROUND((salary/7), 2), '99G999D99', 'NLS_NUMERIC_CHARACTERS = '',.'' ')  
	"Formatted Salary" 
  from employees;

select TO_CHAR(ROUND((salary/7), 2), '99G999D99')  
	"Formatted Salary" 
  from employees;

select ROUND((salary/7), 2) from employees;

--���溯��
--NVL(Դ, Ŀ��) NVL2(Դ, Ŀ��1, Ŀ��2) ת����ֵ null_value
--select last_name, nvl(commission_pct, 0), salary*12+salary*nvl(commission_pct, 0) "annual salary" from employees;
--ת����ֵΪȷ����ֵ�����ڼ�����ʹ��
--NULLIF() �������ڶ��������ʽ���бȽ�, �����β���ͬ����NULL, ��ͬ���ص�һ���ǿ��β�
SELECT first_name, LENGTH(first_name) "expr1", 
       last_name,  LENGTH(last_name)  "expr2",
       NULLIF(LENGTH(first_name), LENGTH(last_name)) result
  FROM employees;
--COALESCE �������ڷ����б��еĵ�һ���ǿձ��ʽ,
/*
**COALESCE (expr1, expr2, ... exprn) 
**�ڸ��﷨�У� 
**expr1 ���ش˱��ʽ���������Ϊ�գ� 
**expr2 ���ش˱��ʽ�������һ�����ʽΪ�գ����˱��ʽ��Ϊ�գ� 
**exprn ���ش˱��ʽ�����ǰ��ı��ʽ��Ϊ�գ� 
**��ע�⣬���б��ʽ�����������ͬ���������͡�
**�����жϱ��ʽ�Ƿ�Ϊ��Ϊ��,�ǿձ���ʾ��ǰ���ʽ,Ϊ�ս�����һ�����ʽ�����ж�ֱ�����
*/
SELECT last_name, employee_id, 
  COALESCE(TO_CHAR(commission_pct), TO_CHAR(manager_id), 'No commission and no manager') 
  FROM employees;
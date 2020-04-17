/*
**Ҫȷ�� SQL ����еĸ��ģ���ʹ�� VERIFY ���
**���� SET VERIFY ON ��ǿ�� SQL Developer ��ʹ��ֵ�滻�������֮����ʾ������ı���
**Ҫ�鿴 VERIFY �����Ӧʹ�� SQL �������еġ�Run Script�����нű�����(F5) ͼ�ꡣ
**SQL Developer ʹ��ֵ�滻�������֮�󣬽��ڡ�Script Output���ű��������ѡ�����ʾ�����ı�����õ�Ƭ����ʾ��  
**�õ�Ƭʾ���� SQL �������ʾ�� EMPLOYEE_ID �е���ֵ��Ȼ����ʾ���
*
**define ���Զ�ȷ��ֵ
*/

--����
--��Сд
select last_name, first_name from employees 
  where lower(last_name)='king' or lower(last_name)= 'king';   --ת��Сд��ĸȻ����Сд��ĸ������Ѱ lower

--lpad rpad
select lpad(salary, 10, '*') from employees;   --������ַ���10λ lpad

--trim
select trim('T' from 'Thursday') from dual;   --��ȥ�ַ�  trim ֻ�ܴ�����ĸ��ʼ��

--replace
select replace('Thursday', 'Th', 'W') from dual;   --�ҵ�Th�ַ��滻ΪW  replace

--concat()�����ַ���
SELECT employee_id, CONCAT(first_name, last_name) NAME,    --concat() ���������ַ� �൱��||
  job_id, LENGTH (last_name),   --length �����ַ�����
  INSTR(last_name, 'a') "Contains 'a'?"   --instr �ж��ַ�'a'��Դ�е�λ��
  FROM   employees
  WHERE  SUBSTR(job_id, 4) = 'REP';
  
--�������� round() 
select round(45.923, 2), round(45.923, 0), round(45.923, -1) from dual;   --��ֵ���뵽ָ����С��λ

--mod()
select last_name, salary, mod(salary, 5000) from employees where job_id like 'AD_%';   --ȡ��������

--���ڵ�Ӧ��
select last_name, hire_date from employees;   --  DD-MM-RR
select last_name, '20'||substr(hire_date, 8, 9) from employees;
select last_name, hire_date from employees where hire_date>'20-9�� -05';

select sysdate from dual;

select last_name, (sysdate-hire_date)/7 as "Have Weeks" from employees;
select last_name, trunc((sysdate-hire_date)/7, 1) as "Have Weeks" from employees;   --trunc ��ȡ��С�������λ

select NEXT_DAY('1-9�� -95', 3) "NEXT DAY" from dual;
alter session set NLS_DATE_LANGUAGE = American;   --�������Ա���
select next_day(sysdate, 'Monday') from dual;   --����ʱ���е���һ����һ
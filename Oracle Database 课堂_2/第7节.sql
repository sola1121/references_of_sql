/* �Ӳ�ѯ */

select last_name, salary from employees
  where salary>(select salary from employees where last_name='Abel');

select last_name, department_id, salary from employees
  where department_id in (select distinct department_id from departments where department_name like 'IT%');
--in ���Ա�ʾһ�Զ�Ĺ�ϵ, �����б��е�����һ����Ա

select last_name, first_name, job_id, salary from employees
  where last_name = 'Taylor';   --����
--select last_name, job_id, salary from employees
--  where job_id = (select job_id from employees where last_name = 'Taylor');  ��������

select last_name, job_id, salary from employees
  where salary=(select min(salary) from employees);   --������͵���, ��Ϻ���Ҳ�Ƿ���һ��ֵ��,����ʹ����Ϻ���
  
select department_name from departments
  where department_id=
  (select department_id from employees where salary = 
  (select min(salary) from employees));

SELECT last_name, job_id, salary FROM   employees
WHERE  job_id in(SELECT job_id FROM   employees WHERE  last_name = 'Taylor')
AND    salary in(SELECT salary FROM   employees WHERE  last_name = 'Taylor');

--having ʹ���麯��
SELECT   department_id, MIN(salary) FROM employees
GROUP BY department_id
HAVING MIN(salary) >(SELECT MIN(salary) FROM employees WHERE department_id = 50);

SELECT   job_id, AVG(salary) FROM employees   ----���Ҿ������ƽ��н���ְ��
GROUP BY job_id
HAVING   AVG(salary) = (SELECT   MIN(AVG(salary)) FROM employees GROUP BY job_id); 

--�����Ӳ�ѯ
--in �����б��е�����һ����Ա
SELECT last_name, salary, department_id FROM employees
   WHERE salary IN (SELECT MIN(salary) FROM employees GROUP BY department_id);


--any ǰ������� =��!=��>��<��<=��>=����ĳ��ֵ���б��е�ÿ��ֵ���ѯ���ص�ÿ��ֵ���бȽϡ�
--    �����ѯû�з����κ��У�����ֵ���Ϊ FALSE��
/*<ANY ��ʾ�������ֵ��  
**>ANY ��ʾ�������ֵ��  
**=ANY ��ͬ�� IN�� 
***/
SELECT employee_id, last_name, job_id, salary FROM employees
  WHERE  salary < ANY(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
  AND    job_id <> 'IT_PROG';



--all ǰ������� =��!=��>��<��<=��>=����ĳ��ֵ���б��е�ÿ��ֵ���ѯ���ص�ÿ��ֵ���бȽϡ�
--    �����ѯû�з����κ��У�����ֵ���Ϊ TRUE
/*>ALL ��ʾ�������ֵ
**<ALL ��ʾС�����ֵ�� 
**NOT ����������� IN��ANY �� ALL �����һ��ʹ�á� 
*/
SELECT employee_id, last_name, job_id, salary FROM employees
  WHERE  salary < ALL(SELECT salary FROM employees WHERE job_id = 'IT_PROG')
  AND    job_id <> 'IT_PROG';

--exists �ڲ�ѯ��ʹ�� EXISTS ���������ѯ���ȡ����ĳЩ���Ƿ��ڱ��д��ڡ�����Ӳ�ѯ���ٷ���һ�У�����ֵ���Ϊ TRUE
SELECT * FROM departments
WHERE NOT EXISTS(SELECT * FROM employees WHERE employees.department_id=departments.department_id);



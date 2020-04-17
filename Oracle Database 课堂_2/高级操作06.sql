--ϵͳ�����ݿ����, ���Բ鿴������
select * from nls_database_parameters;

create table testLength(gender varchar2(2));

insert into testLength values('��');


--�ɶԱȽ��Ӳ�ѯ
/*
��ʾ������Ϊ��John���Ĺ�Ա��ͬһ�����쵼������ͬһ�����й����Ĺ�Ա����ϸ���ϡ�
*/
select employee_id, manager_id, department_id from employees
  where (manager_id, department_id) in (select manager_id, department_id from employees where first_name = 'John')
  and first_name <> 'John';
  
--���ɶԱȽ��Ӳ�ѯ
/*
��ʾ������Ϊ��John���Ĺ�Ա��ͬһ�����쵼������ͬһ�����й����Ĺ�Ա����ϸ���ϡ�
*/
select employee_id, manager_id, department_id from employees
  where manager_id in (select manager_id from employees where first_name = 'John')
  and department_id in (select department_id from employees where first_name = 'John')
  and first_name <> 'John';
  
--case
select employee_id, last_name,
(case when department_id =
                          (select department_id from departments where location_id = 1800)
      then 'Canada' 
      else 'USA' END) location
from employees;

--order by
select employee_id, last_name from employees e
  order by (select department_name from departments d
  where e.department_id = d.department_id);

--ʹ������Ӳ�ѯ
/*
������н��������ڲ��ŵ�ƽ��н������й�Ա
�е�������������
*/
select last_name, salary, department_id from employees outer_table 
  where salary > (select avg(salary) from employees inner_table
  where inner_table.department_id = outer_table.department_id);
/*
��ʾ���ٵ���������ְ�����Щ��Ա����ϸ����
*/
select e.employee_id, last_name,e.job_id from employees e
  where 2 <= (select count(*) from job_history where employee_id = e.employee_id);
  
select department_name from departments d
  where 8000< all (select salary from employees where department_id=d.department_id);   --all

select department_name from departments d
  where 8000< any (select salary from employees where department_id=d.department_id);   --any
  



/*
EXISTS ����������������Ӳ�ѯ�Ľ�������Ƿ�����й��С�
? ����ҵ����Ӳ�ѯ��ֵ��
�C �����ڲ���ѯ�м�����������
�C ����������Ϊ TRUE
? ���δ�ҵ��Ӳ�ѯ��ֵ��
�C ����������Ϊ FALSE
�C ���ڲ���ѯ�м�����������
*/

select employee_id, last_name, job_id, department_id from employees e1
  where exists (select 'X' from employees e2 where e2.manager_id = e1.employee_id);

--����û���κι�Ա�����в���  
select department_id, department_name from departments d
  where not exists ( select 'X' from employees where department_id = d.department_id);

--update
UPDATE table1 alias1
SET column = (SELECT expression from table2 alias2
              WHERE alias1.column = alias2.column);

--delete
ALTER TABLE empl6
  ADD(department_name VARCHAR2(25));

UPDATE empl6 e
  SET department_name = (SELECT department_name FROM departments d
                          WHERE e.department_id = d.department_id);
                          
--ʹ�����delete
DELETE FROM empl6 E
  WHERE employee_id =(SELECT employee_id FROM emp_history
                       WHERE employee_id = E.employee_id);

/*
WITH �Ӿ�
? ���ĳ����ѯ����һ�����Ӳ�ѯ�ڶ�γ��֣���ʹ��
WITH �Ӿ�ʱ������ SELECT �����ʹ��ͬһ��ѯ�顣
? WITH �Ӿ�������ѯ��Ľ������������洢���û�
��ʱ��ռ��С�
? WITH �Ӿ����������ܡ�
*/

--ʹ�� WITH �Ӿ��дһ����ѯ����ʾн���ܶ���ڸ�������ƽ��н��Ĳ��ŵĲ������ƺ�н���ܶ
WITH dept_costs AS (
  SELECT d.department_name, SUM(e.salary) AS dept_total FROM employees e 
  JOIN departments d ON e.department_id = d.department_id
  GROUP BY d.department_name),
  avg_cost AS (
        SELECT SUM(dept_total)/COUNT(*) AS dept_avg FROM dept_costs)
  SELECT * FROM dept_costs
  WHERE dept_total >
  (SELECT dept_avg FROM avg_cost)
  ORDER BY department_name;


/* ������� */
/*
**��Ȼ���ӣ� 
**  NATURAL JOIN �Ӿ� 
**  USING �Ӿ� 
**  ON �Ӿ� 
**OUTER ���ӣ� 
**  LEFT OUTER JOIN 
**  RIGHT OUTER JOIN 
**  FULL OUTER JOIN 
�������� 
*/

--natural join
select department_id, department_name, location_id, city from departments
  natural join locations
  where department_id >=100;
  
--join using()  ָ���������������
select employee_id, last_name, department_id, location_id from employees 
  join departments using (department_id);

select l.city, d.department_name from locations l
  join departments d using (location_id)    --ʹ�ñ���, ���ܶ�using�Ӿ��е��м����޶�
  where location_id=1400;   --location_id��using���Ӿ�,������l.location_id��d.location_id �������޶�

--join on  �Ӿ��ָ������������ָ��Ҫ���ӵ���
select e.employee_id, e.last_name, d.department_id, d.location_id from employees e
  join departments d on d.department_id=d.department_id;   --������ָ����ѯ���������ı�,��Ȼ����ʹ�ñ���

select employee_id, last_name, department_name, city from employees e
  join departments d on e.department_id = d.department_id
  join locations l on l.location_id = d.location_id;   --��������

--and �� where ���Ӹ�������
select e.last_name, d.department_name, location_id, l.city from employees e  --location_id ���ܼ�l.location_id
  join departments d using (department_id)
  join locations l using (location_id)
  where l.city like 'O%';
  
--������  �������ӵ�����
select worker.last_name Worker, manager.last_name Manager from employees worker
  join employees manager on worker.employee_id=manager.manager_id;    --��ʾԱ����Ӧ�Ĺ�����

--�ǵ�ֵ����
select e.last_name, e.salary, e.job_id, g.grade_level from employees e
  join job_grades g on e.salary between lowest_sal and g.highest_sal;
  
--ʹ��outer ���ӷ���û��ֱ��ƥ��ļ�¼
--LEFT OUTER JOIN �˲�ѯ������ EMPLOYEES ����������е������У���ʹ DEPARTMENTS ����û��ƥ����Ҳ����ˡ� 
--RIGHT OUTER JOIN �˲�ѯ������ DEPARTMENTS �������ұ��е������У���ʹ EMPLOYEES ����û��ƥ����Ҳ����ˡ�
--FULL OUTER JOIN ȫ����
select e.last_name, d.department_id from employees e
  join departments d on e.department_id=d.department_id;   --��Ȼ����
  
select e.last_name, d.department_id from employees e
  left outer join departments d on e.department_id=d.department_id;   --��������, ��department_idΪ�յ�Ҳ��ʾ��

select e.last_name, d.department_id, d.department_name from employees e
  right outer join departments d on e.department_id=d.department_id;   --��������
  
select e.last_name, d.department_id, d.department_name from employees e
  full outer join departments d on e.department_id=d.department_id;    --ȫ����

--INNER JOIN �ڱ��д�������һ��ƥ��ʱ��INNER JOIN �ؼ��ַ�����
  
--�ѿ�����
/**��ʱ����ʾ�е��������
****�������������� 
****����������Ч 
****��һ�����е������б����ӵ��ڶ������е�������,�������е����е���Ͽ���
���Ҫ�������ɵѿ���������ʼ�հ�����Ч����������
*/
--CROSS JOIN �Ӿ������������Ĳ��������������(�ѿ�����)
SELECT last_name, department_name FROM employees 
CROSS JOIN departments;






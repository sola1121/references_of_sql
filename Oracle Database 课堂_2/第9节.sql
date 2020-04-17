/*
** insert into ������ı�( ��˳���ŵ��� ) values ( ��˳���е�˳�������ֵ );  ֻ�ܲ���һ��
** insert into ������ı�( ��˳���ĵ��� ) �Ӳ�ѯ��� ;   ������Ӳ�ѯ����˳��ҲӦ�ú�ǰ�������˳����ͬ, �ɲ������
*/

--insert into ... values ...  ֻ�ܲ���һ��
desc employees;
insert into employees(employee_id, last_name, email, hire_date, job_id)
values (208, 'TestName', 'Test@yahoo.com', '06-7�� -2017', 'AD_VP');

delete from employees where employee_id=208;

desc departments;
insert into departments
values ('300', 'Test_Service', null, null);

delete from departments where department_id=300;

--insert into ... values ... ���ú���
insert into employees(employee_id, last_name, email, hire_date, job_id)
values (208, 'TestName', 'Test@yahoo.com', sysdate, 'AD_VP');

delete from employees where employee_id=208;

insert into employees
values (208,'DenRaphealy', 'DRAPHEAL', 'QQ@QQ', '515.127.4561', 
        TO_DATE('2�� 3, 1999', 'MON DD, YYYY'),   --ʹ��to_char����ת��Ϊ��ȷ����
        'SA_REP', 11000, 0.2, 100, 60); 

delete from employees where employee_id = 208;

desc employees;

insert into departments (department_id, department_name, manager_id, location_id)
values (&depart_id, '&depart_name', null, null);  -- & ��Ҫ�ֶ������

delete from departments where department_id=300;

--������һ�� sales_reps ��
desc SALES_REP;
--��д�����Ӳ�ѯ�� INSERT ���  inset into ... �Ӳ�ѯ���
INSERT INTO sales_reps(employee_id, last_name, salary, commission_pct) 
  SELECT employee_id, last_name, salary, commission_pct FROM employees 
  WHERE job_id LIKE '%REP%'; 

delete from sales_rep;

INSERT INTO sales_reps(employee_id, last_name, salary, commission_pct, options) 
  SELECT employee_id, last_name, salary, commission_pct, salary*0.05 FROM employees 
  WHERE  job_id LIKE '%REP%'; 


--update set ... where..
update sales_reps
set options = 999
where salary>10000;

--update set ..�Ӳ�ѯ where ..�Ӳ�ѯ
update set job_id = (select job_id from employees where employee_id = 205),
           salary = (select salary from employees where employee_id=205)   --�Ӳ�ѯ��������
                  where employee_id =103;
                  
UPDATE  copy_emp 
SET     department_id  =  (SELECT department_id 
                           FROM employees 
                           WHERE employee_id = 100) 
WHERE   job_id         =  (SELECT job_id 
                           FROM employees 
                           WHERE employee_id = 200); --������һ���������

--delete from ... where ...   ����������ɾ�����е���

--TRUNCATE table ���ݶ������� �ӱ���ɾ�������У�ʹ��Ϊ�ղ�������ṹ���� 

/*
�ύ
commit


���ݿ�ʧ����

�ع�rollback
savepoint xxx;
...
rollback xxx;   rollback to savepoint xxx;
��commitδ�ύ֮ǰ, ���Զ��Ѿ�������delete alter update�������лع�

����:
DELETE FROM test; 
25,000 rows deleted. 
 
ROLLBACK; 
Rollback complete. 
 
DELETE FROM test WHERE  id = 100; 
1 row deleted. 
 
SELECT * FROM   test WHERE  id = 100; 
No rows selected. 
 
COMMIT; 
Commit complete. 

*/

--select ����е� for update   ��ֹ���Ĳ���ֱ�����������commit,rollback
desc job_history;

--union  ���ϵĲ�����
select employee_id, job_id from employees
union
select employee_id, job_id from job_history;   --���Զ�ȥ���ظ���

select employee_id, job_id from employees
union all
select employee_id, job_id from job_history;   --����ȥ���ظ���

--intersect ѡ�񽻼�, �������������ѡ�����о�����ֵͬ����Щ��¼
select employee_id, job_id from employees
intersect
select employee_id, job_id from job_history;

--minus �����ɵ�һ����ѯѡ���ĵ�û�г����ڵڶ�����ѯ������е����в�ͬ�У���һ��SELECT����ȥ�ڶ���SELECT��䣩
select employee_id, job_id from employees
minus
select employee_id, job_id from job_history;   --����˾û�л���ְλ��Ա��

/*select employee_id, last_name, job_id from employees
where employee_id*/

select location_id, department_name, to_char(NULL) from departments
union
select location_id, to_char(NULL), state_province from locations;
--to_char ������û�����ݵĶ�Ӧ����ת��Ϊ��ֵ��ʾ

select employee_id, job_id, salary from employees
union
select employee_id, job_id, 0 from job_history;   --���ж���û�����ݵ���ֵ��ֱ����һ�����Ϳ����滻��


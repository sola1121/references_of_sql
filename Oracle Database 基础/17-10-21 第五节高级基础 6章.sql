--�ɶԱȽ��Ӳ�ѯ
select employee_id, manager_id, department_id from employees
where (manager_id, department_id) in (select manager_id, department_id from employees where first_name = 'John')
and first_name <> 'John';

--���ɶԱȽ�
select employee_id, manager_id, department_id from employees
where manager_id in (select manager_id from employees where first_name = 'John')
and department_id in (select department_id from employees where first_name = 'John')
and first_name <> 'John';

--�����Ӳ�ѯ
select employee_id, last_name,
  (case when department_id = (select department_id from departments where location_id = 1800) then 'Canada'   --�Ӳ�ѯδ����һ��ֵʹ��in
   else 'USA'
   end)  "location"
  from employees;
  
select employee_id, last_name from employees e
order by (select department_name from departments d where e.department_id = d.department_id);

select employee_id, last_name from employees e
join departments using(department_id)
order by department_name;   --����������ͬ,����Ϊ��ʹ�õ��ǵ�ֵ����

--����Ӳ�ѯ, �����и��ڲ���ƽ�����ʵ�Ա��
select employee_id, last_name, salary, department_id from employees outer_table
where salary > (select avg(salary) from employees inner_table where outer_table.department_id = inner_table.department_id);   --�����ⲿ��

select employee_id, last_name, job_id from employees e
where 2 <= (select count(*) from job_history j where j.employee_id = e.employee_id);
desc employees;

--exists, ��ѯ�����Ƿ�����й���
select employee_id, last_name, job_id, department_id from employees e
where exists (select 1 from employees where manager_id = e.employee_id);
--not exists
select department_id, department_name from departments d
where not exists (select 233 from employees where department_id = d.department_id);

select department_id, department_name from departments
minus
select department_id, department_name from employees
join departments using(department_id);

--���update
update emp set department_name = (select dapartment_name from departments where department_id = emp.department_id);  --���²�������

--���delete
delete from emp out_table where exists (select 1 from job_history where employee_id = out_table.employee_id);

--with, �൱��һ����ʱ��, �������
with
dept_sum as(
  select d.department_name, sum(nvl(e.salary, 0)) as total_sal from employees e
  join departments d using(department_id)
  group by department_name
  ),
avg_sum as(
  select avg(total_sal) as avg_sum from dept_sum
  )
select * from dept_sum
where total_sal > (select avg_sum from avg_sum)
order by department_name;

--�ݹ�with
select e.department_id, d.department_id from employees e, departments d;



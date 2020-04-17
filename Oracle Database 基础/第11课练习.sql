--1
create view employee_vu
as
select employee_id, last_name as employee, department_id from employees;

--2
select * from employee_vu;

--3
select employee, department_id from employee_vu;

--4
create or replace view dept50(empno, employee, deptno)
as 
select employee_id, last_name, department_id from employees
where department_id = 50
with check option constraint dept50_view;

--5
desc dept50;
select * from dept50;

--6
update  dept50 set deptno = 80 where lower(employee) = 'matos';

--7
create sequence dept_id_sqe
  start with 200
  increment by 10
  maxvalue 1000;

--8
insert into dept
values(dept_id_sqe.nextval, 'Education');
insert into dept 
values(dept_id_sqe.nextval, 'administration');

--9
create index dept_mame_index on dept(name);

--10
create synonym emp for employees;

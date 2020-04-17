--1
create table hr.Dept(
  id number(7) primary key,
  name varchar2(25)
  );

--2
insert into dept(id, name)
select department_id, department_name from departments;

--3
create table hr.emp1(
  id number(7),
  last_name varchar2(25),
  first_name varchar2(25),
  dept_id number(7),
  constraint fk_emp_dept_id foreign key (dept_id) references dept(id)
  );
  
--4
create table hr.employees2(id, first_name, last_name, salary, dept_id)
as
select employee_id, first_name, last_name, salary, department_id from employees where 1=2;

--5
alter table employees2 read only;

--6
insert into employees2(id, first_name, last_name, salary, dept_id)
values(34, 'Grant', 'Marcie', 5678, 10);

--7
alter table employees2 read write;
insert into employees2(id, first_name, last_name, salary, dept_id)
values(34, 'Grant', 'Marcie', 5678, 10);

--8
drop table employees2;
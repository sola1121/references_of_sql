--1
create table sal_history(
  employee_id number(6),
  hire_date date,
  salary number(8, 2)
  );
  
--2
desc sal_history;

--3
create table mgr_history(
  employee_id number(6),
  manager_id number(6),
  salary number(8, 2)
  );
  
--4
desc mgr_history;

--5
create table special_sal(
  employee_id number(6),
  salary number(6)
  );

--6
desc special_sal;

alter table special_sal
modify(salary number(8,2));

--7
--a
select employee_id, hire_date, salary, manager_id from employees
where employee_id < 125;

insert into special_sal(employee_id, salary)
select employee_id, salary from employees where salary > 20000;

insert into sal_history(employee_id, hire_date, salary)
select employee_id, hire_date, salary from employees;

insert into mgr_history(employee_id, manager_id, salary)
select employee_id, manager_id, salary from employees;
--b
select * from special_sal;
--c
select * from sal_history;
--d
select * from mgr_history;

--8--9--10--11


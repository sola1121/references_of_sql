--1
create table dept2(
  id number(7),
  name varchar2(25)
  );
  
--2
insert into dept2(id, name)
select department_id, department_name from departments;

drop table dept2;

--3
create table emp2(
  id number(7),
  last_name varchar(25),
  first_name varchar(25),
  dept_id number(7)
  );

--4
alter table emp2
modify(last_name varchar2(50));

desc emp2;

--5
create table employees2(id, first_name, last_name, salary, dept_id)
as 
select department_id, first_name, last_name, salary, department_id from employees;

--6
drop table emp2;

--7
select * from recyclebin;

--8
flashback table emp2 to before drop;

--9
alter table employees2
drop column first_name;

desc employees2;

--10
alter table employees2 set unused (dept_id);

desc employees2;

--11
alter table employees2
drop unused column;

desc employees2;

--12
alter table emp2
modify id constraint my_emp_id_pk  primary key;

--13
alter table dept2
modify id constraint my_dept_id_pk primary key;

--14
alter table emp2
add constraint my_emp_dept_id_fk foreign key(dept_id) references dept2(id);

--15
alter table emp2
add commission number(2,2) constraint emp_comm_check check(commission>0);

--16
drop table emp2 purge;
drop table dept2 purge;

select * from recyclebin;

--17
create table dept_named_index(
  deptno number(4) primary key using index (create index dept_pk_idx on dept_named_index(deptno)),
  dname varchar2(30)
);

--18
create directory emp_dir as 'D:\ocp3°à\';

CREATE TABLE library_items_ext ( category_id number(12)
, book_id number(6)
, book_price number(8,2)
, quantity number(8)
)
ORGANIZATION EXTERNAL
(TYPE ORACLE_LOADER
DEFAULT DIRECTORY emp_dir
ACCESS PARAMETERS (RECORDS DELIMITED BY NEWLINE
FIELDS TERMINATED BY ',')
LOCATION ('library_items.dat')
)
REJECT LIMIT UNLIMITED;

select * from library_items_ext;

--19
CREATE TABLE dept_add_ext (location_id,
street_address, city,
state_province,
country_name)
ORGANIZATION EXTERNAL(
TYPE ORACLE_DATAPUMP
DEFAULT DIRECTORY emp_dir
LOCATION ('oraxx_emp4.exp','oraxx_emp5.exp'))
PARALLEL
AS
SELECT location_id, street_address, city, state_province,
country_name
FROM locations
NATURAL JOIN countries;

SELECT * FROM dept_add_ext;

--20





savepoint init;
--1
create table MY_EMPLOYEE(
  id number(4) not null, 
  last_name varchar2(25), 
  first_name varchar2(25), 
  userid varchar2(8), 
  salary number(9, 2)
  );

--2
desc my_employee;

--3
insert into my_employee
values (1, 'Patel', 'Ralph', 'rpatal', 895);

--4
insert into may_employee(id, last_name, first_name, userid, salary)
values (2, 'Dancs', 'Betty', 'bdancs', 860);

--5
select * from my_employee;

--6--7
insert into may_employee(id, last_name, first_name, userid, salary)
values (&id, '&last_name', '&first_name', '&userid', &salary);

--8
select * from my_employee;

--9
commit;

--10
update my_employee set last_name='Drexler' where id =3;

--11
update my_employee set salary = 1000 where salary < 900;

--12
select * from my_employee;

--13
delete my_employee where lower(last_name) = 'betty' and lower(first_name) = 'dancs';

--14
select * from my_employee;

--15
commit;

--16
insert into may_employee(id, last_name, first_name, userid, salary)
values (&id, '&last_name', '&first_name', '&userid', &salary);

--17
select * from my_employee;

--18
delete my_employee;

--19
select * from my_employee;

--20
rollback;

--21
select * from my_employee;

--22
commit;

--23--25
define f_name=&f_name
define l_name=&l_name
define u_id=substr(str(f_name), 1, 7)||substr(str(l_name), 1, 1)
insert into my_employee(id, last_name, first_name, userid, salary)
values (&id, '&f_name', '&l_name', '&u_id', &salary);
undefine f_name
undefine l_name
undefine u_id;

SET ECHO OFF
SET VERIFY OFF
INSERT INTO my_employee
VALUES (&p_id, '&&p_last_name', '&&p_first_name',
lower(substr('&p_first_name', 1, 1) ||
substr('&p_last_name', 1, 7)), &p_salary);
SET VERIFY ON
SET ECHO ON
UNDEFINE p_first_name
UNDEFINE p_last_name;

--26
select * from my_employee;

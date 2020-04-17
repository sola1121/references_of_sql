--1
/*create session 系统权限*/

--2
/*create table*/

--3
/*DBA, 创建者账户, 被赋予相应权限的用户*/

--4
/*使用角色*/

--5
/*alter user...identified by...*/

--6
/*user21, 会级联删除*/

--7
grant update on departments to scott with grant option;

--8
grant select on ora21.ragions to ora22 with grant option;
grant select on ora21.regions to ora23;
revoke select on ora21.regions from ora21;

--9
grant select, insert, update on countries to ora22;

--10
revoke select, insert, update on countries from ora22;

--11
grant select on ora21.departments to ora22;
grant select on ora22.departments to ora21;

--12
select * from departments;

--13
insert into ora21.departments(department_id, department_name) values(500, 'Education');
insert into ora22.departments(department_id, department_name) values(510, 'Human Resorce');
select * from ora21.departments;
select * from ora22.departments;

--14
grant create synonym on departments to ora21;
create synonym dept for ora22.departments; 

--15
select * from ora22.dept;

--16
revoke select on departments from ora22;

--17
delete from ora21.departments where department_id = 500;
delete from ora22.departments where department_id = 510;







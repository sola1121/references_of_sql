--DDL
--DBA可以通过create user 创建用户
create user leimilia identified by 1121;

--DBA赋予用户权限
grant create session, create table, create view, create sequence to leimilia;

--创建角色,定义岗位职责
create role manager;   --创建角色
grant create table, create view to manager;  --赋予角色权限
create user alice identified by 1121;   --新建用户
grant manager to alice;    --为用户赋予角色

--更改用户密码
alter user alice identified by alice_123;

--对象权限有 表,视图,序列
--赋予对象授权
grant select on hr.employees to alice;
grant update(department_id, department_name) on hr.department to alice;

--传递权限
grant select on hr.employees to alice with grant option;  --赋予对象可以传递自己权限的权限

grant select on hr.employees to public;  --赋予所有人

--撤销对象权限   casecade constraint 级联撤回用户权限
--revoke 被撤销的权限集 on 所在表 from 用户集;
revoke select, insert on hr.department form alice;

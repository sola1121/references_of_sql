

/* 控制用户访问 */

/*
数据库安全性
  系统安全性
  数据安全性
系统权限: 在数据库中执行特定的操作
对象权限: 处理数据库对象的内容
方案: 诸如表, 视图和序列等对象的集合

系统权限
可用的系统权限超过个
数据库管理员: 创建用户, 删除用户, 删除任意表, ...

--创建与修改用户
create user 用户名 identified by 密码;

alter user 用户名 identified by 新密码;

conn 用户名;    连接更换登陆用户

show user;   显示当前用户

*/

/* 

用户系统权限

grant privilege [,privilege...] to user [,user | role, PUBLIC];   public表示所有用户都哟这样的权限

--常用权限
create session   //连接数据库权限
create table
create sequence
create view
create procedure

系统权限

*/

/*
创建角色 role
就是一个权限集

--创建角色
create role manager;   manager是角色名

grant manager to 用户名;   将manager角色中有的权限给予用户

*/


/* 对象权限

对象有:
alter
delete
index 
insert
references
select
update


--授予对象权限
? 对象权限因对象而异。
? 所有者拥有对象的全部权限。
? 所有者可将自己对象的特定权限授予其他用户。

grant select on hr.employees to 用户名;    将使用select访问hr.employees表的权限给用户名

grant update(department_name, location_id)
on hr.departments
to 用户名, manager;      --将更改hr.departments表两列的权限给予用户名 和 role(角色)

--传递权限
grant select, insert
on hr.departments
to 用户名
with grant option;



*/
create user demo identified by demo;

grant create session , create table to demo;

grant select 
on HR.departments
to demo
with grant option;

create user alice identeified by alice;
grant create session to alice;

conn demo/demo;   --连接用户, 用户名/密码

grant select 
on hr.departments
to alice;

conn alice/alice;

select * from hr.departments;


/* 撤销对象权限 

--Revoke

revoke all 
on departments 
from 用户名;    --收回用户名在 departments上的所有权限

revoke all 
on departments 
from 用户名
cascade constraints;   --级联, 通过用户名所给予的在department上的权限全收回

*/

revoke all 
on hr.departments 
from demo
cascade constraints;

conn Alice/alice;

select * from hr.departments;
--//error : table or view not excited


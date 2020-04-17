
#####################本周作业###########################
1、创建pl/sql对象
###创建函数
CREATE OR REPLACE FUNCTION compute_tax(salary IN NUMBER) 
   RETURN NUMBER 
   IS tax NUMBER(11,2);
   BEGIN 
      if salary<5000 then
         tax:=salary*0.15;
         return tax;
      else 
         tax:=salary*0.33;
         return tax;
      end if;
    END;
/

###调用函数 scott用户
select empno,sal,compute_tax(sal) from emp;

###创建存储过程
CREATE OR REPLACE PROCEDURE give_raise_to_all
   AS
   BEGIN
   update emp set sal=sal*1.05;  
   commit;  
   END;
/

###调用过程 scott用户
exec give_raise_to_all();

###创建包
CREATE OR REPLACE PACKAGE money AS 
   FUNCTION compute_tax(salary NUMBER) 
      RETURN NUMBER; 
   PROCEDURE give_raise_to_id(empno NUMBER); 
END money; 
/ 


CREATE OR REPLACE PACKAGE BODY money AS 
FUNCTION compute_tax(salary IN NUMBER) 
   RETURN NUMBER 
   IS tax NUMBER(11,2);
   BEGIN 
      if salary<5000 then
         tax:=salary*0.15;
         return tax;
      else 
         tax:=salary*0.33;
         return tax;
      end if;
    END;

PROCEDURE give_raise_to_id (empno NUMBER) AS
   BEGIN
   update emp set sal=sal*1.05 where empno=empno;    
   commit;
   END;
END money; 
/ 

###调用包的函数及存储过程  scott用户
select empno,sal,money.compute_tax(sal) from emp;
exec money.give_raise_to_id(7369);


2、构造锁争用的实验

###会话1  scott用户

update emp set sal=2000 where empno=7369;

####会话2  scott用户  
update emp set sal=2000 where empno=7369;

###查询锁冲突的会话信息

select sid,serial#,event,blocking_session from v$session where blocking_session is not null;

###解决锁冲突的办法
方法一：commit or rollback 事物1
方法二：alter system kill session 'sid,serial#';
方法三：kill -9 ？  ### ？＝操作系统进程 
select spid from v$session a ,v$process b where a.paddr=b.addr and a.sid=? ### ？＝blocking_session的值

3、查看undo相关的参数
show parameter undo_;
###查看undo使用情况
select sum(activeblks) ,sum(unexpiredblks),sum(expiredblks) from v$undostat;

4、配置连接白名单 
### 配置连接白名单的参数
vi sqlnet.ora
TCP.VALIDNODE_CHECKING=yes
TCP.INVITED_NODES=(虚拟机ip,本地ip)

###重启监听使其配置生效

lsnrctl stop ;
lsnrctl start;
####测试
添加客户机ip和删除其ip，分别用sqlDeveloper工具连接数据库

5、创建awr报告
###sys用户登录数据库
@?/rdbms/admin/awrrpt.sql

6、创建addm报告
###sys用户登录数据库
@?/rdbms/admin/addmrpt.sql

7、查看当前和历史预警信息
###查看预警阀值
select metrics_name,warning_value,critical_value,object_type from dba_thresholds;
###当前
select * from dba_outstanding_alerts;
###历史
select * from dba_alert_history;

8、开启数据库审计 sys用户执行
###############审计系统权限
audit drop any  table by scott;
##禁用审计
noaudit drop any table by scott;

#####审计对象权限
audit select on scott.emp  by session;
###禁用审计
noaudit select on scott.emp;

##查看审计信息
select count(1) from dba_audit_trail;

#########基于值的审计

##创建存放基于值的审计数据
create table scott.audit_employees
(
  os_user varchar2(20),
  m_date date,
  ip_address varchar2(20),
  detail varchar2(50)
)

## 创建触发器
 CREATE OR REPLACE TRIGGER scott.scott_salary_audit
 AFTER UPDATE OF sal ON scott.emp
 FOR EACH ROW 
 BEGIN
  IF :old.sal != :new.sal THEN
    INSERT INTO scott.audit_employees VALUES (sys_context('userenv','os_user'),SYSDATE,sys_context('userenv','ip_address'),
    ' ' || :new.empno || ' salary changed from '  || :old.sal || '  to ' || :new.sal || ' ' );
  END IF;
 END;
 /

 
##############fga审计
###行级定义：
BEGIN
 dbms_fga.add_policy(
 object_schema=>'scott',
 object_name=>'emp',
 policy_name => 'AUDIT_EMPS',
 audit_condition => 'deptno=10',
 enable => TRUE,
 statement_types => 'SELECT,UPDATE' 
);
END;
/

###列级定义：
BEGIN
  dbms_fga.add_policy(
  object_schema=>'scott',
  object_name=>'emp',
  policy_name => 'audit_emps_salary',
  audit_column => 'SAl',
  enable => TRUE,
  statement_types => 'SELECT'
);
END;
/
####删除fga审计策略
exec dbms_fga.drop_policy('scott','emp','AUDIT_EMPS');
exec dbms_fga.drop_policy('scott','emp','audit_emps_salary');

####检查fga审计信息
select count(1) from dba_fga_audit_trail;

######强制审计
查询审计存放路径：show parameter audit_file_dest;
##############################审计####################################

9、数据库性能维护

#####查看数据库amm,asmm管理的参数
show parameter memory_target;
show parameter sga;
show parameter pga;

####查看表统计信息
create table scott.test as select * from dba_objects;
create index soctt.ind_test_id on scott.test(object_id);
select owner,table_name,num_rows,last_analyzed from dba_tables where table_name='TEST';

####手工收集统计信息

exec dbms_stats.gather_table_stats('SCOTT','TEST');

####查看sql执行计划 scott用户

@?/sqlplus/admin/plustrce.sql

set linesize 900
set pagesize 900
set autotrace traceonly

select object_id,object_name from test where object_id=30;

10、将数据库设置为归档模式


###创建存放归档的文件
mkdir -p $ORACLE_BASE/arch
###设置归档存放路径
alter system set log_archive_dest_1='location=/u01/app/oracle/arch' scope=spfile;
###关闭数据库
shutdown immediate;
###启动数据库到mount；
startup mount;
####配置数据库为归档模式
alter database archivelog;
###打开数据库
alter database open；
###查看数据库是否开启规定
方法一：archive log list;
方法二：select log_mode from v$database;
###执行日志切换
alter system switch logfile;
###在$ORACLE_BASE/arch中查看归档文件是否生成
ls -lrt 









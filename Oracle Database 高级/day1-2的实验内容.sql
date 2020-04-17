
作业：
1、下次上课时，每人必须有crt、官方文档、网络。

2、练习vi的命令。

3、配置默认监听为静态监听和创建1526端口的监听

   其中host需修改成自己虚拟机的ip；global_dbname、sid_name需要修改成自己的数据库名；oracle_home需要修改成oracle数据库的路径＝echo $ORACLE_HOME

   a、修改grid用户下的监听配置文件（listener.ora）
       LISTENER=
        (DESCRIPTION=
          (ADDRESS_LIST=
            (ADDRESS=(PROTOCOL=tcp)(HOST=172.16.237.101)(PORT=1521))
            (ADDRESS=(PROTOCOL=ipc)(KEY=extproc))))

       SNR2=
        (DESCRIPTION=
          (ADDRESS_LIST=
            (ADDRESS=(PROTOCOL=tcp)(HOST=172.16.237.101)(PORT=1526))
            (ADDRESS=(PROTOCOL=ipc)(KEY=extproc1))))


       SID_LIST_LISTENER=
        (SID_LIST=
          (SID_DESC=
            (GLOBAL_DBNAME=DB11G)
            (ORACLE_HOME=/u01/app/oracle/product/11.2)
            (SID_NAME=DB11G))
        (SID_DESC=
            (GLOBAL_DBNAME=+ASM)
            (ORACLE_HOME=/u01/app/11.2/grid)
            (SID_NAME=+ASM))
          (SID_DESC=
            (SID_NAME=plsextproc)
            (ORACLE_HOME=/u01/app/oracle/product/11.2)
            (PROGRAM=extproc)))

    b、修改oracle用户下的tnsnames.ora文件
       DB11G =
         (DESCRIPTION =
           (ADDRESS_LIST =
             (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.237.101)(PORT = 1521))
           )
           (CONNECT_DATA =
             (SERVICE_NAME = DB11G)
           )
         )
       
       LSNR2 =
          (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.237.101)(port = 1526))
       
       DB11G_S =
         (DESCRIPTION =
           (ADDRESS_LIST =
             (ADDRESS = (PROTOCOL = TCP)(HOST = 172.16.237.101)(PORT = 1526))
           )
           (CONNECT_DATA =
             (SERVICE_NAME = DB11G)
             (SERVER = SHARED)
           )
         )
       
       ##配置连接故障转移
       DB11G_FS=
        (DESCRIPTION=
          (ADDRESS=(PROTOCOL=tcp)(HOST=172.16.237.101)(PORT=1521))
          (ADDRESS=(PROTOCOL=tcp)(HOST=172.16.237.101)(PORT=1526))
          (FAILOVER=ON)
          (CONNECT_DATA=
            (SERVICE_NAME=DB11G)))
       
    c、oracle用户下使用sys用户登录设置shared服务器连接参数  
       sqlplus / as sysdba
       alter system set shared_servers = 10;
       alter system set max_shared_servers = 30;
       alter system set dispatchers = '(protocol=tcp)(dispatchers=3)','(protocol=tcps)(dispatchers=2)';
       alter system set max_dispatchers = 10;
       alter system set shared_server_sessions = 200;
       shutdown immediate
       startup
       alter system register;

    d、grid 用户下重启监听listner和lsnr2
       lsnrctl restart  ##重启默认监听
       lsnrctl restart lsnr2  ##重启lsnr2监听

    e、测试（使用不同的服务名连接到数据库）
        分别在不同的窗口中执行以下命令
       sqlplus scott/oracle@DB11G
       sqlplus hr/oracle@DB11G_S
       sqlplus sysem/oracle@DB11G_FS  ###测试关闭默认监听后是否能连接到数据库

       sqlplus / as sysdba ＃在新的窗口中执行该命令
       select sid,username,server from v$session where username in ('SCOTT','HR','SYSTEM');
4、新建u_ocp用户、设置scott、hr的密码并对用户进行解锁
    create user u_ocp identified by oracle; ###创建u_ocp用户
    alter user scott identified by oracle account unlock;  ###修改scott用户的密码并解锁
    alter user hr identified by oracle account unlock;  ###修改hr用户的密码并解锁
5、创建u_ocp角色，该角色具备scott.emp和scott.dept的查询和修改权限权限
   create role r_ocp;
   grant select,update on scott.emp to r_ocp; ##赋权
   grant select,update on scott.dept to r_ocp##赋权

   select role,owner,table_name,privilege from role_tab_privs where role='R_OCP' ###查询r_ocp角色的权限

   revoke select on scott.dept from r_ocp;###回收scott.dept表上的查询权限
   select role,owner,table_name,privilege from role_tab_privs where role='R_OCP' ###查询r_ocp角色的权限

   grant r_ocp to u_ocp;  ###把r_ocp角色赋给u_ocp用户
   grant connect,resource to u_ocp;  ###把connect、resource角色赋给u_ocp用户
   select grantee,granted_role from dba_role_privs where grantee='U_OCP';  ### 查询用户拥有哪些角色
   select grantee,owner,table_name,grantor,privilege from dba_tab_privs where grantee='u_ocp';  ##查询用户拥有哪些对象权限
6、创建表空间t_ocp并设置为u_ocp默认表空间
   create tablespace t_ocp datafile '+data' size 200m;  ###创建表空间
   SELECT TABLESPACE_NAME,FILE_NAME,BYTES/1024/1024 TOTAL_MB from dba_data_files;  ###查询表空间的数据文件的大小
   ALTER USER U_OCP DEFAULT TABLESPACE T_OCP QUOTA UNLIMITED ON T_OCP; ###把t_ocp表空间设置为u_ocp用户的默认表空间
   SELECT USERNAME,ACCOUNT_STATUS,DEFAULT_TABLESPACE FROM DBA_USERS WHERE USERNAME='U_OCP';  ### 查询用户的信息
7、了解口令概要文件的创建和配置
   了解执行<oracle_home>/rdbms/admin/utlpwdmg.sql 文件后的影响



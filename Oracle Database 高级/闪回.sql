确保数据库处于归档模式，如果为非归档模式，将数据库转换成归档模式
SQL> archive log list;
查询结果:
数据库日志模式            存档模式
自动存档             启用
存档终点            /cwarch
最早的联机日志序列     1274
下一个存档日志序列   1276
当前日志序列           1276

##闪回删除  回收站
前提条件  recyclebin＝on
flashback table fb_test to before drop [rename to <>];
flashback table fb_test to before drop ;

###删除回收站的对象
purget recyclebin/tablespace/table;


select object_name,ORIGINAL_NAME,OPERATION,type,ts_name,droptime from user_recyclebin;
###回收站默认为打开

show parameter recyclebin;

##闪回查询
 SELECT empno,sal FROM fb_test AS OF TIMESTAMP 
to_timestamp('2017-05-07 06:07:30','yyyy-mm-dd hh24:mi:ss') where empno=7369;


 insert into fb_test SELECT * FROM fb_test AS OF TIMESTAMP 
to_timestamp('2017-05-07 06:07:30','yyyy-mm-dd hh24:mi:ss') where empno=7369;
##闪回版本
SELECT versions_xid,empno,sal FROM scott.fb_test VERSIONS BETWEEN 
TIMESTAMP to_timestamp('2017-05-07 06:53:49','yyyy-mm-dd hh24:mi:ss') and to_timestamp('2017-05-07 06:55:38','yyyy-mm-dd hh24:mi:ss')
WHERE empno =7369 ; 

SELECT versions_xid XID, versions_startscn START_SCN,
  versions_endscn END_SCN, versions_operation OPERATION,
  empno, sal
FROM fb_test
VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
WHERE empno = 7369;

##闪回事务
##sys  开启扩展日志
1、 alter database add supplemental log data;
##给test用户赋予以下权限
2、grant execute on dbms_flashback to scott;
3、grant select any transaction to scott;
SELECT  xid, start_scn, commit_scn, operation, logon_user, undo_sql
FROM flashback_transaction_query
WHERE xid IN (
  SELECT versions_xid FROM scott.fb_test
VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
WHERE empno = 7902
);
##闪回表
##启用表的行移动  
alter table fb_test enable row movement;
FLASHBACK TABLE fb_test TO TIMESTAMP 
  TO_TIMESTAMP('2017-05-07 07:12:58', 
  'YYYY-MM-DD HH24:MI:SS'); 

############################闪回######################################

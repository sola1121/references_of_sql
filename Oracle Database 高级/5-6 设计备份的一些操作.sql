##查看备份策略
show all;
##查看需要备份的文件
report need backup;
##配置保留策略 window=7
configure retention policy to recovery window of 7 days;
##打开控制文件自动备份
configure controlfile autobackup on;
##配置自动控制文件备份路径
configure controlfile autobackup format for device type disk to 
'/u01/app/oracle/bak/ctlfile/controlfile_%F';
##修改为默认值
configure controlfile autobackup format for device type disk clear;
##配置备份文件的备份路径
CONFIGURE CHANNEL DEVICE TYPE DISK FORMAT  '/u01/app/oracle/bak/datafile/db_%d_%T_%U';
##修改为默认值
configure device type disk clear;
##查看过期的备份
report obsolete;
##删除陈旧的备份
delete obsolete;
##删除失效的备份
delete expired backup;
##删除所有备份
delete backup;
##验证日志的可用性
crosscheck archivelog all;
##列出所有失效的归档日志
list expired archivelog all;
##删除7天以前的归档日志
delete noprompt archivelog all completed before 'sysdate-7';
##设置成默认值
configure retention policy clear;




==========================================================================




run{ 
allocate channel c1 device type disk; 
allocate channel c2 device type disk; 
allocate channel c3 device type disk; 
allocate channel c4 device type disk; 
allocate channel c5 device type disk; 
crosscheck backup; 
sql 'alter system archive log current'; 
backup database format '/u01/app/oracle/bak/bakfile/db_%d_%T_%U'; 
sql 'alter system archive log current'; 
backup archivelog all format '/u01/app/oracle/bak/logback/arc_%t_%s' delete all input;  
backup current controlfile format '/u01/app/oracle/bak/controlfile/cntrl_%s_%p_%s'; 
crosscheck archivelog all; 
delete noprompt expired backup; 
delete noprompt obsolete; 
delete noprompt backup of database completed before 'sysdate - 30'; 
release channel c1; 
release channel c2; 
release channel c3; 
release channel c4; 
release channel c5; 
} 


====================================================================


################################恢复################################
1、控制文件
##备份控制文件的方法
alter database backup controlfile to trace；
alter database bckup controlfile  to '';
##创建控制文件

restore controlfile from autobackup;
restore controlfile from '/u01/app/oracle/bak/datafile/db_DB11G_20170503_03s3b48s_1_1';
##单个控制文件丢失的恢复

##所有控制文件丢失的恢复

2、重做日志文件
##cuurent 
*._allow_resetlogs_corruption=true
##active
alter database clear unarchived logfile group 1;
##inactive 
alter database clear  logfile group 1;





3、数据文件

################################恢复################################
伍老师 2017/11/19 14:55:15
select sid, serial#, opname, sofar, totalwork from v$session_longops where opname like 'RMAN%' and sofar <> totalwork;


伍老师 2017/11/19 14:55:55

伍老师 2017/11/19 14:56:23
查看备份进度：select sid, serial#, opname, sofar, totalwork from v$session_longops where opname like 'RMAN%' and sofar <> totalwork;


======================================================================


伍老师 2017/11/19 15:03:35
desc v$datafile;

伍老师 2017/11/19 15:03:40
file#

伍老师 2017/11/19 15:03:51
select file#,name from v$datafile;

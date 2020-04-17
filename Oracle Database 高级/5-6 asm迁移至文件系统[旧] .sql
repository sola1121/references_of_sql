###查看控制文件
show parameter control_files;

###查看归档模式
archive log list

shutdown immediate

startup mount

###更改为归档模式   noarchivelog
alter database archivelog;

###更改数据库为open状态
alter database open;

###查看归档情况
archive log list

###更改归档路径
alter system set log_archive_dest_1='location=D:\oracle\archlog';

show parameter log_archive_format

###更改归档文件名
alter system set log_archive_format='BOP%t_%s_%r.dbf' scope=spfile;

###切换归档
alter system switch logfile;


########################ASM迁移至文件系统##############################

rman target

###备份文件


backup as copy database format '／oradata/db11g/%U'  tag 'NO_ASM_MIGRATION';




###恢复
recover copy of database ;



###修改控制文件的参数
alter system set control_files='/oradata/db11g/control01.ctl' scope=spfile;

###备份spfile 
create pfile='/oradata/db11g/pfiledb11g0520.ora' from spfile;

###备份spfile
run
{
	backup as backupset spfile;
	restore spfile to '/u01/app/oracle/oradata/spfile_db11g.ora';
}

####使用pfile启动到nomount;

startup nomount pfile='?/dbs/pfiledb11g0503.ora';

###恢复controlfile(控制文件)
restore controlfile from '/u01/app/oracle/bak/ctlfile/controlfile_c-399663904-20170505-00';

alter database mount;

#####格式化文件名称
run
{
set newname for datafile 4 to  '/oradata/db11g/users01.dbf';
set newname for datafile 2 to  '/oradata/db11g/sysaux01.dbf';
set newname for datafile 1 to  '/oradata/db11g/system01.dbf';
set newname for datafile 5 to  '/oradata/db11g/example01.dbf';
set newname for datafile 6 to  '/oradata/db11g/t_ocp01.dbf';
set newname for datafile 3 to  '/oradata/db11g/undotbs1.dbf';
restore database;
switch datafile  all;
}
###恢复数据库    还有个restore
recover database;

###更改临时文件
run
{
set newname for tempfile '' to '';
switch tempfile all;
}

alter database open resetlogs;

create temporary tablespace newtmp tempfile '/u01/app/oracle/oradata/db11g/newtemp01.dbf' size 100m;

ALTER TABLESPACE temp ADD TEMPFILE '/oradata/db11gtemp02.dbf' SIZE 200M;

alter database DEFAULT TEMPORARY TABLESPACE newtmp;
drop tablespace temp;

####修改日志文件至文件系统
alter database add logfile group 4 ('/oradata/db11g/redo04.log') size 50m；

alter database add logfile group 5 ('/oradata/db11g/redo05.log') size 50m；
alter database add logfile group 6 ('/oradata/db11g/redo06.log') size 50m；

alter system switch logfile;
alter system checkpoint;


########################ASM迁移至文件系统##############################



#################文件系统迁移至asm###########################

###创建备份
backup as copy database format '+DATA' tag 'DB_ASM_MIGRATION';



###恢复
recover copy of database  with tag 'DB_ASM_MIGRATION';

#####修改controlfile参数

alter system set control_files='+DATA/control01.ctl' scope=spfile;

####创建pfile

create pfile='?/dbs/pfiledb11g0504.ora' from spfile;


###关闭数据
shutdown immediate;

###使用pfile启动数据库nomount	

startup nomount pfile='/oradata/db11g/pfiledb11g0520.ora';






####恢复控制文件
restore controlfile from '/u01/app/oracle/bak/ctlfile/controlfile_c-399663904-20170829-00';

####启动数据库到mount
alter database mount;


####switch datafile

switch database to copy;

######恢复数据库

recover database;

###将临时文件迁移至asm
run
{
set newname for tempfile '+DATA' to '+DATA/temp02.dbf';
switch tempfile all;
}

###打开数据库到open

alter database open;

#################文件系统迁移至asm###########################


####修改日志文件至文件系统
alter database add logfile group 7 ('+DATA/redo07.log') size 50m；

alter database add logfile group 8 ('+DATA/redo08.log') size 50m；
alter database add logfile group 9 ('+DATA/redo09.log') size 50m；
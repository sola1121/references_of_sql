

################################工具################################
##exp/imp
exp system/oracle owner=scott buffer=48000000 file=/testbackup/dumpfile/scott_hr_20150515.dmp log=/testbackup/dumpfile/scott_hr_20150515.log

imp system/oracle fromuser=scott touser=test buffer=48000000  ignore=y file=/u01/app/oracle/bak/lgbak/scott_hr_20151201.dmp
log=/u01/app/oracle/bak/lgbak/scott_hr_20151201.log
##expdp/impdp
##创建目录
create directory expdp_dir as '/u01/app/oracle/bak/lgbak';
grant read,write on directory expdp_dir to scott;
expdp scott/oracle  directory=expdp_dir dumpfile=scott.dmp
impdp u_ocp/oracle directory=expdp_dir REMAP_SCHEMA=scott:u_ocp dumpfile=scott.dmp  ;


expdp system/oracle  directory=expdp_dir  schemas=scott  content=metadata_only exclude=table:"in ('emp')" dumpfile=scott.dmp


##sql*loader
##控制文件
vi dept.ctl
LOAD DATA
INFILE dept_load.data
INTO TABLE DEPT_load
FIELDS TERMINATED BY ','
(DEPTNO, DNAME, LOC )


cat dept.data

   10,Sales,Virginia
   20,Accounting,Virginia
   30,Consulting,Virginia
   40,Finance,Virginia


 ##创建表
create table dept_load
          (deptno number(2) primary key,
           dname varchar2(20),
           loc varchar2(20));


##使用sqlldr工具导入数据
sqlldr u_ocp/oracle control=dept.ctl log=detp.log


###使用外部表导入数据
 create table ext_case1
    (deptno number(2),
     dname varchar2(20),
     loc varchar2(20))
    organization external
    (type oracle_loader
    default directory expdp_dir
    access parameters
    (records delimited by newline
   fields terminated by ","
   (deptno,dname,loc)
   )
   location('dept_load.data')
   );



##创建外部表
##SCOTT-----数据导出
CREATE TABLE emp_ext1
  (ename, job, dname)
ORGANIZATION EXTERNAL
  (
    TYPE ORACLE_DATAPUMP
    DEFAULT DIRECTORY expdp_dir
    LOCATION ('emp1.dat','emp2.dat','emp3.dat')
  )
PARALLEL 3
AS
SELECT e.ename,e.job,d.dname
FROM   emp e, dept d
WHERE  e.deptno = d.deptno;

######数据导入
CREATE TABLE emp_ext2
          (ename  VARCHAR2(20),
           job    VARCHAR2(25),
           dname  VARCHAR2(25))
     ORGANIZATION EXTERNAL 
     ( TYPE ORACLE_DATAPUMP
       DEFAULT DIRECTORY expdp_dir 
     LOCATION ('emp1.dat', 'emp2.dat', 'emp3.dat')) ;


##使用sql_loader创建外部表

###info.dat 
56november, 15, 1980  baker             mary       alice     09/01/2004
87december, 20, 1970  roper             lisa       marie     01/01/2002

###创建表
CREATE TABLE emp_exp (emp_no CHAR(6), last_name CHAR(25), first_name CHAR(20), middle_initial CHAR(1), hire_date DATE, dob DATE);


####创建外部表
CREATE TABLE emp_load
  (employee_number      CHAR(5),
   employee_dob         CHAR(20),
   employee_last_name   CHAR(20),
   employee_first_name  CHAR(15),
   employee_middle_name CHAR(15),
   employee_hire_date   DATE)
ORGANIZATION EXTERNAL
  (TYPE ORACLE_LOADER
   DEFAULT DIRECTORY expdp_dir
   ACCESS PARAMETERS
     (RECORDS DELIMITED BY NEWLINE
      FIELDS (employee_number      CHAR(2),
              employee_dob         CHAR(20),
              employee_last_name   CHAR(18),
              employee_first_name  CHAR(11),
              employee_middle_name CHAR(11),
              employee_hire_date   CHAR(10) date_format DATE mask "mm/dd/yyyy"
             )
     )
   LOCATION ('info.dat')
  );

####把数据导入普通表
INSERT INTO emp_exp (emp_no,
                 first_name,
                 middle_initial,
                 last_name,
                 hire_date,
                 dob)
(SELECT employee_number,
        employee_first_name,
        substr(employee_middle_name, 1, 1),
        employee_last_name,
        employee_hire_date,
        to_date(employee_dob,'month, dd, yyyy')
FROM emp_load);
commit;

################################工具################################
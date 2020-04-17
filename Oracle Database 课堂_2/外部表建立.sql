CREATE OR REPLACE DIRECTORY desktop AS 'C:\Users\Administrator\Desktop';   --创建目录

drop table oldemp1;

CREATE TABLE oldemp1 (len varchar(50), publish varchar(25))
organization external
(type ORACLE_LOADER     -- 数据转换驱动器，oracle_loader为默认，
  default directory desktop    --地址
  access parameters(records delimited by newline nobadfile nologfile
                    fields terminated by ',' (len varchar(50), publish  varchar(20)))
          location ('new.txt')  )   --文件
  parallel 5
  reject limit 200;


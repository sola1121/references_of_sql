CREATE OR REPLACE DIRECTORY desktop AS 'C:\Users\Administrator\Desktop';   --����Ŀ¼

drop table oldemp1;

CREATE TABLE oldemp1 (len varchar(50), publish varchar(25))
organization external
(type ORACLE_LOADER     -- ����ת����������oracle_loaderΪĬ�ϣ�
  default directory desktop    --��ַ
  access parameters(records delimited by newline nobadfile nologfile
                    fields terminated by ',' (len varchar(50), publish  varchar(20)))
          location ('new.txt')  )   --�ļ�
  parallel 5
  reject limit 200;


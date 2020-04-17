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
desc v$session;


rollback;

audit table;

--查看ubdo系列参数
show parameter undo_;
###查看undo使用情况
select sum(activeblks) ,sum(unexpiredblks),sum(expiredblks) from v$undostat;
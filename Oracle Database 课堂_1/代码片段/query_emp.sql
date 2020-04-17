CREATE OR REPLACE PROCEDURE query_emp
(p_id IN emp.empno TYPE,p_ename OUT emp.ename TYPE,p_sal OUT emp.sal TYPE)
IS
BEGIN
  SELECT ename,sal INTO p_ename, p_sal FROM emp 
  WHERE empno = p_id;
END raise_sal_simple;

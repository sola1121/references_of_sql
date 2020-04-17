declare
cursor cur_dept is select * from dept;
cursor cur_emp(v_no dept.deptno%type) is 
select * from emp where deptno=v_no;
begin
  for v_dept in cur_dept loop
    dbms_output.put_line(v_dept.deptno||'  '||v_dept.dname);
    for v_emp in cur_emp(v_dept.deptno) loop
      dbms_output.put_line('  '||v_emp.empno||'  '||v_emp.ename);
    end loop;
  end loop;
end;

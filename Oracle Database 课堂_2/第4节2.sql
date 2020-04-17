SELECT last_name, salary, commission_pct, 
COALESCE((salary+(commission_pct*salary)), salary+2000, salary) "New Salary" 
FROM employees;

/*条件表达式*/
--case ... when...when.....else...end
select last_name, job_id, salary,
  case job_id when 'IT_PROG' then salary*1.1   --一列都是用job_id, 可以只写一次expr
              when 'ST_CLERK' then salary*1.2
              when 'SA_REP' then salary*1.3
              else salary 
  end  as "New Salary"   --整个case是一列
from employees;

select last_name, job_id, salary,
  (case when salary<5000 then lpad('*',1,'*') 
        when salary<10000 then lpad('*',2,'*') 
        when salary<20000 then lpad('*',3,'*') 
        else lpad('*',4,'*') 
   end)  as "Level of Income"
from employees;

--decode  具有if...then...else...一样的效果
select last_name, job_id, salary, 
  decode (job_id, 'IT_PROG', salary*1.1,
                  'ST_CLERK', salary*1.2,
                  'SA_REP', salary*1.3, 
                  salary  --默认输出
  )  as "New Salary"
from employees;

select last_name, salary, 
  decode (trunc(salary/2000, 0), 0, 0.00,
                                 1, 0.09,
                                 2, 0.20,
                                 3, 0.30,
                                 4, 0.40,
                                 5, 0.42,
                                 6, 0.44,
                                    0.45)
  as "Tax Rate"
from employees;

select trunc(9000/2000,0) from dual;
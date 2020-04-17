create or replace procedure raise_sal_sample(work_id number,raise_rate float)
as
begin
  update emp set sal = sal*raise_rate 
  where empno = work_id;
end raise_sal_sample;

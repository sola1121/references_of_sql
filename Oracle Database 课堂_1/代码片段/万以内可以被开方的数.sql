declare
v_result varchar2(5000);
begin
  for i in 1..10000 loop
    if floor(sqrt(i))-sqrt(i)=0 then
    dbms_output.put_line(i);
    end if;
  end loop;
  end;

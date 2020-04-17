CREATE OR REPLACE PROCEDURE p_joserpher
(p_total number,p_shift number,p_result out varchar2)
as
  k integer:=0;
  v_idx integer:=0;
  Type joserph IS TABLE OF integer INDEX BY BINARY_INTEGER;
  v_soilders joserph;
begin
  for i in 1..p_total LOOP
    v_soilders(i):=i;
  END LOOP;
  p_result:='';
  WHILE v_soilders.count>=1 LOOP
     if v_soilders.next(v_idx) is not null then
       v_idx :=v_soilders.next(v_idx );
     else
       v_idx :=v_soilders.first;
     end if;
     k:=k+1;
     if mod(k,p_shift)=0 then
       p_result:=p_result || v_soilders(v_idx) || chr(10);
       v_soilders.delete(v_idx);
     end if;
  END LOOP;
end;

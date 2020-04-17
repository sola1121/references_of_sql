declare
yearNum number:= &year;
answer varchar2(50);
begin
 if mod(yearNum,100)=0 then
   if mod(yearNum,400)=0 then
     answer :=' is ';
     else
     answer :=' is not ';
   end if;
  else if mod(yearNum,4) then 
    answer :=' is ';
  else 
  answer :=' is not ';
  end if;
  dbms_output.put_line(yearNum||answer||'a leap year.');
end;

begin
Dbms_Output.put_line('print 9*9 list : ');
for i in 1..9 loop
    for j in 1..i loop
        Dbms_Output.put(i||'*'||j||'='||i*j);
        dbms_output.put(' ');
    end loop;
    dbms_output.new_line;
end loop;
end;

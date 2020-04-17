declare   
  type type_array is table of varchar2(20) index by binary_integer;  
  var_array type_array;  
begin   
  var_array(1):='aa';  
  var_array(2):='bb';  
    
  for i in 1..var_array.count loop  
     dbms_output.put_line( var_array(i));  
  end loop;  
    
end;  

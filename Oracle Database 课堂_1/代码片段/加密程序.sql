create or replace function f_encrypt_own(p_plain_msg varchar2, p_shift varchar2)
return varchar2
as
  type type_array is table of varchar2(1000) index by binary_integer;
  var_array type_array;
  v_encrypt_msg varchar2(1000):='';
  z varchar2(1000);
  x char(1);
  y char(1);
BEGIN
  z := upper(p_shift);
  FOR a in 0..length(z) LOOP
    var_array(a):= ascii(substr(z,a+1,1))-64;
  end loop;

  FOR i in 1..length(p_plain_msg) LOOP
    x:=substr(p_plain_msg,i,1);
    if x between 'A' and 'Z'then
      y:= chr(mod(ascii(x)+var_array(mod(i,length(z)))-65+26,26)+65);
    elsif x between 'a' and 'z' then
      y:= chr(mod(ascii(x)+var_array(mod(i,length(z)))-97+26,26)+97);
    elsif x between '0'and'9' then
      y:= chr(mod(ascii(x)+var_array(mod(i,length(z)))-48+10,10)+48);
    else
      y:= x;
    end if;
      v_encrypt_msg:=v_encrypt_msg || y;
    END LOOP;
    return v_encrypt_msg;
END;
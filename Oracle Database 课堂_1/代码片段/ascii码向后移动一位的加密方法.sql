DECLARE
  v_plain_msg varchar2(50):='meet AT ZOO IN 9';
  v_encrypt_msg varchar2(50):='';
  c char(1);
  e char(1);
BEGIN
  v_plain_msg := Upper(v_plain_msg);
  FOR i in 1..length(v_plain_msg) LOOP
    c:=substr(v_plain_msg,i,1);
    if lower(c) BETWEEN 'a' AND 'z'then
      e:= chr(mod(ascii(c)+1-65,26)+65);  /* ascii('a')=65 ascii('z')=90 */
    elsif c between '0'and'9' then
      e:= chr(mod(ascii(c)+1-48,10)+48);  /* ascii('0')=48 ascii('9')=57 */
    else
      e:= c;
    end if;
      v_encrypt_msg:= v_encrypt_msg || e;
    END LOOP;
    DBMS_OUTPUT.put_line(v_encrypt_msg);
END;

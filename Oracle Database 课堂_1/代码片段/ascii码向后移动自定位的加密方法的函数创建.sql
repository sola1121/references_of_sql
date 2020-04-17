create or replace function f_encrypt_shift
(p_plain_msg varchar2,p_shiftuppr number,p_shiftlower number,p_shiftnum number)
return varchar2 
as
  v_encrypt_msg varchar2(1000):='';
  c char(1);
  e char(1);
BEGIN 
  /*可以区分大小写与数字,并且转化只会出现字母与数字,其它福哈不会被转换*/
  FOR i in 1..length(p_plain_msg) LOOP
    c:=substr(p_plain_msg,i,1);
    if c BETWEEN 'A' AND 'Z'then
      e:= chr(mod(ascii(c)+p_shiftuppr-65,26)+65);  /* ascii('A')=65 ascii('Z')=90 */
    elsif c between 'a' and 'z' then
      e:= chr(mod(ascii(c)+p_shiftlower-97,26)+97);  /* ascii('a')=97 ascii('z')=122 */
    elsif c between '0'and'9' then
      e:= chr(mod(ascii(c)+p_shiftnum-48,10)+48);  /* ascii('0')=48 ascii('9')=57 */
    else
      e:= c;
    end if;
      v_encrypt_msg:=v_encrypt_msg || e;
    END LOOP;
    return v_encrypt_msg;
END;

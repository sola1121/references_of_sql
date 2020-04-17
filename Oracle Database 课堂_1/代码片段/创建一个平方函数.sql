CREATE OR REPLACE FUNCTION f_squarenumber_find(p_a number,p_b number) 
RETURNS varchar2 
IS /*可用 as */
 minI number:= ceil(sqrt(a));
 maxI number:= floor(sqrt(b));
 v_msg varchar2(1000):= 'Square numbers between ' ||p_a ||' and '|| p_b ||' are ';
BEGIN
  FOR i IN minI..maxI-1 LOOP
      v_msg := v_msg || i*i || ',';
  END LOOP;
    v_msg:=v_msg || power(maxI-1,2) ||'.';
  RETURN v_msg;
END;
/*创建一个函数,可以在对象-Functions中被找到*/

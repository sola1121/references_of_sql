DECLARE
  a number := &a;   /*可以用于输入的写法*/
  b number := &b;
  minI number:= ceil(sqrt(a));
  maxI number:= floor(sqrt(b));
  v_msg varchar2(500):='Square numbers between '||a|| 'and' ||b|| 'are ';         
BEGIN
  FOR i IN minI..maxI-1 LOOP  
    v_msg := v_msg || i*i || ',';   
  END LOOP; 
  v_msg := v_msg || power(maxI-1,2)||'.'; 
  DBMS_OUTPUT.put_line(v_msg);
END;

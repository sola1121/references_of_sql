
--正则表达式
select first_name, last_name from employees
  where regexp_like (first_name, '^Ste(v|ph)en$');   --注意区分大小写

create table employeesss as select * from employees;
 
select first_name, last_name from employees
  where first_name like 'Ste%ph' or first_name like 'Ste%en';
  
select phone_number from employees;
select replace(phone_number, '.', '-') from employees;
select regexp_replace(phone_number, '-', '(.) ') from employees;  --正则的regexp_replace

select street_address, regexp_instr(street_address,'[[:alpha:]]') AS First_Alpha_Position from locations;

select street_address, regexp_instr(street_address,'[[:digit:]]') AS First_Alpha_Position from locations;

select street_address, regexp_substr(street_address, '[^ ]+') as AddrPart from locations;


--滚回去学正则语法
--regexp_like
select employee_id, last_name, first_name from employees
where regexp_like (last_name, '^Ste(v|ph)en$');
--regexp_replace
SELECT REGEXP_REPLACE(phone_number, '\.','-') AS phone
FROM employees;
--regexp_instr
SELECT street_address,
REGEXP_INSTR(street_address,'[[:alpha:]]') AS
First_Alpha_Position
FROM locations;
--regexp_substr
SELECT street_address, REGEXP_SUBSTR(street_address , ' [^ ]+ ') AS Road
FROM locations;

select regexp_instr('012345678', '(123)(4(56)(78))', 1, 1, 0, 'i', 3) pos from dual; 

--通过将子查询用作源来检索数据
select department_name, city from departments
  natural join (select l.location_id, l.city, l.country_id from locations l
                  join countries c on (l.country_id=c.country_id)
                  join regions using (region_id)
                  where region_name='Europe');
                  
--通过将子查询用作目标来执行插入
insert into (select l.location_id, l.city, l.country_id from locations l
              join countries c on (l.country_id=c.country_id)
              join regions using (region_id)
              where lower(region_name) = 'europe')
  values (3300,'Cardiff', 'UK');

rollback;

--在 DML 语句中使用 WITH CHECK OPTION 关键字
insert into (select l.location_id, l.city, l.country_id from locations l
              where country_id in (select country_id from countries
                                    natural join regions 
                                    where lower(region_name) = 'europe')
                                    with check option)
  values (3600,'Washington', 'US');  --US对应的region_id 是2, 不是Europe的 1,所以会报错

create view region_with_check_option 
as (select l.location_id, l.city, l.country_id from locations l
     where country_id in (select country_id from countries
                             natural join regions 
                             where lower(region_name) = 'europe')
                             with check option);

--创建的view是有一条条件的 where lower(region_name) = 'europe', 这就是他的check条件

create table deptm3
 as select d.department_id, d.department_name, l.manager_id from employees l
    join departments d on d.department_id=l.department_id;

INSERT INTO deptm3
(department_id, department_name, manager_id)
VALUES (300, 'Engineering', DEFAULT);
--使用默认值
UPDATE deptm3
SET manager_id = DEFAULT
WHERE department_id = 10;

select * from deptm3 where department_id=300;
--设置默认值
alter table hr.deptm3 modify manager_id default 999;

--多表插入
insert all
  into sal_hisory values(emp_id, hostorydate, sal)
  into mgr_history values(emp_id, mgr, sal)
  select employee_id "emp_id", salary "sal", hire_date "historydate", manager_id "mgr" from employees
    where salary>10000;
    
--条件多表插入 insert all
INSERT ALL
  WHEN HIREDATE < ' 01-JAN-95 ' THEN
  INTO emp_history VALUES(EMPID,HIREDATE,SAL)
  WHEN COMM IS NOT NULL THEN
  INTO emp_sales VALUES(EMPID,COMM,SAL)
  SELECT employee_id EMPID, hire_date HIREDATE,salary SAL, commission_pct COMM FROM employees

insert all 
  when hire_date<'1-1月 -2005'  then
  into emp_history values (emp_id, historydate, sal)
  
  when commission_pct is not null then
  into sal_history values (emp_id, commission_pct, sal)
  
  select employee_id "emp_id", salary "sal", hire_date "historydate", manager_id "mgr" from employees;
  
--同一数据只插入一次  insert first ... else ...
insert first
  when salary<5000 then
  into sal_low values(emp_id, sal)
  
  when salary between 5000 and 10000 then
  into sal_mid values(emp_id, sal)
  
  else 
  into sal_high values(emp_id, sal)
  select employee_id emp_id, salary sal from employees;
  
--合并行 merge
--格式
/*
用来合并UPDATE和INSERT语句。

通过MERGE语句，根据一张表（原数据表，source table）或
子查询的连接条件对另外一张（目标表，target table）表进行查询，
连接条件匹配上的进行UPDATE，无法匹配的执行INSERT。

这个语法仅需要一次全表扫描就完成了全部工作，执行效率要高于INSERT+UPDATE。
*/
MERGE INTO table_name table_alias USING (table|view|sub_query) alias ON (join condition)
  WHEN MATCHED THEN
  UPDATE SET
  col1 = col1_val,
  col2 = col2_val
  WHEN NOT MATCHED THEN
  INSERT (column_list)
  VALUES (column_values);
  
--在 COPY_EMPL3 表中插入或更新行使之与 EMPLOYEES 表相匹配
merge into copy_emp3 c using (SELECT * FROM EMPLOYEES ) e on (c.employee_id = e.employee_id)

when matched then
update set
c.first_name = e.first_name,
c.last_name = e.last_name,
...

delete where(E.COMMISSION_PCT IS NOT NULL)

when not matched then
insert values(e.employee_id, e.first_name, e.last_name,e.email, e.phone_number, e.hire_date, e.job_id,e.salary, e.commission_pct, e.manager_id,e.department_id);

--闪回版本查询 VERSIONS
select * from employees
  versions between scn minvalue and maxvalue
  where employee_id = 107;




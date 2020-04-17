--日期的查询与设置
select current_date, current_timestamp, localtimestamp from dual;

alter session set time_zone = '+8:00';

alter session set nls_date_format = 'DD-MM-YYYY HH24:MI:SS';

select sessiontimezone, current_date, current_timestamp from dual;

select dbtimezone, sessiontimezone from dual;

--创建使用时间戳的表
create table web_orders(
  order_time timestamp with time zone,
  delivery_time timestamp with local time zone
  );
insert into web_orders values(current_date, current_date+2);   --加了两天
select * from web_orders;

--interval
create table wrranty(
  prod_id number(7),
  wrranty_time interval year(3) to month
  );
insert into wrranty values(123, interval '9' month);
insert into wrranty values(125, interval '100' year(3));
insert into wrranty values(128, interval '100-11');
select * from wrranty;

create table lab(
  exp_id number(3),
  test_period interval day(2) to second
  );
insert into lab values(234, '10 01:20:00');
insert into lab values(356, interval '2 10:11:20' day to second);
select * from lab;

--单行函数之日期相关函数
--提取extract
select extract(month from hire_date) from employees;
--获取时区偏移量
select tz_offset('Asia/Shanghai') from dual;
--显示为timestamp with zone
select from_tz(timestamp '2017-10-21 11:05:00', 'Asia/Shanghai') from dual;
--显示为timestamp
to_timestamp
--显示某日期过后2年零5个月后的日期, 这里的某个日期是hire_date
select last_name, hire_date, hire_date + to_yminterval('02-05') from employees;
--
to_dsinterval



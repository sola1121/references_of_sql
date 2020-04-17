select sysdate from dual;

--1
alter session set nls_date_format = 'DD-MM-YYYY HH24:MI:SS';

--2
select tz_offset ('US/Eastern') from dual;
select tz_offset ('singapore') from dual;
select tz_offset ('egypt') from dual;

--3



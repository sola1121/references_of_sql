--SELECT * FROM   usera.employees; ������һ���û��ı� 


--������
create table job_grades2(
  grade_level varchar(2),
  minsalary number(10,2),
  max_salary number(10,2)
  );
  
--�Դ����ı�����޸�
alter table job_grades2 add (myday date);

desc job_grades;

--default  ȱʡ��Ĭ��ֵ,  modify  �޸���ʹ��
alter table job_grades2 modify (myday default sysdate);

insert into job_grades2 (grade_level,min_salary,max_salary)
  values ('A',1000,2999);   --ʹ�ò������,û��myday������, �����Զ�����
  
--���Լ��
create table HR.sale_rep (
  employee_id number not null,
  last_name varchar2(40) not null,
  salary number(8,2) constraint "salary_Check_0_" check (salary>0),  --�м����Լ������
  commission_pct number(2,2),
  department_id number(4), 
  constraint "pk_empoyee_id" primary key (employee_id),   --�����Լ������
  constraint "departId_fk_" foreign key (department_id) references departments(department_id)   --�����Լ������
  );

drop table hr.sale_rep;
--����Լ������
alter table sale_rep modify (salary not null);   --������
alter table sale_rep add (email varchar2(40) unique);   --�����

/*
**FOREIGN KEY �����ڱ�Լ�������������ӱ��е��С� 
**REFERENCES ���ڱ�ʶ�����еı���С� 
**ON DELETE CASCADE ָ����ɾ�������е���ʱ����ɾ���ӱ��е�����С� ����ɾ��
**ON DELETE SET NULL ָ����ɾ�������е���ʱ�������ֵ��Ϊ��ֵ�� 
*/
--not null ,check, unique, primary key, foreign key

select department_id as d_e_dept_id from departments;

desc job_history;

--on delete set ...
alter table sale_rep modify
(department_id number(4), constraint "salae_rep_fk" foreign key (department_id)
  references department3(department_id) on delete set null);

--�Ӳ�ѯ������ create table ... as ...
create table departmentsx as
select * from departments;

desc departmentsx;

--alter table add()
--alter table modify()

alter table departmentsx add (testCol varchar(4));  --�����

alter table departmentsx drop (testCol);   --ɾ����

desc departmentsx;
commit;

rollback;

alter table departmentsx rename column testcol to xx;

alter table departmentsx rename to departmentsxx;
rollback;
desc departmentsxx;

insert into departmentsxx(department_id, department_name,location_id,manager_id)  select * from departments ;

--read only  ���ñ�ֻ��     read write  ��д��
alter table departmentsxx read only;
alter table departmentsxx read write;

--purge ɾ�����б�����
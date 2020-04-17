/****** ����:  Database [xkgl]   
 �ű�����: 04/05/2012 14:43:32 ******/

CREATE DATABASE xkgl
go
use xkgl
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Department]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Department]
GO
--�� Department �Ľṹ
Create table Department(
DepartmentID char(4) primary key,
DepartmentName varchar(20) NOT NULL unique,
DepartmentHeader varchar(8) NOT NULL,
TeacherNum int 
)
GO
--�� Department ������
 insert into Department([DepartmentID],[DepartmentName],[DepartmentHeader],[TeacherNum]) Values('Dp01','�����ϵ','�޺�Ȼ',120)
 insert into Department([DepartmentID],[DepartmentName],[DepartmentHeader],[TeacherNum]) Values('Dp02','�Ź�ϵ','������',null)
 insert into Department([DepartmentID],[DepartmentName],[DepartmentHeader],[TeacherNum]) Values('Dp03','Ӣ��ϵ','���ΰ',10)


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Class]
GO
--�� Class �Ľṹ
Create table Class(
ClassID   char(8) primary key,
ClassName varchar(20) not null,
Monitor  char(8),
StudentNum int check(StudentNum>0),
DepartmentID char(4) references Department(DepartmentID)
)
go
--�� Class ������
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs010901','09�������1��','����',34,'Dp01')
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs010902','09�������1��','�־�',10,'Dp01')
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs010903','09���ݿ��','����',28,'Dp01')
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs011104','11���繤��',null,23,'Dp01')
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs021001','10��������1��','����',33,'Dp02')
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs021002','10��������2��',null,null,'Dp02')


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Student]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Student]
GO
--�� Student �Ľṹ
Create table Student(
StudentID   char(12) primary key,
StudentName char(8) not null,
Sex  char(2) not null check(sex in('��','Ů')),
Birth  datetime not null,
HomeAddr varchar(80),
EntranceTime datetime default getdate(),
ClassID char(8) references Class(ClassID)
)
go
--�� Student ������
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010001','�ź�    ','��','1991-4-4','����������������� 80 ��','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010002','������  ','��','1990-12-7','��ͷ����Դ·34��','2009-9-19','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010003','����    ','Ů','1990-9-30','','2009-9-19','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010004','������  ','��','1991-5-9','������ɳ�����е���· 80 ��','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010005','���  ','��','1989-11-27','������ɳ������԰���� 90 ��','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010006','������  ','Ů','1990-8-15','��ɽ���Ϻ����Ϻ����120��','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010007','����ӣ  ','Ů','1990-6-23','��ɽ���Ϻ���ʨɽ20��','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010008','�ܺ���  ','��','1992-7-12','�Ϻ��л�ʯ· 50 ��','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010009','����    ','��','1991-2-21','�����и���������·29�ž�������18c','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109020001','��ƽ    ','��','1991-4-30','�ɶ��ж����ߺ�ʯ·321��','2009-9-10','Cs010902')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109020002','����    ','��','1990-10-19','�˱����˱����231��','2009-9-19','Cs010902')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109020003','��΢    ','Ů','1990-7-18','��ɽ����ɽ���786��','2009-9-19','Cs010902')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109020004','�ſ�֥  ','Ů','1989-5-19','�����ж�ɽ��34��','2009-9-19','Cs010902')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0111040001','����    ','��','1994-11-4','','2011-9-13','Cs011104')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0111040002','ҦǮ    ','Ů','1993-4-2','�ɶ����������ɽ���12��','2011-9-13','Cs011104')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0111040003','������  ','Ů','1993-10-4','','2011-9-13','Cs011104')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010001','��ƽ    ','Ů','1992-12-3','�������ܸ���32��','2010-9-12','Cs021001')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010002','������  ','Ů','1991-4-23','������ɳ������԰���� 91 ��','2010-9-12','Cs021001')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010003','����ΰ  ','��','1990-10-10','�ɶ�����ɽ·321��','2010-9-12','Cs021001')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010004','������  ','��','1991-5-4','�ɶ�����ɽ·322��','2010-9-12','Cs021001')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010005','������  ','��','1993-4-8','��ɽ��˳������һ���120��','2010-9-12','Cs021001')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010006','����    ','��','1992-9-2','','2010-9-12','Cs021001')


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Course]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Course]
GO
--�� Course �Ľṹ
Create table Course(
CourseID   char(8) primary key,
CourseName varchar(60) not null,
BookNmae  varchar(80) not null,
period int not null,
credit int not null
)
go
--�� Course ������
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp010001','JAVA�������','Java�߼��������',60,4)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp010002','���������','���������',90,6)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp010003','���ݿ�ԭ����Ӧ��','���ݿ⼼����Ӧ��-SQL Server 2005',60,4)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp010004','�����Ӧ�û���','�����Ӧ�û���',30,2)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp020001','����ó��ʵ��','����ó��ʵ��',60,4)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp020002','����������������','����ѧ����',60,4)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp030001','��ѧӢ��(һ)','��ѧӢ���ۺ�һ',90,6)

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Grade]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Grade]
GO
--�� Grade �Ľṹ
Create table Grade(
CourseID   char(8) references Course(CourseID),
StudentID char(12) references Student(StudentID),
Semester  int not null,
SchoolYear int ,
Grade numeric(5,1) check(grade>=0),
primary key(CourseID,StudentID)
)
go
--�� Grade ������
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109010001',2,2009,'87')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109010002',2,2009,'68')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109010003',2,2009,'92')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109010004',2,2009,'91')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109010005',2,2009,'72')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109010006',2,2009,'87')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109010007',2,2009,'97')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109010009',2,2009,'69')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109020001',2,2009,'56')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109020002',2,2009,'89')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109020003',2,2009,'98')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0109020004',2,2009,'76')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0210010001',2,2010,'88')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0210010002',2,2010,'72')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010001','St0210010003',2,2010,'71')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010002','St0111040001',2,2011,'54')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010002','St0111040002',2,2011,'92')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010002','St0111040003',2,2011,'95')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109010001',2,2009,'50')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109010002',2,2009,'67')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109010003',2,2009,'61')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109010004',2,2009,'91')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109010005',2,2009,'55')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109010006',2,2009,'68')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109010007',2,2009,'69')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109010009',2,2009,'55')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109020001',2,2009,'93')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109020002',2,2009,'70')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109020003',2,2009,'73')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010003','St0109020004',2,2009,'81')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109010001',2,2009,'80')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109010002',2,2009,'63')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109010004',2,2009,'57')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109010005',2,2009,'94')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109010006',2,2009,'89')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109010007',2,2009,'83')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109010009',2,2009,'82')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109020001',2,2009,'72')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109020002',2,2009,'57')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109020003',2,2009,'53')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0109020004',2,2009,'51')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0111040001',1,2012,'55')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0111040002',1,2012,'63')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0111040003',1,2012,'61')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0210010001',1,2011,'99')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0210010002',1,2011,'71')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp010004','St0210010003',1,2011,'56')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp020001','St0210010002',2,2010,'64')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp020001','St0210010003',2,2010,'82')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp020001','St0210010004',2,2010,'95')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp020001','St0210010005',2,2010,'86')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109010001',2,2009,'75')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109010002',2,2009,'53')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109010003',2,2009,'64')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109010004',2,2009,'84')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109010005',2,2009,'72')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109010006',2,2009,'93')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109010007',2,2009,'98')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109010009',2,2009,'64')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109020001',2,2009,'77')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109020002',2,2009,'61')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109020003',2,2009,'63')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0109020004',2,2009,'51')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0111040001',2,2011,'96')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0111040002',2,2011,'63')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0111040003',2,2011,'71')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0210010001',2,2010,'77')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0210010002',2,2010,'67')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0210010003',2,2010,'91')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0210010004',2,2010,'68')
 insert into Grade([CourseID],[StudentID],[Semester],[SchoolYear],[Grade]) Values('Dp030001','St0210010005',2,2010,'73')


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Teacher]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Teacher]
GO
--�� Teacher �Ľṹ
Create table Teacher(
TeacherID   char(8) primary key,
Teachername char(12) not null,
Sex  char(2) not null check(sex in('��','Ů')),
Brith datetime ,
Profession char(8) check(profession in('����','������','��ʦ','����')),
Telephone varchar(20),
HomeAddr varchar(50),
DepartmentID char(4) references Department(DepartmentID)
)
go
--�� Teacher ������
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep01001','��һƽ      ','��','1968-4-5','������  ','86684567','��������29��309','Dp01')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep01002','�����      ','Ů','1976-9-3','��ʦ    ','86685633','��������21��109','Dp01')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep01003','�º�        ','��','1959-12-5','����    ','86687656','��������12��306','Dp01')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep01004','�ܽ���      ','��','1984-6-5','����    ','86684332','��������3��306','Dp01')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep01005','������      ','��','1978-5-6','��ʦ    ','86687653','��������1��206','Dp01')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep02001','����        ','Ů','1973-3-2','������  ','86687651','��������1��106','Dp02')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep02002','����        ','Ů','1985-6-7','����    ','86680975','��������1��406','Dp02')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep02003','����Ȼ      ','��','1969-12-9','����    ','86685645','��������1��306','Dp02')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep03001','����        ','Ů','1968-6-7','������  ','86687904','��������21��108','Dp03')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep03002','����        ','Ů','1976-8-6','��ʦ    ','86684312','��������21��208','Dp03')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep03003','�����      ','Ů','1978-5-6','��ʦ    ','86687954','��������3��206','Dp03')


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Schedule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Schedule]
GO
--�� Schedule �Ľṹ
Create table Schedule(
TeacherID char(8) references Teacher(TeacherID),
CourseID char(8) references Course(CourseID),
ClassID char(8)  references Class(ClassID),
Semester int not null,
SchoolYear int not null,
primary key(TeacherID,CourseID,ClassID)
)
--�� Schedule ������
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep01001','Dp010003','Cs010902',2,2009)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep01001','Dp010003','Cs010903',2,2009)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep01001','Dp010004','Cs010901',2,2009)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep01001','Dp010004','Cs010902',2,2009)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep01002','Dp010002','Cs011104',2,2011)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep01003','Dp010004','Cs011104',1,2012)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep01003','Dp010004','Cs021001',1,2011)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep01005','Dp010001','Cs010901',2,2009)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep01005','Dp010001','Cs010902',2,2009)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep01005','Dp010001','Cs021001',2,2010)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep02001','Dp020001','Cs021001',2,2010)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep03001','Dp030001','Cs010901',2,2009)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep03001','Dp030001','Cs010902',2,2009)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep03001','Dp030001','Cs011104',2,2011)
 insert into Schedule([TeacherID],[CourseID],[ClassID],[Semester],[SchoolYear]) Values('dep03003','Dp030001','Cs021001',2,2010)

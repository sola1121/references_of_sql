/****** 对象:  Database [xkgl]   
 脚本日期: 04/05/2012 14:43:32 ******/

CREATE DATABASE xkgl
go
use xkgl
go

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Department]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Department]
GO
--表 Department 的结构
Create table Department(
DepartmentID char(4) primary key,
DepartmentName varchar(20) NOT NULL unique,
DepartmentHeader varchar(8) NOT NULL,
TeacherNum int 
)
GO
--表 Department 的数据
 insert into Department([DepartmentID],[DepartmentName],[DepartmentHeader],[TeacherNum]) Values('Dp01','计算机系','罗浩然',120)
 insert into Department([DepartmentID],[DepartmentName],[DepartmentHeader],[TeacherNum]) Values('Dp02','信管系','李伶俐',null)
 insert into Department([DepartmentID],[DepartmentName],[DepartmentHeader],[TeacherNum]) Values('Dp03','英语系','李宏伟',10)


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Class]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Class]
GO
--表 Class 的结构
Create table Class(
ClassID   char(8) primary key,
ClassName varchar(20) not null,
Monitor  char(8),
StudentNum int check(StudentNum>0),
DepartmentID char(4) references Department(DepartmentID)
)
go
--表 Class 的数据
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs010901','09软件技术1班','方凯',34,'Dp01')
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs010902','09软件测试1班','林静',10,'Dp01')
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs010903','09数据库班','黄勇',28,'Dp01')
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs011104','11网络工程',null,23,'Dp01')
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs021001','10电子商务1班','李米',33,'Dp02')
 insert into Class([ClassID],[ClassName],[Monitor],[StudentNum],[DepartmentID]) Values('Cs021002','10电子商务2班',null,null,'Dp02')


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Student]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Student]
GO
--表 Student 的结构
Create table Student(
StudentID   char(12) primary key,
StudentName char(8) not null,
Sex  char(2) not null check(sex in('男','女')),
Birth  datetime not null,
HomeAddr varchar(80),
EntranceTime datetime default getdate(),
ClassID char(8) references Class(ClassID)
)
go
--表 Student 的数据
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010001','张宏    ','男','1991-4-4','广州市天河区常保阁东 80 号','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010002','姜明凡  ','男','1990-12-7','汕头市天源路34号','2009-9-19','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010003','张丽    ','女','1990-9-30','','2009-9-19','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010004','赵新宇  ','男','1991-5-9','大连市沙河区承德西路 80 号','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010005','李宇凯  ','男','1989-11-27','大连市沙河区花园东街 90 号','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010006','黄丽莉  ','女','1990-8-15','佛山市南海区南海大道120号','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010007','胡雨樱  ','女','1990-6-23','佛山市南海区狮山20号','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010008','曹海华  ','男','1992-7-12','上海市黄石路 50 号','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109010009','许田    ','男','1991-2-21','深圳市福田区福华路29号京海大厦18c','2009-9-10','Cs010901')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109020001','李平    ','男','1991-4-30','成都市都江堰红石路321号','2009-9-10','Cs010902')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109020002','王虎    ','男','1990-10-19','宜宾市宜宾大道231号','2009-9-19','Cs010902')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109020003','黄微    ','女','1990-7-18','鞍山市中山大道786号','2009-9-19','Cs010902')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0109020004','张凯芝  ','女','1989-5-19','广州市东山区34号','2009-9-19','Cs010902')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0111040001','立号    ','男','1994-11-4','','2011-9-13','Cs011104')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0111040002','姚钱    ','女','1993-4-2','成都市武侯区中山大道12号','2011-9-13','Cs011104')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0111040003','方雨丽  ','女','1993-10-4','','2011-9-13','Cs011104')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010001','李平    ','女','1992-12-3','广州市萝岗区32号','2010-9-12','Cs021001')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010002','周雅云  ','女','1991-4-23','大连市沙河区花园东街 91 号','2010-9-12','Cs021001')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010003','王建伟  ','男','1990-10-10','成都市中山路321号','2010-9-12','Cs021001')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010004','梁冬云  ','男','1991-5-4','成都市中山路322号','2010-9-12','Cs021001')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010005','黄树军  ','男','1993-4-8','佛山市顺德区五一大道120号','2010-9-12','Cs021001')
 insert into Student([StudentID],[StudentName],[Sex],[Birth],[HomeAddr],[EntranceTime],[ClassID]) Values('St0210010006','雷立    ','男','1992-9-2','','2010-9-12','Cs021001')


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Course]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Course]
GO
--表 Course 的结构
Create table Course(
CourseID   char(8) primary key,
CourseName varchar(60) not null,
BookNmae  varchar(80) not null,
period int not null,
credit int not null
)
go
--表 Course 的数据
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp010001','JAVA程序设计','Java高级程序设计',60,4)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp010002','计算机网络','计算机网络',90,6)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp010003','数据库原理与应用','数据库技术与应用-SQL Server 2005',60,4)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp010004','计算机应用基础','计算机应用基础',30,2)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp020001','国际贸易实务','国际贸易实务',60,4)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp020002','电子商务物流管理','物流学概论',60,4)
 insert into Course([CourseID],[CourseName],[BookNmae],[period],[credit]) Values('Dp030001','大学英语(一)','大学英语综合一',90,6)

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Grade]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Grade]
GO
--表 Grade 的结构
Create table Grade(
CourseID   char(8) references Course(CourseID),
StudentID char(12) references Student(StudentID),
Semester  int not null,
SchoolYear int ,
Grade numeric(5,1) check(grade>=0),
primary key(CourseID,StudentID)
)
go
--表 Grade 的数据
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
--表 Teacher 的结构
Create table Teacher(
TeacherID   char(8) primary key,
Teachername char(12) not null,
Sex  char(2) not null check(sex in('男','女')),
Brith datetime ,
Profession char(8) check(profession in('教授','副教授','讲师','助教')),
Telephone varchar(20),
HomeAddr varchar(50),
DepartmentID char(4) references Department(DepartmentID)
)
go
--表 Teacher 的数据
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep01001','王一平      ','男','1968-4-5','副教授  ','86684567','东软宿舍29栋309','Dp01')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep01002','潘清菊      ','女','1976-9-3','讲师    ','86685633','东软宿舍21栋109','Dp01')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep01003','陈鹤        ','男','1959-12-5','教授    ','86687656','东软宿舍12栋306','Dp01')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep01004','周江瑞      ','男','1984-6-5','助教    ','86684332','东软宿舍3栋306','Dp01')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep01005','朱于龙      ','男','1978-5-6','讲师    ','86687653','东软宿舍1栋206','Dp01')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep02001','雷燕        ','女','1973-3-2','副教授  ','86687651','东软宿舍1栋106','Dp02')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep02002','郭菊        ','女','1985-6-7','助教    ','86680975','东软宿舍1栋406','Dp02')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep02003','刘悠然      ','男','1969-12-9','教授    ','86685645','东软宿舍1栋306','Dp02')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep03001','胡丽        ','女','1968-6-7','副教授  ','86687904','东软宿舍21栋108','Dp03')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep03002','刘芳        ','女','1976-8-6','讲师    ','86684312','东软宿舍21栋208','Dp03')
 insert into Teacher([TeacherID],[Teachername],[Sex],[Brith],[Profession],[Telephone],[HomeAddr],[DepartmentID]) Values('dep03003','雷珍锦      ','女','1978-5-6','讲师    ','86687954','东软宿舍3栋206','Dp03')


if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Schedule]') and OBJECTPROPERTY(id, N'IsUserTable') = 1) drop table [dbo].[Schedule]
GO
--表 Schedule 的结构
Create table Schedule(
TeacherID char(8) references Teacher(TeacherID),
CourseID char(8) references Course(CourseID),
ClassID char(8)  references Class(ClassID),
Semester int not null,
SchoolYear int not null,
primary key(TeacherID,CourseID,ClassID)
)
--表 Schedule 的数据
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

use StudentManage
go
create table Department
(
	DepartmentID char(4) primary key,
	DepartmentName varchar(20) not null unique,
	DpartmnetHeader varchar(8) not null,
	TeacherNum int
);
go
create table Course
(
	CourseID char(8) primary key,
	CoursrName varchar(80) not null,
	BookName varchar(80) not null,
	Period int,
	Credit int
);
go
create table Teacher
(
	TeacherID char(8) primary key,
	TeacherName char(8) not null,
	Sex char(2) not null check(Sex='男' or Sex='女'), 
	Birth date,
	Profession char(8) check(Profession='教授' or Profession='副教授' or Profession='讲师' or Profession='助教'),
	Telephone varchar(20),
	HomeAddr varchar(100),
	DepartmentID char(4) references Department(DepartmentID)
);
go
create table Class
(
	ClassID char(8) primary key,
	ClassName varchar(20) not null,
	Monitor char(8),
	StudentNum int check(StudentNum>=0),
	DepartmentID char(4) references Department(DepartmentID)
);
go
create table Student
(
	StudentID char(12) primary key,
	StudentName char(18) not null,
	Sex char(2) not null check(Sex='男' or Sex='女'),
	Birth date not null,
	HomeAddr varchar(100),
	EntranceTime date default(getdate()),
	ClassID char(8) references Class(ClassID) 
);
go
create table Schedule
(
	TeacherID char(8) references Teacher(TeacherID),
	CourseID char(8) references Course(CourseID),
	ClassID char(8) references Class(ClassID),
	Semester int not null,
	SchoolYear int not null,
	ScheduleIdent varchar(40) not null,
	ClassRoom varchar(20) not null
);
go
create table Grade
(
	CourseID char(8) references Course(CourseID),
	StudentID char(12) references Student(StudentID),
	Semester int,
	SchoolYear int,
	Grade Numeric(5,1)
)


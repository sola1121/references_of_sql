--查詢學生的學號,名字,和所在班級的人數
--方法一:
select studentid, studentname, num from student s
	join (select classid, count(*) num from student group by classid) c  on s.ClassID=c.ClassID

--方法二:
select studentid, studentname, dbo.classNum(class.classid) num from student
	join class on class.ClassID=student.ClassID
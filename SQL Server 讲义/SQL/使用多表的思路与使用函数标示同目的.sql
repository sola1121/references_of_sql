--��ԃ�W���ČW̖,����,�����ڰ༉���˔�
--����һ:
select studentid, studentname, num from student s
	join (select classid, count(*) num from student group by classid) c  on s.ClassID=c.ClassID

--������:
select studentid, studentname, dbo.classNum(class.classid) num from student
	join class on class.ClassID=student.ClassID
delete Student
where StudentName like '王%_' or StudentName like '张%_'  --删除StudentName中姓王或姓张的

-- where StudentName like '[王张]%_'     

-- where left(StudentName,1) in ('张','王')   使用的为精确匹配 
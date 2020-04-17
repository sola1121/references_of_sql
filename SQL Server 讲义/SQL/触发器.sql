delete Student where StudentID='St0109010001' --出錯,因为其中有外键的关联
delete stu where StudentID='2333' --成功
go
alter trigger UN_delete_data on stu
after delete
as 
if exists(select * from grade where StudentID in(select StudentID from deleted))
begin
select * from deleted
rollback
end
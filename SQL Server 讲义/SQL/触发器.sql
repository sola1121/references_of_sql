delete Student where StudentID='St0109010001' --���e,��Ϊ����������Ĺ���
delete stu where StudentID='2333' --�ɹ�
go
alter trigger UN_delete_data on stu
after delete
as 
if exists(select * from grade where StudentID in(select StudentID from deleted))
begin
select * from deleted
rollback
end
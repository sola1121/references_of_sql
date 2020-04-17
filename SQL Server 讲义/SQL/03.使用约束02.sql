create table myorder1(
	orderid int primary key,
	userid int references UserInfor1(userid),
	orderdate datetime default(getdate())
)
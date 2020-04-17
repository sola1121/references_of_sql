create table UserInfor1
(
	userid int primary key identity(1,1),
	username char(25) unique not null check(len(username)>=6),
	password char(16),
	sex char(2)check(sex = 'ÄÐ'or sex = 'Å®'),
	TEL char(11) check(TEL like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
	Email varchar(50)check([Email] like '%_@_%._%'),
	regdate datetime not null default (getdate())
)
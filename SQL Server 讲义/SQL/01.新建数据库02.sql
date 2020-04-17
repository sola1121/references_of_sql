create database Test1
on
(	
	name = 'Test1Data',
	filename = 'd:\SQL server\db\Test1Data.mdf',
	size = 5MB,
	maxsize = 10MB,
	filegrowth = 1MB
	),
(
	name = 'Test2Data',
	filename = 'd:\SQL server\db\Test2Data.ndf',
	size = 5MB,
	maxsize = 10MB,
	filegrowth = 1MB
	)
log on
(
	name = 'Test1Log',
	filename = 'd:\SQL server\db\Test2Log.ldf',
	size = 2MB,
	maxsize = 5MB,
	filegrowth = 20%
)

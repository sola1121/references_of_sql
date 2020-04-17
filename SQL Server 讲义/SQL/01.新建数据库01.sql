create database studentT1
on
( 
	name = 'studentT1_data',
	filename = 'd:\SQL server\db\studentT1_data.mdf',
	size = 5,
	maxsize = 30,
	filegrowth = 10%
)
log on
(
	name = 'studentT1_log',
	filename = 'd:\SQL server\db\studentT1_log.ndf',
	size = 1,
	maxsize = 10,
	filegrowth = 1MB
)
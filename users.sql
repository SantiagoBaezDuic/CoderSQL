use mysql;

/*Creation of the "reader" user and giving it permission to read all tables*/
create user "reader1@localhost" identified by "testpass1234";
grant select on *.* to "reader1@localhost";

/*Creation of the "modifier" user and giving it permission to read, insert and update all tables*/
create user "modifier1@localhost" identified by "testpass12345";
grant select, insert, update on *.* to "modifier1@localhost";

/*Querys to check the users permissions*/
show grants for "reader1@localhost";
show grants for "modifier1@localhost";
select * from user;
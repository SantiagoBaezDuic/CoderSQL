use mysql;
create user "reader1@localhost" identified by "testpass1234";
grant select on *.* to "reader1@localhost";

create user "modifier1@localhost" identified by "testpass12345";
grant select, insert, update on *.* to "modifier1@localhost";

show grants for "modifier1@localhost";
select * from user;
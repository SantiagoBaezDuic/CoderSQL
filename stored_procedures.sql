/*Stored Procedures*/
use ecommerce;
drop procedure if exists sort;
drop procedure if exists deletequery;

DELIMITER //
create procedure sort(
in tabla varchar(30),
in sorter varchar(50),
in direction varchar(4))
begin
	if upper(direction) = "DESC"
    then
	select * from tabla
    order by sorter
    desc;
    else
    select * from tabla
    order by sorter;
    end if;
end
//
/*Allows for selection of all rows sorted by a certain input.*/

DELIMITER //
create procedure deletequery (in tabla varchar(30), in deleteid int)
begin
declare clausula varchar(255);
set @clausula = concat(`delete from `, tabla,` where id = `, deleteid);
prepare runSQL from @clausula;
execute runSQL;
deallocate prepare runSQL;
end
//
/*Allows for row deletion based on index number.*/
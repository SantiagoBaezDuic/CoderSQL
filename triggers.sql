use ecommerce;

/*Trigger tables*/

/*Newsletter*/
create table if not exists Newsletter (
email_id int primary key auto_increment not null unique,
email varchar(40) not null unique
);

/*Price change*/
create table if not exists PriceChange (
operation_id int primary key auto_increment not null unique,
operation_date datetime,
previous_price int,
new_price int,
operation_user varchar(40)
);

/*Trigger declaration*/

/*User insertion trigger(Newsletter)*/
DELIMITER //
create trigger Newsletter_Subscription
before insert on Users
for each row
begin
	if (new.newsletter = true) then
		insert into Newsletter (email) values (new.email);
    end if;
end;
//

/*Price change detection*/
DELIMITER //
create trigger Price_change
after update on Books
for each row
begin
	if (new.price <> old.price) then
		insert into PriceChange (operation_date, previous_price, new_price, operation_user) values (current_timestamp(), old.price, new.price, user());
    end if;
end;
//
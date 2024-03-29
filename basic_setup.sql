/*Database creation and usage setting*/
drop database if exists  ecommerce;
create database if not exists ecommerce;
use ecommerce;

/*
Object creation index:
-Basic tables creation at line 16.
-Triggers declaration at line 111.
-Views creation at line 180.
-Functions creation at line 201.
-Stored procedures creation at line 228.
*/

/*Books table creation*/
create table if not exists Books (
book_ID int primary key auto_increment not null unique,
book_name varchar(50) not null,
author varchar(30),
genre varchar(15),
release_date date,
page_count int,
price int,
stock int
);

/*Authors table creation*/
create table if not exists Authors (
author_ID int primary key auto_increment not null unique,
main_genre varchar(15) not null
);

/*Users table creation*/
create table if not exists Users (
user_ID int primary key auto_increment not null unique,
user_name varchar(50) not null,
user_surname varchar(50) not null,
email varchar(40) not null unique,
pass varchar(15) not null,
address varchar(50),
phone_number int,
newsletter boolean not null
);

/*Admins table creation*/
create table if not exists Admins (
admin_ID int primary key auto_increment not null unique,
admin_name varchar(50) not null,
admin_surname varchar(50) not null,
email varchar(40) not null unique,
pass varchar(15) not null
);

/*Carts table creation*/
create table if not exists Carts (
cart_ID int primary key auto_increment not null unique,
cart_owner varchar(40) not null unique,
products varchar(100)
);

/*Orders table creation*/
create table if not exists Orders (
order_ID int primary key auto_increment not null unique,
order_client varchar(40) not null,
total_price int not null,
product varchar(50) not null,
author varchar(30) not null
);

/*Best selling books table creation*/
create table if not exists Best_Selling_Books (
book_ID int primary key not null unique,
book_name varchar(50) not null,
sold_amount int
);

/*Best selling authors table creation*/
create table if not exists Best_Selling_Authors (
author_ID int primary key auto_increment not null unique,
author_name varchar(50) not null,
sold_amount int
);

/*Addresses table creation*/
create table if not exists Addresses (
address varchar (50) not null unique
);

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

/*Admins email*/
create table if not exists Admins_email (
admin_ID int not null unique primary key,
admin_email varchar(40) not null unique
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

/*Admin email*/
DELIMITER //
create trigger Admin_email
after insert on Admins
for each row
begin
	insert into Admins_email (admin_ID, admin_email) values (new.admin_ID, new.email);
end;
//

/*Sales tracking*/
DELIMITER //
create trigger Sales_tracking
after insert on Books
for each row
begin
	insert into best_selling_books (book_ID, book_name, sold_amount) values (new.book_ID, new.book_name, 0);
end;
//

/*Author Sales*/
DELIMITER //
create trigger Author_sales
after insert on Books
for each row
begin
    if (select exists(select * from best_selling_authors where upper(author_name) = upper(new.author)) = 0)
    then
	insert into best_selling_authors (author_name, sold_amount) values (new.author, 0);
    end if;
end;
//

/*Order Management*/
DELIMITER //
create trigger Order_management
after insert on Orders
for each row
begin
	update best_selling_books set sold_amount = sold_amount + 1 where upper(book_name) = upper(new.product);
    update best_selling_authors set sold_amount = sold_amount + 1 where upper(author_name) = upper(new.author);
end;
//

/*Views*/
create or replace view clients as
	(select order_client from Orders);
    /*Selects all users who bought something.*/
    
create or replace view low_stock as
	(select book_name from Books where stock < 10);
    /*Selects all books that are low on stock.*/
    
create or replace view past_century as
	(select book_name from Books where release_date < "2000-1-1");
    /*Selects all books that were published prior to the year 2000.*/

create or replace view brandon_books as
	(select book_name from Books where author like upper("%brandon sanderson%"));
    /*Selects all books from Brandon Sanderson.*/
    
create or replace view short_books as
	(select book_name, author, page_count from Books where page_count < 500);
    /*Selects all books with a short page count.*/
    
/*Functions*/
drop function if exists discount_price;
drop function if exists books_by_author;

DELIMITER //
create function discount_price(price int, discount int) returns int
deterministic
begin
declare final_price int;
set final_price = (price / 100) * (100 - discount);
return final_price;
end
//
/*Applies a certain discount percentage to every book.*/

DELIMITER //
create function books_by_author(book_author varchar(30), author varchar(30), book_name varchar(50)) returns varchar(50)
deterministic
begin
if upper(author) like upper(book_author)
then return book_name;
else return "";
end if;
end
//
/*Selects all books from a certain author.*/

/*Stored Procedures*/
drop procedure if exists get_low_stock;
drop procedure if exists delete_user;

DELIMITER //
create procedure get_low_stock(in stock_limit int)
begin
	select * from Books where stock <= stock_limit;
end
//
/*Allows for selection of all rows sorted by a certain input.*/

DELIMITER //
create procedure delete_user (in deleteid int)
begin
delete from Users where user_ID = deleteid;
end
//
/*Allows for row deletion based on index number.*/
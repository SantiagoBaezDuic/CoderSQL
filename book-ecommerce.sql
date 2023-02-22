/*Database creation and usage setting*/
drop database if exists  ecommerce;
create database if not exists ecommerce;
use ecommerce;

/*Temática de la base de datos: ecommerce de libros
Finalmente me decante por un ecommerce de libros porque siento que es muy sencillo encontrar ejemplos tanto para productos en sí como precios, categorías, etc.*/

/* Al ser un script de creación e inserción utilizo tanto "if not exists/if exists" como "ignore" respectivamente para la creación e inserción para evitar posibles errores si
se intenta correr un segmento del scripts sobre una base de datos parcialmente llena, esto no debería utilizarse al ingresar datos en una situación real, ya que detectar duplicados es útil en ese caso*/

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
total_price int,
products varchar(100)
);

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

/*Users table insertion*/
insert ignore into Users (user_name, user_surname, email, pass, address, phone_number, newsletter) values ("Pedro", "Pérez", "pedroper@mail.com", "c15235", "Cabildo 1675", 1168913576, true);
insert ignore into Users (user_name, user_surname, email, pass, address, phone_number, newsletter) values ("Miguel", "Fernández", "miguef@mail.com", "c12345", "Panamá 332", 1197451268, true);
insert ignore into Users (user_name, user_surname, email, pass, address, phone_number, newsletter) values ("Valeria", "López", "valel@mail.com", "c68421", "Catamarca 1125", 1146218796, false);
insert ignore into Users (user_name, user_surname, email, pass, address, phone_number, newsletter) values ("Daniel", "Lopez", "danilopez@mail.com", "c96512", "Uruguay 3561", 1121532354, false);
insert ignore into Users (user_name, user_surname, email, pass, address, phone_number, newsletter) values ("Juliana", "Pérez", "julip@mail.com", "c99998", "Brasil 275", 1168945120, true);

/*Admins table insertion*/
insert ignore into Admins (admin_name, admin_surname, email, pass) values ("Julián", "Lowe", "julianlowe@mail.com", "contra123");
insert ignore into Admins (admin_name, admin_surname, email, pass) values ("Romina", "Serrano", "romi_serrano@mail.com", "cafe52");
insert ignore into Admins (admin_name, admin_surname, email, pass) values ("Pilar", "Argit", "argitp1@mail.com", "asdfg13");

/*Books table insertion*/
insert ignore into Books (book_name, author, genre, release_date, page_count, price, stock) values ("El imperio final", "Brandon Sanderson", "Fantasy", "2006-7-17", 541, 8199, 5);
insert ignore into Books (book_name, author, genre, release_date, page_count, price, stock) values ("La comunidad del anillo", "J.R.Tolkien", "Fantasy", "1954-7-29", 479, 2600, 30);
insert ignore into Books (book_name, author, genre, release_date, page_count, price, stock) values ("A game of thrones", "George R.R. Martin", "Fantasy", "1996-8-1", 694, 9611, 10);
insert ignore into Books (book_name, author, genre, release_date, page_count, price, stock) values ("El resplandor", "Stephen King", "Terror", "1977-1-28", 447, 6399, 20);
insert ignore into Books (book_name, author, genre, release_date, page_count, price, stock) values ("El principito", "Saint-Exupery", "Child books", "2006-7-17", 541, 2200, 0);
insert ignore into Books (book_name, author, genre, release_date, page_count, price, stock) values ("El camino de los reyes", "Brandon Sanderson", "Fantasy", "2010-8-31", 1007, 10799, 15);

/*Price change for trigger test*/
update Books set price = 8500 where book_ID = 1;
update Books set price = 6000 where book_ID = 4;

/*Carts table insertion*/
insert ignore into Carts (cart_owner, products) values ("valel@mail.com", "El principito");
insert ignore into Carts (cart_owner, products) values ("danilopez@mail.com", "El principito, A game of thrones");
insert ignore into Carts (cart_owner, products) values ("julip@mail.com", "El resplandor");

/*Orders table insertion*/
insert into Orders (order_client, total_price, products) values ("miguef@mail.com", 10799, "El imperio final, La comunidad del anillo");
insert into Orders (order_client, total_price, products) values ("pedroper@mail.com", 14598, "El imperio final, El resplandor");

/*Views*/
create or replace view clients as
	(select order_client from Orders);
    
create or replace view low_stock as
	(select book_name from Books where stock < 10);
    
create or replace view past_century as
	(select book_name from Books where release_date < "2000-1-1");

create or replace view brandon_books as
	(select book_name from Books where author like upper("%brandon sanderson%"));
    
create or replace view short_books as
	(select book_name, author, page_count from Books where page_count < 500);
    
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

DELIMITER //
create function books_by_author(book_author varchar(30), author varchar(30), book_name varchar(50)) returns varchar(20)
deterministic
begin
if upper(author) like upper(book_author)
then return book_name;
else return null;
end if;
end
//

/*Functions testing*/ 
select discount_price(price, 20) descuento from Books;
select books_by_author("brandon sanderson", author, book_name) from Books;

/*Stored Procedures*/
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

DELIMITER //
create procedure deletequery (in tabla varchar(30), in deleteid int)
begin
declare clausula varchar(255);
set @clausula = concat(`delete from `,tabla,` where id=`,deleteid);
prepare runSQL from @clausula;
execute runSQL;
deallocate prepare runSQL;
end
//

/*Stored procedures testing*/
call sort(`Books`, `release_date`, `desc`);

call deletequery(Users, 3);
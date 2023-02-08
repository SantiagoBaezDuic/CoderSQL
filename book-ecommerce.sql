create database if not exists ecommerce;
use ecommerce;

/*Temática de la base de datos: ecommerce de libros
Finalmente me decante por un ecommerce de libros porque siento que es muy sencillo encontrar ejemplos tanto para productos en sí como precios, categorías, etc.*/

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

create table if not exists Users (
user_ID int primary key auto_increment not null unique,
user_name varchar(50) not null,
user_surname varchar(50) not null,
email varchar(40) not null unique,
pass varchar(15) not null,
address varchar(50),
phone_number int
);

create table if not exists Admins (
admin_ID int primary key auto_increment not null unique,
admin_name varchar(50) not null,
admin_surname varchar(50) not null,
email varchar(40) not null unique,
pass varchar(15) not null
);

create table if not exists Carts (
cart_ID int primary key auto_increment not null unique,
cart_owner varchar(40) not null unique,
products varchar(100)
);

create table if not exists Orders (
order_ID int primary key auto_increment not null unique,
order_client varchar(40) not null,
total_price int,
products varchar(100)
);

/*Users*/
insert into Users (user_name, user_surname, email, pass, address, phone_number) values ("Pedro", "Pérez", "pedroper@mail.com", "c15235", "Cabildo 1675", 1168913576);
insert into Users (user_name, user_surname, email, pass, address, phone_number) values ("Miguel", "Fernández", "miguef@mail.com", "c12345", "Panamá 332", 1197451268);
insert into Users (user_name, user_surname, email, pass, address, phone_number) values ("Valeria", "López", "valel@mail.com", "c68421", "Catamarca 1125", 1146218796);
insert into Users (user_name, user_surname, email, pass, address, phone_number) values ("Daniel", "Lopez", "danilopez@mail.com", "c96512", "Uruguay 3561", 1121532354);
insert into Users (user_name, user_surname, email, pass, address, phone_number) values ("Juliana", "Pérez", "julip@mail.com", "c99998", "Brasil 275", 1168945120);

/*Admins*/
insert into Admins (admin_name, admin_surname, email, pass) values ("Julián", "Lowe", "julianlowe@mail.com", "contra123");
insert into Admins (admin_name, admin_surname, email, pass) values ("Romina", "Serrano", "romi_serrano@mail.com", "cafe52");
insert into Admins (admin_name, admin_surname, email, pass) values ("Pilar", "Argit", "argitp1@mail.com", "asdfg13");

/*Books*/
insert into Books (book_name, author, genre, release_date, page_count, price, stock) values ("El imperio final", "Brandon Sanderson", "Fantasy", "2006-7-17", 541, 8199, 5);
insert into Books (book_name, author, genre, release_date, page_count, price, stock) values ("La comunidad del anillo", "J.R.Tolkien", "Fantasy", "1954-7-29", 479, 2600, 30);
insert into Books (book_name, author, genre, release_date, page_count, price, stock) values ("A game of thrones", "George R.R. Martin", "Fantasy", "1996-8-1", 694, 9611, 10);
insert into Books (book_name, author, genre, release_date, page_count, price, stock) values ("El resplandor", "Stephen King", "Terror", "1977-1-28", 447, 6399, 20);
insert into Books (book_name, author, genre, release_date, page_count, price, stock) values ("El principito", "Saint-Exupery", "Child books", "2006-7-17", 541, 2200, 0);
insert into Books (book_name, author, genre, release_date, page_count, price, stock) values ("El camino de los reyes", "Brandon Sanderson", "Fantasy", "2010-8-31", 1007, 10799, 15);

/*Carts*/
insert into Carts (cart_owner, products) values ("valel@mail.com", "El principito");
insert into Carts (cart_owner, products) values ("danilopez@mail.com", "El principito, A game of thrones");
insert into Carts (cart_owner, products) values ("julip@mail.com", "El resplandor");

/*Orders*/
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
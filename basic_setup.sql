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
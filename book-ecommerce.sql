create database ecommerce;
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
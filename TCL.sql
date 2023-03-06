use ecommerce;
set autocommit = 0;

start transaction;
delete from Books where book_ID = 7;
select * from Books;
/*rollback;*/
/*commit;*/
/*insert ignore into Books (book_name, author, genre, release_date, page_count, price, stock) values ("La metamorfosis", "Franz Kafka", "Relato", "1915-10-01", 70, 1500, 5);*/

select * from Books;

start transaction;
insert into Admins (admin_name, admin_surname, email, pass) values ("Manuel", "Pérez", "manuper@mail.com", "contra1235");
insert into Admins (admin_name, admin_surname, email, pass) values ("Jorge", "Espinoza", "jespi@mail.com", "contra121235");
insert into Admins (admin_name, admin_surname, email, pass) values ("Roberto", "Picci", "roberto@mail.com", "contra1231115");
insert into Admins (admin_name, admin_surname, email, pass) values ("Daniela", "López", "danilopez13@mail.com", "contra1535");
savepoint batch_1;
insert into Admins (admin_name, admin_surname, email, pass) values ("Camila", "Quiroga", "camiquiroga@mail.com", "contra15474");
insert into Admins (admin_name, admin_surname, email, pass) values ("María", "Murphy", "murphy125@mail.com", "contra12462");
insert into Admins (admin_name, admin_surname, email, pass) values ("Luis", "Perales", "jperales@mail.com", "contra12523");
insert into Admins (admin_name, admin_surname, email, pass) values ("Ariel", "Minte", "arielminte2@mail.com", "contra34637");
savepoint batch_2;

/*release batch_1;*/
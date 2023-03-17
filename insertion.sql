use ecommerce;

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
insert ignore into Books (book_name, author, genre, release_date, page_count, price, stock) values ("La metamorfosis", "Franz Kafka", "Relato", "1915-10-01", 70, 1500, 5);

/*Carts table insertion*/
insert ignore into Carts (cart_owner, products) values ("valel@mail.com", "El principito");
insert ignore into Carts (cart_owner, products) values ("danilopez@mail.com", "El principito, A game of thrones");
insert ignore into Carts (cart_owner, products) values ("julip@mail.com", "El resplandor");

/*Orders table insertion*/
insert into Orders (order_client, total_price, product, author) values ("miguef@mail.com", 10799, "El imperio final", "Brandon Sanderson");
insert into Orders (order_client, total_price, product, author) values ("miguef@mail.com", 10799, "La comunidad del anillo", "J.R.Tolkien");
insert into Orders (order_client, total_price, product, author) values ("pedroper@mail.com", 14598, "El imperio final", "Brandon Sanderson");
insert into Orders (order_client, total_price, product, author) values ("pedroper@mail.com", 14598, "El resplandor", "Stephen King");
use ecommerce;

/*Price change for trigger test*/
update Books set price = 8500 where book_ID = 1;
update Books set price = 6000 where book_ID = 4;

/*Functions testing*/ 
select discount_price(price, 20) descuento from Books;
select books_by_author("brandon sanderson", author, book_name) from Books;

/*Stored procedures testing*/
call get_low_stock(10);

call delete_user(3);
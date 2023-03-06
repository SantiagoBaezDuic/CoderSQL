use ecommerce;

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
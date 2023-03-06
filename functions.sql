use ecommerce;

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
create function books_by_author(book_author varchar(30)) returns varchar(20)
deterministic
begin
if upper(author) like upper(book_author)
then return book_name;
else return null;
end if;
end
//
/*Selects all books from a certain author.*/
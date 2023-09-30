CREATE TABLE readers (
reader_tickets_number int PRIMARY KEY,
fio varchar,
phone_number int,
adress varchar
);

CREATE TABLE publisher (
id serial PRIMARY KEY,
name varchar,
city varchar
);

CREATE TABLE books (
books_cipher bigint PRIMARY KEY,
name varchar,
pub_year date,
size smallint,
price money,
amount int,
publisher_id int,
FOREIGN KEY (publisher_id) REFERENCES publisher (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE authors (
id serial PRIMARY KEY,
fio varchar,
nickname varchar
);

CREATE TABLE books_authors (
id serial PRIMARY KEY,
books_id int,
authors_id int,
FOREIGN KEY (books_id) REFERENCES books (books_cipher) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (authors_id) REFERENCES authors (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE rented_books (
id serial PRIMARY KEY,
reader_tickets_number int,
books_id int,
rent_status bool,
FOREIGN KEY (reader_tickets_number) REFERENCES readers (reader_tickets_number) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (books_id) REFERENCES books (books_cipher) ON DELETE CASCADE ON UPDATE CASCADE
);


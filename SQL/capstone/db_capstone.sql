DROP DATABASE IF EXISTS sql_capstone;
CREATE DATABASE sql_capstone;


USE sql_capstone;


DROP TABLE IF EXISTS discounts;
CREATE TABLE discounts(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE,
    discount FLOAT UNIQUE
);


DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY, 
    discount_id BIGINT UNSIGNED NOT NULL,
    email VARCHAR(120) UNIQUE,
    FOREIGN KEY (discount_id) REFERENCES discounts(id)
);


DROP TABLE IF EXISTS authors;
CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    INDEX authors_firstname_lastname_idx(firstname, lastname)
);


DROP TABLE IF EXISTS genres;
CREATE TABLE genres(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE
);


DROP TABLE IF EXISTS book_types;
CREATE TABLE book_types(
    id SERIAL PRIMARY KEY,
    name ENUM('бумажная','электронная','аудио')
);


DROP TABLE IF EXISTS sales;
CREATE TABLE sales(
  id SERIAL PRIMARY KEY,
  discount FLOAT UNSIGNED,
  name VARCHAR(50) UNIQUE NOT NULL,
  started_at DATETIME,
  finished_at DATETIME,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX name_idx(name)
);


DROP TABLE IF EXISTS books;
CREATE TABLE books(
    id SERIAL PRIMARY KEY,
    name VARCHAR(120),
    book_type_id BIGINT UNSIGNED NOT NULL,
    author_id BIGINT UNSIGNED NOT NULL,
    genre_id BIGINT UNSIGNED NOT NULL,
    ISBN VARCHAR(13) UNIQUE NOT NULL,
    price DECIMAL(11,2) NOT NULL,  
    sales_id BIGINT UNSIGNED,
    FOREIGN KEY (book_type_id) REFERENCES book_types(id),
    FOREIGN KEY (author_id) REFERENCES authors(id),
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    FOREIGN KEY (sales_id) REFERENCES sales(id),
    INDEX name_author_idx(name, author_id),
    INDEX genre_id_idx(genre_id),
    INDEX ISBN_idx(ISBN)
);


DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  user_id BIGINT UNSIGNED NOT NULL,
  total INT UNSIGNED DEFAULT 1,
  status ENUM ('Размещен','Оплачен','Доставлен'),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);


DROP TABLE IF EXISTS orders_books;
CREATE TABLE orders_books (
  id SERIAL PRIMARY KEY,
  order_id BIGINT UNSIGNED NOT NULL,
  book_id BIGINT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (book_id) REFERENCES books(id)
);

DROP TABLE IF EXISTS reviews;
CREATE TABLE reviews(
    id SERIAL PRIMARY KEY,
    reviewer_name VARCHAR(120),
    book_id BIGINT UNSIGNED NOT NULL,
    review_text TEXT,
    FOREIGN KEY (book_id) REFERENCES books(id),
    INDEX book_id_idx(book_id)
);

/*
 * Вывод всех книг с указанием автора, жанра и цены 
 */

CREATE OR REPLACE VIEW books_agp AS 
SELECT 
b.id,
b.name, 
concat(firstname,' ', lastname) AS author,
g.name AS genre,
round(b.price*(1-s.discount),2) AS price 
FROM books AS b
JOIN authors AS a 
ON  a.id=b.author_id
JOIN genres AS g
ON g.id = b.genre_id
LEFT JOIN sales AS s
ON b.sales_id = s.id;

SELECT * FROM books_agp;

/*
 * Вывод 10 самых продаваемых книг.
 */

CREATE OR REPLACE VIEW top_ordered_10 AS 
SELECT b.name, count(b.name) AS ordered_times
FROM orders_books AS ob
LEFT JOIN orders AS o
ON ob.order_id = o.id
LEFT JOIN books AS b 
ON ob.book_id = b.id
WHERE o.status = 'Оплачен'
GROUP BY b.name
ORDER BY ordered_times DESC
LIMIT 10;

/* 
 *  Процедура поиска книг по названию
 */

delimiter //
DROP PROCEDURE IF EXISTS particular_book//
CREATE PROCEDURE particular_book(IN book_name VARCHAR(255))
    BEGIN 
        SELECT bag.name,bt.name, bag.author,bag.genre,bag.price FROM books_agp AS bag
        LEFT JOIN books AS b ON b.id = bag.id
        LEFT JOIN book_types AS bt ON b.book_type_id = bt.id
        WHERE bag.name LIKE book_name;
    END //

/*
 * Тригер пересчета колонки total перед обновлением 
 */

DROP TRIGGER IF EXISTS total_counting // 
CREATE TRIGGER total_counting BEFORE UPDATE ON orders
FOR EACH ROW BEGIN 
    DECLARE raw_total INT;
    SELECT count(book_id) FROM orders_books WHERE order_id = id INTO raw_total;
    IF raw_total != NEW.total THEN 
        SET NEW.total = raw_total;
    END IF; 
END//

/*
 * Процедура вывода всех книг купленных пользователем
 */

DROP PROCEDURE IF EXISTS get_user_books //
CREATE PROCEDURE get_user_books(IN set_email VARCHAR(120))
BEGIN 
    DECLARE set_uid BIGINT;
    SELECT id FROM users WHERE set_email = email INTO set_uid;
    SELECT b.name FROM orders AS o
    JOIN orders_books AS ob ON o.id = ob.order_id 
    JOIN books AS b ON b.id = ob.book_id
    WHERE o.user_id = set_uid AND (o.status = 'Оплачен' OR o.status = 'Доставлен');
END //
delimiter ;



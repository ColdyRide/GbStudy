DROP DATABASE IF EXISTS example;
CREATE DATABASE example;

USE example;

/*
Урок 5 задание 1
Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
*/
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');
  
UPDATE users SET created_at = now(), updated_at = now();

SELECT * FROM users;

/*
Урок 5 задание 2
Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.
*/
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(255),
  updated_at VARCHAR(255)
) COMMENT = 'Покупатели';


INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('Геннадий', '1990-10-05','20.10.2017 8:10','20.10.2017 8:10'),
  ('Наталья', '1984-11-12','20.10.2017 8:10','20.10.2017 8:10'),
  ('Александр', '1985-05-20','20.10.2017 8:10','20.10.2017 8:10'),
  ('Сергей', '1988-02-14','20.10.2017 8:10','20.10.2017 8:10'),
  ('Иван', '1998-01-12','20.10.2017 8:10','20.10.2017 8:10'),
  ('Мария', '1992-08-29','20.10.2017 8:10','20.10.2017 8:10');
  

UPDATE users 
    SET created_at = str_to_date(created_at, '%d.%m.%Y %h:%i' ),
        updated_at = str_to_date(updated_at, '%d.%m.%Y %h:%i' );

ALTER TABLE users MODIFY created_at DATETIME,
                  MODIFY updated_at DATETIME;

SELECT * FROM users;
/*
Урок 5 задание 3
В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, 
если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, 
чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.
*/
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе'
) COMMENT = 'Запасы на складе';

INSERT storehouses_products (value) VALUES
(0),
(2500),
(0),
(30),
(500),
(1);

SELECT value FROM storehouses_products ORDER BY value = 0, value;

/*
Урок 5 задание 4
(по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. Месяцы заданы в виде списка английских названий ('may', 'august')
*/

SELECT name, monthname(birthday_at) FROM users WHERE monthname(birthday_at) in ('may', 'august'); 

/*
Урок 5 задание 5
(по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.
*/
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела',
  UNIQUE unique_name(name(10))
) COMMENT = 'Разделы интернет-магазина';

INSERT catalogs(name) VALUES
  ('Процессоры'),
  ('Материнские платы'),
  ('Видеокарты'),
  ('Жесткие диски'),
  ('Оперативная память');
  
SELECT * FROM catalogs WHERE id IN (5, 1, 2) ORDER BY id=5 DESC;


/*
Урок 5 задание 6
Подсчитайте средний возраст пользователей в таблице users
*/

SELECT avg(TIMESTAMPDIFF(YEAR, birthday_at, NOW())) AS Average_users_age FROM users;

/*
Урок 5 задание 7
Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.
*/
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Оля', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Олег', '1998-01-12'),
  ('Мария', '1992-08-29');


SELECT dayname(concat(YEAR(now()),date_format(birthday_at, '-%m-%d'))) AS name_of_day,
       count(*) AS birthday_count
FROM users
GROUP BY name_of_day;

/*
Урок 5 задание 8
(по желанию) Подсчитайте произведение чисел в столбце таблицы
*/
DROP TABLE IF EXISTS `values`;
CREATE TABLE `values` (
value bigint NOT NULL 
);

INSERT `values` VALUES 
(1),
(2),
(3),
(4),
(5);

SELECT exp(sum(ln(value))) AS multiply_all_values FROM `values`;



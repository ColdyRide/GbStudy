/*Урок №5, Задание №3 
 * В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
 * 0, если товар закончился и выше нуля, если на складе имеются запасы. 
 * Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
 * Однако, нулевые запасы должны выводиться в конце, после всех записей.
 */
-- создание базы данных
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
-- выбор базы данных
USE shop;
-- создаем таблицу и её структуру
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
    id SERIAL,
    name VARCHARACTER(50) UNIQUE,
    value bigint UNSIGNED
);
-- наполняем
INSERT INTO storehouses_products(name, value) VALUES 
    ('somethink_1',1),
    ('somethink_2',26),
    ('somethink_3',0),
    ('somethink_4',50);

-- решение задания           
SELECT
name,
value
FROM storehouses_products
ORDER BY value = 0, value;


        
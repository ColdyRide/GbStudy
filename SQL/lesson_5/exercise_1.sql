/*Урок №5, Задание №1 
 * Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем. 
 */
# -- создание базы данных
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
# -- выбор базы данных
USE example;
# -- создаем таблицу и её структуру
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL,
    name VARCHARACTER(50) UNIQUE
);
# -- наполняем
INSERT INTO users(name) VALUES 
    ('Денис'),
    ('Denis'),
    ('Den');
-- модифицируем
ALTER TABLE users ADD COLUMN created_at datetime;
ALTER TABLE users ADD COLUMN updated_at datetime;

UPDATE users SET
            created_at = now(),
            updated_at = now()
        WHERE id > 0;
SELECT * FROM users;
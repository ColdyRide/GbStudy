/*Урок №1, Задание №2 
 * Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name. 
 */
# -- создание базы данных
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
# -- выбор базы данных
USE example;
# -- создаем таблицу и её структуру
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL UNIQUE,
    name VARCHARACTER(50) UNIQUE
);
# -- наполняем
INSERT INTO users(name) VALUES 
    ('Денис'),
    ('Denis'),
    ('Den');
# -- проверяем
SELECT * FROM users;

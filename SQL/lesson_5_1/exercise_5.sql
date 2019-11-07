/*Урок №5, Задание №4 
 * (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
 * Месяцы заданы в виде списка английских названий ('may', 'august') 
 */

-- создание базы данных

DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;

-- выбор базы данных

USE shop;

-- создаем таблицу и её структуру

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
    id SERIAL,
    name VARCHARACTER(50) UNIQUE
);

-- наполняем

INSERT INTO catalogs(name) VALUES 
    ('test1'),
    ('test2'),
    ('test3'),
    ('test4'),
    ('test5');

--  решение задания           

SELECT * FROM catalogs
WHERE id IN (5,1,2)
ORDER BY field(id,5,1,2)
        
        
        
        
        
        
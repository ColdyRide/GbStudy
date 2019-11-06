/*Урок №5, Задание №2 
 * Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
 * Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения. 
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
ALTER TABLE users ADD COLUMN created_at VARCHARACTER(50);
ALTER TABLE users ADD COLUMN updated_at VARCHARACTER(50);

UPDATE users SET
            created_at = '20.10.2017 8:10',
            updated_at = '20.10.2017 8:10'
        WHERE id > 0;

--  решение задания           

UPDATE users SET 
    created_at = str_to_date(created_at, '%d.%m.%Y %k:%i'),
    updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');
ALTER TABLE users MODIFY created_at datetime;
ALTER TABLE users MODIFY updated_at datetime; 
SELECT * FROM users;
        
        
        
        
        
        
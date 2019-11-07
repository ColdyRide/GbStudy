/*Урок №5, Задание №4 
 * (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
 * Месяцы заданы в виде списка английских названий ('may', 'august') 
 */

-- создание базы данных

DROP DATABASE IF EXISTS example;
CREATE DATABASE example;

-- выбор базы данных

USE example;

-- создаем таблицу и её структуру

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL,
    name VARCHARACTER(50) UNIQUE
);

-- наполняем

INSERT INTO users(name) VALUES 
    ('Денис'),
    ('Denis'),
    ('Den');

-- модифицируем

ALTER TABLE users ADD COLUMN birthday_at DATE;

UPDATE users
    SET
        birthday_at = DATE('20.08.2017')
    WHERE id=1;
UPDATE users
    SET
        birthday_at = DATE('20.10.2017')
    WHERE id=2;
UPDATE users
    SET
        birthday_at = DATE('20.05.2017')
    WHERE id=3;

--  решение задания           

SELECT * FROM users
WHERE DATE_FORMAT(birthday_at,'%M') IN ('may','august')

        
        
        
        
        
        
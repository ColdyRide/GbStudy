/*Урок №1, 
Задание № 1 Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
MySQL установлен, my.cnf успешно сконфигурирован 

ЛИСТИНГ КОМАНДНОЙ СТРОКИ:

c:\Program Files\MySQL\MySQL Server 8.0\bin>mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 8.0.18 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql>



Задание №2 
Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name. 
 */
# -- создание базы данных
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
# -- выбор базы данных
USE example;
# -- создаем таблицу и её структуру
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);
# -- наполняем
INSERT INTO users(name) VALUES 
    ('Денис'),
    ('Denis'),
    ('Den');
# -- проверяем
SELECT * FROM users;


/* Задание №3 
 Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
 
 ЛИСТИНГ КОМАНДНОЙ СТРОКИ:
 
mysql> create database sample;
Query OK, 1 row affected (0.01 sec)

mysql> use sample
Database changed
mysql> show tables;
Empty set (0.00 sec)

mysql> exit
Bye

c:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump --opt example > "d:\GB Study\GbStudy\SQL\lesson_1\backup_example.sql"

c:\Program Files\MySQL\MySQL Server 8.0\bin>mysql sample < "d:\GB Study\GbStudy\SQL\lesson_1\backup_example.sql"

c:\Program Files\MySQL\MySQL Server 8.0\bin>mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 28
Server version: 8.0.18 MySQL Community Server - GPL

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use sample
Database changed
mysql> show tables;
+------------------+
| Tables_in_sample |
+------------------+
| users            |
+------------------+
1 row in set (0.00 sec)
*/


/*
Задание №4 
(по желанию) Ознакомьтесь более подробно с документацией утилиты mysqldump. 
Создайте дамп единственной таблицы help_keyword базы данных mysql. Причем добейтесь того, чтобы дамп содержал только первые 100 строк таблицы.

ЛИСТИНГ КОМАНДНОЙ СТРОКИ для 100 строк:
c:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump mysql --tables help_keyword "--where=true limit 100" > "d:\GB Study\GbStudy\SQL\lesson_1\hk_backup_random.sql"

ЛИСТИНГ КОМАНДНОЙ СТРОКИ для первых 100 строк:
c:\Program Files\MySQL\MySQL Server 8.0\bin>mysqldump mysql --tables help_keyword "--where=help_keyword_id<100" > "d:\GB Study\GbStudy\SQL\lesson_1\hk_backup_ordered.sql"

*/

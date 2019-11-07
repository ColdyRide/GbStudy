/*Урок №5 часть 2, Задание №1 
Подсчитайте средний возраст пользователей в таблице users
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
    birthday_at DATE,
    name VARCHARACTER(50) UNIQUE
);
# -- наполняем

-- Generation time: Thu, 07 Nov 2019 08:41:23 +0000
-- Host: mysql.hostinger.ro
-- DB name: u574849695_22
/*!40030 SET NAMES UTF8 */;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `birthday_at` date DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `users` VALUES ('1','2006-05-26','veniam'),
('2','2000-01-20','voluptates'),
('3','1984-12-26','quia'),
('4','1973-04-07','perferendis'),
('5','2013-12-18','ea'),
('6','1990-07-04','nobis'),
('7','1990-03-26','voluptas'),
('8','2009-03-09','totam'),
('9','2001-05-26','occaecati'),
('10','2009-06-12','assumenda'),
('11','1974-12-20','neque'),
('12','2003-02-24','ipsam'),
('13','2013-12-01','dolores'),
('14','1998-03-15','aliquid'),
('15','1979-10-11','qui'),
('16','1978-03-08','dolore'),
('17','2001-10-11','nihil'),
('18','1998-11-05','non'),
('19','2008-06-21','dignissimos'),
('20','2011-03-20','voluptatibus'); 




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--  решение задания           

        
 SELECT avg(DATEDIFF(now(),birthday_at) DIV 365.25) AS avg_old FROM users

        
        
        
        
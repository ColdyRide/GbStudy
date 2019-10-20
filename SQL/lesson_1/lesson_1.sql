/*���� �1, ������� �2 
 * �������� ���� ������ example, ���������� � ��� ������� users, ��������� �� ���� ��������, ��������� id � ���������� name. 
 */
# -- �������� ���� ������
DROP DATABASE IF EXISTS example;
CREATE DATABASE example;
# -- ����� ���� ������
USE example;
# -- ������� ������� � � ���������
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT UNSIGNED AUTO_INCREMENT NOT NULL UNIQUE,
    name VARCHARACTER(50) UNIQUE
);
# -- ���������
INSERT INTO users(name) VALUES 
    ('�����'),
    ('Denis'),
    ('Den');
# -- ���������
SELECT * FROM users;

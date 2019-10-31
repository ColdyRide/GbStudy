/*
 * Домашнее задание к вебинару по CRUD 
 */

/*
 * Создание базы данных
 */
DROP DATABASE IF EXISTS vk;
CREATE DATABASE vk;
USE vk;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE,
    phone BIGINT, 
    INDEX users_phone_idx(phone),
    INDEX users_firstname_lastname_idx(firstname, lastname)
    
);

DROP TABLE IF EXISTS `profiles`;
CREATE TABLE `profiles` (
    user_id SERIAL PRIMARY KEY,
    gender CHAR(1),
    birthday DATE,
    photo_id BIGINT UNSIGNED NULL,
    created_at DATETIME DEFAULT NOW(),
    hometown VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(id) 
        ON UPDATE CASCADE
        ON DELETE restrict
);

DROP TABLE IF EXISTS messages;
CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    from_user_id BIGINT UNSIGNED NOT NULL,
    to_user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(),
    INDEX messages_from_user_id (from_user_id),
    INDEX messages_to_user_id (to_user_id),
    FOREIGN KEY (from_user_id) REFERENCES users(id),
    FOREIGN KEY (to_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS friend_requests;
CREATE TABLE friend_requests (
    initiator_user_id BIGINT UNSIGNED NOT NULL,
    target_user_id BIGINT UNSIGNED NOT NULL,
    status ENUM('requested', 'approved', 'unfriended', 'declined'),
    requested_at DATETIME DEFAULT NOW(),
    confirmed_at DATETIME,
    PRIMARY KEY (initiator_user_id, target_user_id),
    INDEX (initiator_user_id),
    INDEX (target_user_id),
    FOREIGN KEY (initiator_user_id) REFERENCES users(id),
    FOREIGN KEY (target_user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS communities;
CREATE TABLE communities(
    id SERIAL PRIMARY KEY,
    name VARCHAR(150),
    INDEX communities_name_idx(name)
);

DROP TABLE IF EXISTS users_communities;
CREATE TABLE users_communities(
    user_id BIGINT UNSIGNED NOT NULL,
    community_id BIGINT UNSIGNED NOT NULL,
  
    PRIMARY KEY (user_id, community_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (community_id) REFERENCES communities(id)
);

DROP TABLE IF EXISTS media_types;
CREATE TABLE media_types(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
    id SERIAL PRIMARY KEY,
    media_type_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    body text,
    filename VARCHAR(255),
    size INT,
    metadata JSON,
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    INDEX (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (media_type_id) REFERENCES media_types(id)
);

DROP TABLE IF EXISTS likes;
CREATE TABLE likes(
    id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    media_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW()

);

DROP TABLE IF EXISTS `photo_albums`;
CREATE TABLE `photo_albums` (
    id SERIAL,
    name varchar(255) DEFAULT NULL,
    user_id BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS `photos`;
CREATE TABLE `photos` (
    id SERIAL PRIMARY KEY,
    album_id BIGINT unsigned NOT NULL,
    media_id BIGINT unsigned NOT NULL,

    FOREIGN KEY (album_id) REFERENCES photo_albums(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);


/*
 * Примеры CRUD операций
 */

INSERT INTO users (id,firstname,lastname,email,phone) VALUES
(1,'Denis','Karpov','test@mail.ru',9145678941);

SELECT firstname,lastname FROM users
WHERE id = 1;

INSERT INTO users (firstname,lastname,email,phone) VALUES
('den','kar','te@mail.ru',8965678905),
('Denis','Karpov','tes1t@mail.ru',9145678941)
;

SELECT DISTINCT firstname,lastname FROM users;

SELECT * FROM users;

SELECT firstname FROM users WHERE TRUE LIMIT 1 offset 1;

INSERT INTO messages 
    SET
        from_user_id = 1,
        to_user_id = 2,
        body = 'dfsfdsfsdgdsgdsgsdfsdafasdefergdvs',
        created_at = now()
;

DELETE FROM messages;

INSERT INTO messages 
    SET
        from_user_id = 2,
        to_user_id = 1,
        body = 'dfsfdsfsdgdsgdsgsdfsdafasdefergdvs',
        created_at = now()
;

INSERT INTO friend_requests (initiator_user_id, target_user_id, status)
VALUES ('1', '2', 'requested');

INSERT INTO friend_requests (initiator_user_id, target_user_id, status)
VALUES ('1', '3', 'requested');

UPDATE friend_requests 
    SET
        status = 'approved',
        confirmed_at = now()
WHERE 
    initiator_user_id = 1 AND target_user_id = 2 and status = 'requested';
    
SELECT * FROM messages;

truncate TABLE messages;

INSERT INTO messages 
    SET
        from_user_id = 2,
        to_user_id = 1,
        body = 'dfsfdsfsdgdsgdsgsdfsdafasdefergdvs',
        created_at = now()
;

SELECT * FROM messages;
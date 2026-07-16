CREATE DATABASE IF NOT EXISTS NIET;

USE NIET;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    gender VARCHAR(20) NOT NULL,
    city VARCHAR(100) NOT NULL
);

INSERT INTO users (name, email, password, gender, city)
VALUES ('Student User', 'student@n123.com', 'password123', 'Male', 'Noida')
ON DUPLICATE KEY UPDATE
    name = VALUES(name),
    password = VALUES(password),
    gender = VALUES(gender),
    city = VALUES(city);

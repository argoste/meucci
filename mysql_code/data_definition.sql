-- MySQL syntax
CREATE DATABASE pergamos;
USE pergamos;

CREATE TABLE books (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  title VARCHAR(200),
  series VARCHAR(100),
  authors VARCHAR(200),
  category_id ENUM,
  PRIMARY KEY (id)
);

CREATE TABLE category (
  id INT NOT NULL,
  name VARCHAR(100),
  PRIMARY KEY (id)
);

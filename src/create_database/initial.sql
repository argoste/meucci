-- create a database to play with
CREATE DATABASE pergamos;
CREATE USER 'librarian'@'localhost' IDENTIFIED BY '*****';
-- give librarian access to database
GRANT ALL ON foo.* TO 'librarian';

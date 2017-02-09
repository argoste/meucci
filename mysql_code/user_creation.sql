-- MySQL syntax
-- I will create an user to manage the database
CREATE USER 'librarian'@'localhost' IDENTIFIED BY 'samovar37URS';
GRANT ALL ON pergamos.*
TO 'librarian'
IDENTIFIED BY 'samovar37URS';

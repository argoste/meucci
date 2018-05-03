--    One to many relationship: create a foreign key from an entity table to the other,
--    Many to many relationship: create a junction table,
--    One to one relationship: just merge the two tables.

-- AUTO_INCREMENT data type is simply a INTEGER data type that is automatically  incremented
-- equivalent to use AUTO_INCREMENT in MySQL


USE meucci;

CREATE TABLE monography (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL
);

CREATE TABLE author (
  id INT AUTO_INCREMENT PRIMARY KEY,
  authorname VARCHAR(100) NOT NULL
);
-- The subject is an Universal Decimal Classification Class
CREATE TABLE `subject` (
  id INT AUTO_INCREMENT PRIMARY KEY ,
  caption VARCHAR(1000) NOT NULL
);
-- a specimen, a sample of  a monography
CREATE TABLE physicalcopy (
  id INT PRIMARY KEY ,
  monography_id INT NOT NULL
  CONSTRAINT copy_fk FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE RESTRICT
);

-- This is  a Junction table
CREATE TABLE monography_author (
  id INT AUTO_INCREMENT PRIMARY KEY,
  monography_id INTEGER NOT NULL ,
  author_id INT NOT NULL,
  CONSTRAINT monography_author_fk2 FOREIGN KEY (monography_id) REFERENCES monography(id) 
  ON UPDATE NO ACTION 
  ON DELETE RESTRICT,
  CONSTRAINT monography_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id) 
  ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- This is  a Junction table
CREATE TABLE monography_subject (
  id INT AUTO_INCREMENT PRIMARY KEY ,
  monography_id INTEGER NOT NULL ,
  subject_id INT NOT NULL,
  CONSTRAINT monography_subject_fk1 FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT monography_subject_fk2 FOREIGN KEY (subject_id) REFERENCES subject(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);


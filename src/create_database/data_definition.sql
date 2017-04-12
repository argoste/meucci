-- MySQL syntax
--    One to many relationship: create a foreign key from an entity table to the other,
--    Many to many relationship: create a junction table,
--    One to one relationship: just merge the two tables.

USE pergamos;

CREATE TABLE monography (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(200) NOT NULL,
  pub_year DECIMAL,
  PRIMARY KEY (id)
);

CREATE TABLE descriptor (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  explanation VARCHAR(500),
  PRIMARY KEY (id)
);

CREATE TABLE copy (
  -- this table forms the inventory
  id INT NOT NULL AUTO_INCREMENT,
  monography_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (monography_id) REFERENCES monography(id)
);

CREATE TABLE author (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  PRIMARY KEY (id)
);
-- This is  a Junction table
CREATE TABLE author_monography (
  author_id INT NOT NULL,
  monography_id INT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (monography_id) REFERENCES monography(id)
);

-- This is  a Junction table
CREATE TABLE descriptor_monography (
  descriptor_id INT NOT NULL,
  monography_id INT NOT NULL,
  FOREIGN KEY (descriptor_id) REFERENCES descriptor(id),
  FOREIGN KEY (monography_id) REFERENCES monography(id)
);

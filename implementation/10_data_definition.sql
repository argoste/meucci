-- I assume to be logged as role 'ste'
-- (role is Postgres word for either an user or a group_of_users)
--
-- you can run it from a  shell with
-- ```psql --file=10_data_definition.sql```
-- if this is run by `psql` client I assume it has
-- \set AUTOCOMMIT OF


DROP DATABASE meucci;
CREATE DATABASE meucci;
BEGIN TRANSACTION;
-- connect to this database (MySQL `use` command )
\connect meucci

--    One to many relationship: create a foreign key from an entity table to the other,
--    Many to many relationship: create a junction table,
--    One to one relationship: just merge the two tables.

-- SERIAL data type is simply a INTEGER data type that is automatically  incremented
-- equivalent to use AUTO_INCREMENT in MySQL

CREATE TABLE monography (
  id SERIAL NOT NULL,
  title character varying(100) NOT NULL,
  CONSTRAINT monography_pk PRIMARY KEY (id)
);

CREATE TABLE author (
  id SERIAL NOT NULL,
  authorname character varying(100) NOT NULL,
  CONSTRAINT author_pk PRIMARY KEY (id)
);
-- The subject is an Universal Decimal Classification Class
CREATE TABLE subject (
  id SERIAL NOT NULL ,
  caption character varying(1000) NOT NULL ,
  CONSTRAINT subject_pk PRIMARY KEY (id)
);
-- a specimen, a sample of  a monography
CREATE TABLE physicalcopy (
  id SERIAL NOT NULL ,
  monography_id INTEGER NOT NULL,
  CONSTRAINT copy_pk PRIMARY KEY (id),
  CONSTRAINT copy_fk FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE RESTRICT
);

-- This is  a Junction table
CREATE TABLE monography_author (
  id SERIAL NOT NULL,
  monography_id INTEGER NOT NULL ,
  author_id INTEGER NOT NULL,
  CONSTRAINT monography_author_pk PRIMARY KEY (id),
  CONSTRAINT monography_author_fk2 FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE RESTRICT,
  CONSTRAINT monography_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);

-- This is  a Junction table
CREATE TABLE monography_subject (
  id SERIAL NOT NULL ,
  monography_id INTEGER NOT NULL ,
  subject_id INTEGER NOT NULL,
  CONSTRAINT monography_subject_pk PRIMARY KEY (id),
  CONSTRAINT monography_subject_fk1 FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT monography_subject_fk2 FOREIGN KEY (subject_id) REFERENCES subject(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);
COMMIT;

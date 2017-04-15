CREATE TABLE author (
  id decimal NOT NULL ,
  completename character varying(100) NOT NULL 
);

-- 
ALTER TABLE author ADD CONSTRAINT author_pk PRIMARY KEY (id);

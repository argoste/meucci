--    One to many relationship: create a foreign key from an entity table to the other,
--    Many to many relationship: create a junction table,
--    One to one relationship: just merge the two tables.


CREATE TABLE monography (
  id SERIAL PRIMARY KEY ,
  title character varying(100) NOT NULL
);

CREATE TABLE author (
  id SERIAL PRIMARY KEY,
  completename character varying(100) NOT NULL
);

-- This is  a Junction table
CREATE TABLE monography_author (
  id SERIAL PRIMARY KEY,
  monography_id decimal NOT NULL ,
  author_id decimal NOT NULL
  CONSTRAINT monography_author_pk PRIMARY KEY (id),
  CONSTRAINT monography_author_fk2 FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE RESTRICT,
  CONSTRAINT monography_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id) ON UPDATE NO ACTION ON DELETE NO ACTION
);



CREATE TABLE tag (
  id decimal NOT NULL ,
  name character varying(30) NOT NULL ,
  explanation character varying(300) NOT NULL
);
ALTER TABLE tag ADD CONSTRAINT tag_pk PRIMARY KEY (id);

-- This is  a Junction table
CREATE TABLE monography_tag (
  id decimal NOT NULL ,
  monography_id decimal NOT NULL ,
  tag_id decimal NOT NULL
);
ALTER TABLE monography_tag ADD CONSTRAINT monography_tag_pk PRIMARY KEY (id);
ALTER TABLE monography_tag ADD CONSTRAINT monography_tag_fk1 FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE monography_tag ADD CONSTRAINT monography_tag_fk2 FOREIGN KEY (tag_id) REFERENCES tag(id) ON UPDATE NO ACTION ON DELETE NO ACTION;


CREATE TABLE copy (
  id decimal NOT NULL ,
  monography_id decimal NOT NULL
);
ALTER TABLE copy ADD CONSTRAINT copy_pk PRIMARY KEY (id);
ALTER TABLE copy ADD CONSTRAINT copy_fk FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE RESTRICT;

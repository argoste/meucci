CREATE TABLE monography_author (
  id decimal NOT NULL ,
  monography_id decimal NOT NULL ,
  author_id decimal NOT NULL 
);

-- 
ALTER TABLE monography_author ADD CONSTRAINT new_unique_constraint PRIMARY KEY (id);

-- 
ALTER TABLE monography_author ADD CONSTRAINT monography_author_fk2 FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE RESTRICT;

-- 
ALTER TABLE monography_author ADD CONSTRAINT monography_author_fk1 FOREIGN KEY (author_id) REFERENCES author(id) ON UPDATE NO ACTION ON DELETE NO ACTION;

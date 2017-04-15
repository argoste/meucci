CREATE TABLE copy (
  id decimal NOT NULL ,
  monography_id decimal NOT NULL 
);

-- 
ALTER TABLE copy ADD CONSTRAINT copy_pk PRIMARY KEY (id);

-- 
ALTER TABLE copy ADD CONSTRAINT copy_fk FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE RESTRICT;

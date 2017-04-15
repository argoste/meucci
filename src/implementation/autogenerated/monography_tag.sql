CREATE TABLE monography_tag (
  id decimal NOT NULL ,
  monography_id decimal NOT NULL ,
  tag_id decimal NOT NULL 
);

-- 
ALTER TABLE monography_tag ADD CONSTRAINT monography_tag_pk PRIMARY KEY (id);

-- 
ALTER TABLE monography_tag ADD CONSTRAINT monography_tag_fk1 FOREIGN KEY (monography_id) REFERENCES monography(id) ON UPDATE NO ACTION ON DELETE NO ACTION;

-- 
ALTER TABLE monography_tag ADD CONSTRAINT monography_tag_fk2 FOREIGN KEY (tag_id) REFERENCES tag(id) ON UPDATE NO ACTION ON DELETE NO ACTION;

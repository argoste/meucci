CREATE TABLE tag (
  id decimal NOT NULL ,
  name character varying(30) NOT NULL ,
  explanation character varying(300) NOT NULL 
);

-- 
ALTER TABLE tag ADD CONSTRAINT descriptor_pk PRIMARY KEY (id);

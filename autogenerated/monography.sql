CREATE TABLE monography (
  id decimal NOT NULL ,
  title character varying(100) NOT NULL
);
-- another way coul be use `CREATE TABLE t1 (col1 SERIAL PRIMARY KEY);` 
CREATE SEQUENCE monography_id_seq START 1 INCREMENT 1 ;
ALTER TABLE monography ALTER COLUMN id SET NOT NULL;
ALTER TABLE monography ALTER COLUMN id SET DEFAULT nextval('monography_id_seq');

--
ALTER TABLE monography ADD CONSTRAINT monography_pk PRIMARY KEY (id);

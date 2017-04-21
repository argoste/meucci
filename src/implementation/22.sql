-- begin;
insert into monography (title) values ('Corso di Algebra');
insert into author (authorname ) values ('N. Dodero'), ('J. Toscani');
-- a query contained in a insert statement
insert into physicalcopy (monography_id )
  select id from monography where title = 'Corso di Algebra';

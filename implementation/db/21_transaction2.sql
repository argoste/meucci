-- seems to me that here `SET AUTOCOMMIT OFF` is redoundand because I use begin, defining a block
-- is an extension ECPG

BEGIN; -- equivalent to BEGIN TRANSACTION
INSERT INTO monography (title) VALUES ('L‘Arte di scrivere con Latex');
INSERT INTO author (authorname) VALUES ('Lorenzo Pantieri');
/*
INSERT INTO monography_author (monography_id, author_id) VALUES (
  (SELECT id FROM monography WHERE title = 'L‘Arte di scrivere con Latex') ,
  (SELECT id FROM author WHERE authorname = 'Lorenzo Pantieri')
  );
*/
INSERT INTO physicalcopy (monography_id)
  SELECT id FROM monography WHERE title = 'L‘Arte di scrivere con Latex'
;

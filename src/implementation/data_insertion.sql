/* JSON representation of a monography. no copy no tag.
    {
      "author": [
                 {"surname": "Bellini", "firstname": "Alessandro" },
                 {"surname": "Guidi", "firstname": "Andrea"}
                 ],
      "title": "Linguaggio C",""
    },
*/
begin;
INSERT INTO monography(title) VALUES ('Linguaggio C');
INSERT into author (completename) values ('Alessandro Bellini'),('Andrea Guidi');

INSERT INTO monography_author (

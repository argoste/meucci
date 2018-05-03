/* JSON representation of a monography. no copy no tag.
    {
      "author": [
                 {"surname": "Bellini", "firstname": "Alessandro" },
                 {"surname": "Guidi", "firstname": "Andrea"}
                 ],
      "title": "Linguaggio C",""
    },
*/
INSERT INTO monography(title) VALUES ('Linguaggio C');
INSERT into author (authorname) values ('Alessandro Bellini'),('Andrea Guidi');

INSERT INTO monography_author (monography_id, author_id) 
VALUES
(1, 1),
(1, 2);

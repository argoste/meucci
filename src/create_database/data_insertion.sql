--MySQL syntax
--Populating the tables
BEGIN TRANSACTION;
INSERT INTO books (id, title, series, authors, category_id)
  VALUES
  (1,'SQL','I portatili','Michael J. Hernandez, John L. Viescas',0.0),
  (2,'Linguaggio C','','Alessandro Bellini, Andrea Guidi',0.0)
  ;

--I will use the main classes from Universal Decimal Classification, as integers.
INSERT INTO classification (id, name) VALUES
(000,'Generalitá'),
(100,'Filosofia. Psicologia'),
(200,'Religione. Teologia'),
(300,'Scienze Sociali'),
(400,'Scienze naturali. Matematica'),
(500,'Scienze Applicate. Medicina. Tecnologia'),
(600,'Arti. Architettura. Fotografia. Musica. Intrattenimento. Sport'),
(700,'Lingua. Linguistica. Letteratura'),
(800,'Geografia. Biografia. Storia')
;
--MySQL syntax
--Populating the tables
BEGIN TRANSACTION;
INSERT INTO books (id, title, series, authors, category_id)
  VALUES
  (1,'SQL','I portatili','Michael J. Hernandez, John L. Viescas',0.0),
  (2,'Linguaggio C','','Alessandro Bellini, Andrea Guidi',0.0)
  ;

INSERT INTO category (id, name) VALUES
(0.0,'Generalitá'),
(0.1,'Filosofia. Psicologia'),
(0.2,'Religione. Teologia'),
(0.3,'Scienze Sociali'),
(0.4,'Scienze naturali. Matematica'),
(0.5,'Scienze Applicate. medicina. Tecnologia'),
(0.6,'Arti. Architettura. Fotografia. Musica. Intrattenimento. Sport'),
(0.7,'Lingua. Lingustica. Letteratura'),
(0.8,'Geografia. Biografia. Storia')
;

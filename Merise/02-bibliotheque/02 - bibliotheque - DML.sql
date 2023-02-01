USE bibli2210;

/*
  DML : Data Modeling Language
	INSERT : insérer des données dans une table
	UPDATE : modifier des données existantes dans une table
	DELETE : supprimer des données d'une table 
	TRUNCATE : Vider une table et réinitialiser les compteurs (auto incrément) 
*/
-- vider une table et réinitialiser les compteurs
-- TRUNCATE TABLE editeurs;
-- TRUNCATE TABLE auteurs;

-- Supprimer les données d'une table
-- les 2 isntructions suivantes remplacent le TRUNCATE (uniquement SQLSERVER)
DELETE FROM editeurs; -- supprimer toutes les données de la table
DBCC CHECKIDENT('editeurs', RESEED, 0); -- réinitialise la colonne auto incrémentée

INSERT INTO editeurs 
(editeur_nom)
VALUES 
('toto'),
('titi'),
('tata');

DELETE FROM auteurs; -- supprimer toutes les données de la table
DBCC CHECKIDENT('auteurs', RESEED, 0); 

INSERT INTO auteurs 
(auteur_prenom, auteur_nom)
VALUES 
('Mike', 'Devoldère'),
('Gérard', 'Rogne');

-- INSERT INTO auteurs VALUES ('Devoldère', 'Mike');

-- Mettre à jour un enregistrement 
UPDATE auteurs 
SET auteur_nom='Bouchard' 
WHERE auteur_id = 2;

UPDATE auteurs 
SET auteur_nom='DEV', auteur_prenom='Toto'  
WHERE auteur_id = 1;

SELECT * FROM editeurs;
SELECT * FROM auteurs;

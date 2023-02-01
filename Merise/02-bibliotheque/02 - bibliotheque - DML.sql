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
DELETE FROM livres; -- supprimer toutes les données de la table
DBCC CHECKIDENT('livres', RESEED, 0);  -- réinitialise la colonne auto incrémentée

DELETE FROM etats_livres; 
DBCC CHECKIDENT('etats_livres', RESEED, 0); 

DELETE FROM editeurs; 
DBCC CHECKIDENT('editeurs', RESEED, 0);

DELETE FROM auteurs; 
DBCC CHECKIDENT('auteurs', RESEED, 0);


INSERT INTO editeurs 
(editeur_nom)
VALUES 
('toto'),
('titi'),
('tata');


INSERT INTO auteurs 
(auteur_prenom, auteur_nom)
VALUES 
('Mike', 'Devoldère'),
('Gérard', 'Rogne');

-- INSERT INTO auteurs VALUES ('Devoldère', 'Mike');


INSERT INTO etats_livres 
(etat_livre_nom) 
VALUES 
('neuf'), -- 1
('très bon état'),
('bon état'),
('bof'),
('abîmé'),
('très abîmé'); -- 6


INSERT INTO livres 
(livre_isbn, livre_titre, livre_date_achat, etat_livre_id, editeur_id)
VALUES 
('472-1', 'SQL pour les nuls', '2022-01-31', 1, 1);




-- Mettre à jour un enregistrement 
UPDATE auteurs 
SET auteur_nom='Bouchard' 
WHERE auteur_id = 2;

UPDATE auteurs 
SET auteur_nom='DEV', auteur_prenom='Toto'  
WHERE auteur_id = 1;

SELECT * FROM editeurs;
SELECT * FROM auteurs;
SELECT * FROM livres;
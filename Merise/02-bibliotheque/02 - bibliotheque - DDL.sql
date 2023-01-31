/* 
commentaire multi lignes
*/
-- commentaire sur 1 ligne

-- Sélection de la abse de données "bibli2210"
USE bibli2210; 


/* 
DDL  (Data Definition Language)
	CREATE : Créer une structure de données (TABLE, VUE...) 
	ALTER : Modifier une structure de données 
	DROP  : Supprimer une structure de données
*/

/*
CREATE TABLE editeurs 
(
	editeur_id INT PRIMARY KEY IDENTITY(1,1) -- MS SQLSERVER
	editeur_id INT PRIMARY KEY AUTO_INCREMENT -- MYSQL ou MariaDB
	editeur_id INT PRIMARY KEY SERIAL -- postgresql
	editeur_id INT PRIMARY KEY AUTOINCREMENT -- sqlite
);*/

-- supprime la table livres_editeurs si elle existe.
DROP TABLE IF EXISTS livres_auteurs;

DROP TABLE IF EXISTS livres;
DROP TABLE IF EXISTS etats_livres;
DROP TABLE IF EXISTS auteurs;
DROP TABLE IF EXISTS editeurs;

CREATE TABLE editeurs 
(
	editeur_id INT PRIMARY KEY IDENTITY(1,1),
	editeur_nom VARCHAR(100) NOT NULL -- DEFAULT 'éditeur inconnu' 
);

CREATE TABLE auteurs 
(
	auteur_id INT IDENTITY(1,1),
	auteur_nom VARCHAR(100) NOT NULL,
	auteur_prenom VARCHAR(100) NULL,
	PRIMARY KEY (auteur_id) -- syntaxe recommandée
);

CREATE TABLE etats_livres 
(
	etat_livre_id INT IDENTITY(1,1),
	etat_livre_nom VARCHAR(50),
	PRIMARY KEY (etat_livre_id)
);

CREATE TABLE livres
(
	livre_id INT IDENTITY(1,1),
	livre_isbn CHAR(17) NOT NULL,
	livre_titre VARCHAR(255) NOT NULL,
	livre_date_achat DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,
	livre_etat_commentaire VARCHAR(1000) NULL,
	etat_livre_id INT NOT NULL,
	editeur_id INT NOT NULL,
	PRIMARY KEY (livre_id),
	FOREIGN KEY (etat_livre_id) REFERENCES etats_livres(etat_livre_id),
	CONSTRAINT FK_livres_editeur FOREIGN KEY (editeur_id) REFERENCES editeurs(editeur_id)
);

CREATE TABLE livres_auteurs
(
	auteur_id INT,
	livre_id INT,
	PRIMARY KEY (auteur_id, livre_id)
);

ALTER TABLE livres_auteurs 
	ADD FOREIGN KEY (auteur_id) REFERENCES auteurs(auteur_id),
	CONSTRAINT FK_TOTO FOREIGN KEY (livre_id) REFERENCES livres(livre_id);
	

	
-- ALTER TABLE auteurs ADD PRIMARY KEY (auteur_id);
	

-- use hebergement;

DROP TABLE IF EXISTS Etats;
DROP TABLE IF EXISTS Personnes;
DROP TABLE IF EXISTS Roles;

CREATE TABLE Roles
(
	role_id INT IDENTITY(1,1) PRIMARY KEY,
	role_nom VARCHAR(25) NOT NULL UNIQUE
	-- UNIQUE(role_nom)
);

CREATE TABLE Personnes 
(
	personne_id INT IDENTITY(1,1),
	personne_nom VARCHAR(50) NOT NULL,
	personne_prenom VARCHAR(50) NOT NULL,
	personne_ddn DATE NOT NULL,
	role_id INT NOT NULL,
	PRIMARY KEY (personne_id)
);

ALTER TABLE Personnes 
	ADD FOREIGN KEY (role_id) REFERENCES Roles(role_id);



CREATE TABLE Etats 
(
	etat_id INT IDENTITY(1,1),
	etat_intitule VARCHAR(25)
);

-- ALTER TABLE etats ADD PRIMARY KEY (etat_id);
ALTER TABLE etats ADD CONSTRAINT PK_etats PRIMARY KEY (etat_id);
-- ALTER TABLE etats DROP CONSTRAINT PK_etats;


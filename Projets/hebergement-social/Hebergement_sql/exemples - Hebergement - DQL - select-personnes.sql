-- use hebergement;

-- S�lectionner toutes les colonnes (*) et toutes les lignes de la table 'Personnes'
SELECT * FROM Personnes;

-- S�lectionner l'identifiant, le pr�nom et l nom de toutes les lignes de la table 'Personnes'
SELECT personne_id, personne_prenom, personne_nom FROM Personnes;


-- Identique � la requ�te pr�c�dente avec utilisation des alias 
-- (renommage des colonnes au moment de la restitution du r�sultat)
SELECT 
personne_id AS 'Identifiant', 
personne_prenom AS 'Pr�nom', 
personne_nom AS 'Son nom'
FROM Personnes; 

-- S�lectionner toutes les personnes et trier les r�sultats par pr�nom et par ordre croissant. 
SELECT * FROM Personnes 
ORDER BY personne_prenom ASC;

-- S�lectionner toutes les personnes dont la date de naissance est comprise entre A et B
SELECT * FROM Personnes 
WHERE personne_ddn >= '2000-01-01' AND personne_ddn <= '2005-12-31';

-- S�lectionner toutes les personnes dont la date de naissance est comprise entre A et B
SELECT * FROM Personnes 
WHERE personne_ddn BETWEEN '2000-01-01' AND '2005-12-31';

-- S�lectionner toutes les personnes dont le mois de naissance est �gal � 11
SELECT * FROM Personnes 
WHERE personne_ddn LIKE '%-11-%';

-- S�lectionner toutes les personnes dont le mois de naissance est �gal � 11
SELECT * FROM Personnes 
WHERE MONTH(personne_ddn) = '11';

-- S�lectionner identifiant, nom, (prenom, date de naissance) 
-- des personnes dont l'identifiant est sup�rieur � 5 
SELECT TOP (2)
personne_id AS 'id',
personne_prenom AS 'Pr�nom',
CONCAT(personne_nom, ' ', personne_ddn) AS 'nom et date de naissance'
FROM personnes 
WHERE personne_id > 5 
ORDER BY personne_nom DESC;

-- Ne faites pas �a !
SELECT * FROM Personnes, Roles 
ORDER BY personne_id;

-- S�l�ctionne les personnes en joignant les informations de leurs r�les respecteifs
SELECT * FROM Personnes 
INNER JOIN Roles ON Personnes.role_id = Roles.role_id
WHERE personne_id = 4;

/*
SELECT * FROM Personnes 
NATURAL JOIN Roles 
WHERE personne_id = 4;
*/
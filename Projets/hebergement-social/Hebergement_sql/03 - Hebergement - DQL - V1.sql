-- 1 Sélectionner tous les éducateurs.

SELECT personne_id, personne_nom, personne_prenom, role_id FROM Personnes WHERE role_id = 4;

-- 2 Sélectionner tous les employés autre que le directeur.

-- SELECT personne_id, personne_nom, personne_prenom, role_id FROM Personnes WHERE role_id NOT BETWEEN 1 AND 5;

SELECT personne_id, personne_nom, personne_prenom, role_id FROM Personnes WHERE role_id IN (6, 7, 8);

SELECT personne_id, personne_nom, personne_prenom, role_id FROM Personnes WHERE role_id = 6 OR role_id = 7 OR role_id = 8;



-- 3 Sélectionner toutes les personnes triées par rôle puis par nom.

SELECT personne_id, personne_nom, personne_prenom, role_id FROM Personnes 
ORDER BY role_id ASC, personne_nom DESC;



-- 4 Sélectionner tous les rôles avec le nombre de personnes associées à chaque rôle.

-- SELECT COUNT(*) as nombre_personnes FROM personnes WHERE role_id = 5;

SELECT 
role_id, 
role_nom,
(SELECT COUNT(*) FROM personnes WHERE Personnes.role_id = Roles.role_id) as nombre_personnes
FROM Roles;

SELECT 
COUNT(Personnes.role_id) as nombre_personnes,
Roles.role_id,
role_nom 
FROM Roles 
JOIN Personnes ON Personnes.role_id = Roles.role_id 
GROUP BY Roles.role_id, role_nom
ORDER BY nombre_personnes DESC;


-- SELECTIONNER les résidents (informations complètes)

SELECT 
resident_id, 
resident_date_arrivee, 
resident_date_depart, 
resident_num_chambre, 
resident_besoins_medicaux, 
medecin_id, 
medecin_consultation, 
Residents.personne_id,
personne_nom, 
personne_prenom
FROM Residents, Personnes
WHERE Personnes.personne_id = Residents.personne_id;

-- idem avec jointures
SELECT 
resident_id, 
resident_date_arrivee, 
resident_date_depart, 
resident_num_chambre, 
resident_besoins_medicaux, 
medecin_id, 
medecin_consultation, 
Residents.personne_id,
personne_nom, 
personne_prenom
FROM Residents JOIN Personnes ON Personnes.personne_id = Residents.personne_id;

SELECT 
resident_id, 
resident_date_arrivee, 
resident_date_depart, 
resident_num_chambre, 
resident_besoins_medicaux, 
medecin_id, 
medecin_consultation, 
Residents.personne_id,
personne_nom, 
personne_prenom 
FROM Personnes JOIN Residents ON Personnes.personne_id = Residents.personne_id;





-- 5 Sélectionner tous les résidents actifs du plus jeune au plus âgé.

SELECT
resident_id, 
Residents.personne_id,
personne_nom,
personne_prenom,
personne_ddn
FROM Personnes Join Residents ON Personnes.personne_id = Residents.personne_id
ORDER BY personne_ddn DESC

-- 6 Sélectionner tous les résidents suivis par un médecin avec nom et prénom du médecin attitré.

SELECT
resident_id,
R1.personne_id,
P1.personne_nom,
P1.personne_prenom,
medecin_id, 
P2.personne_id,
P2.personne_nom,
p2.personne_prenom,
medecin_consultation 
FROM Personnes as P1 -- P1 = PERSONNE RESIDENT
JOIN Residents R1 ON P1.personne_id = R1.personne_id -- R1 = RESIDENT
JOIN Personnes P2 ON R1.medecin_id = P2.personne_id; -- P2 = PERSONNE MEDECIN

-- 7 Sélectionner tous les médecins avec le nombre de résidents qu’il suivent.

SELECT
Personnes.personne_id,
personne_nom,
personne_prenom,
medecin_id,
resident_id

FROM Personnes as P1 -- P1 = MEDECIN
JOIN Residents ON Residents.medecin_id



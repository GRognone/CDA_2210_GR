-- use hebergement;

-- INSERT INTO Roles VALUES ('Admin');
-- INSERT INTO Roles (role_id) VALUES ('Admin');

INSERT INTO Roles 
(role_nom) 
VALUES 
('Admin'), -- 1
('Directeur'), -- 2
('Médecin'), -- 3
('Éducateur'), -- 4
('Résident'); -- 5 


INSERT INTO Personnes 
(personne_nom, personne_prenom, personne_ddn, role_id) 
VALUES 
('DEV', 'Mike', '1981-11-12', 1),
('Thiry', 'Sophie', '1982-01-02', 1),
('Chatelot', 'Franck', '2005-10-01', 5);

INSERT INTO Personnes 
(personne_nom, personne_prenom, personne_ddn, role_id) 
VALUES 
('Kuntz', 'Dany', '1981-11-12', 2),
('Cardoso', 'Tommy', '1982-01-02', 2);


SELECT * FROM Roles;
SELECT * FROM Personnes;
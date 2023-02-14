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
('Résident'), -- 5
('Gardien'), -- 6
('Technicien'), -- 7
('Cuisinier'); -- 8


INSERT INTO Personnes 
(personne_nom, personne_prenom, personne_ddn, role_id) 
VALUES 
('DEV', 'Mike', '1981-11-12', 1),
('Thiry', 'Sophie', '1982-01-02', 8),
('Neymar', 'Jean', '1982-01-02', 7),
('Noah', 'Yannick', '1982-01-02', 6),
('Faronne', 'Sarah', '1982-01-02', 6),
('Holems', 'Cathy', '1982-01-02', 3),
('Mannheim', 'Luc', '1982-01-02', 3),
('Kipré', 'Abdou', '1982-01-02', 3),
('Martin', 'Valérie', '1982-01-02', 4),
('Deloin', 'Alain', '1982-01-02', 4),
('Bahl', 'Tarik', '1982-01-02', 4),
('Goldman', 'Estelle', '1982-01-02', 4),
('Durand', 'Gabriel', '2005-10-01', 5);



SELECT * FROM Roles;
SELECT * FROM Personnes;
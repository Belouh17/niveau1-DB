CREATE DATABASE gargote;

use gargote;

CREATE TABLE plat (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prix INTEGER NOT NULL
);

INSERT INTO plat (nom, prix) VALUES
    ('Romazava', 7000),
    ('Ravitoto sy henakisoa', 8000),x
    ('Akoho sy voanio', 8500),
    ('Mi sao', 6000),
    ('Soupe chinoise', 5000),
    ('Mofo gasy (les 4)', 1000),
    ('Ranon''ampango', 500);

CREATE TABLE categorie (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO categorie (nom) VALUES
    ('Plat malagasy'),
    ('Plat chinois'),
    ('Soupe'),
    ('Dessert et goûter'),
    ('Boisson'),
    ('Entrée');

ALTER TABLE plat
    ADD COLUMN id_categorie INTEGER,
    ADD CONSTRAINT fk_plat_categorie
        FOREIGN KEY (id_categorie) REFERENCES categorie(id);

UPDATE plat SET id_categorie = (SELECT id FROM categorie WHERE nom = 'Plat malagasy')
WHERE nom IN ('Romazava', 'Ravitoto sy henakisoa', 'Akoho sy voanio');

UPDATE plat SET id_categorie = (SELECT id FROM categorie WHERE nom = 'Plat chinois')
WHERE nom = 'Mi sao';

UPDATE plat SET id_categorie = (SELECT id FROM categorie WHERE nom = 'Soupe')
WHERE nom = 'Soupe chinoise';

UPDATE plat SET id_categorie = (SELECT id FROM categorie WHERE nom = 'Dessert et goûter')
WHERE nom = 'Mofo gasy (les 4)';

UPDATE plat SET id_categorie = (SELECT id FROM categorie WHERE nom = 'Boisson')
WHERE nom = 'Ranon''ampango';

CREATE TABLE commande (
    id             SERIAL PRIMARY KEY,
    date_commande  DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE ligne_commande (
    id_commande  INTEGER NOT NULL REFERENCES commande(id),
    id_plat      INTEGER NOT NULL REFERENCES plat(id),
    quantite     INTEGER NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_commande, id_plat)
);

-- Données de test (base neuve : les commandes prennent les ids 1, 2, 3)
INSERT INTO commande (date_commande) VALUES
    ('2026-10-12'),
    ('2026-10-12'),
    ('2026-10-13');

INSERT INTO ligne_commande (id_commande, id_plat, quantite) VALUES
    (1, (SELECT id FROM plat WHERE nom = 'Romazava'), 2),
    (1, (SELECT id FROM plat WHERE nom = 'Ranon''ampango'), 1),
    (2, (SELECT id FROM plat WHERE nom = 'Mi sao'), 1),
    (2, (SELECT id FROM plat WHERE nom = 'Soupe chinoise'), 1),
    (2, (SELECT id FROM plat WHERE nom = 'Mofo gasy (les 4)'), 2),
    (3, (SELECT id FROM plat WHERE nom = 'Akoho sy voanio'), 3);
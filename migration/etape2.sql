CREATE DATABASE gargote;

use gargote;

CREATE TABLE plat (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prix INTEGER NOT NULL
);

INSERT INTO plat (nom, prix) VALUES
    ('Romazava', 7000),
    ('Ravitoto sy henakisoa', 8000),
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
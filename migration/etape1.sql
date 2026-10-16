CREATE DATABASE gargote;

use gargote;

CREATE TABLE plat (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prix INTEGER NOT NULL
);

/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int NOT NULL PRIMARY KEY, 
    name char(50),
    date_of_birth date,
    escape_attempts int,
    neutered BOOLEAN NOT NULL, 
    weight_kg int NOT NULL
);

/* Add a column species of type string to animals table. */

AlTER TABLE animals
ADD COLUMN species char(100);


/* Inside a transaction update the animals table by setting the species column to unspecified */

BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';

SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;
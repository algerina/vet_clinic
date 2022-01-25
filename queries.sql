/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = '%mon';
SELECT name FROM animals WHERE 	date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE 	neutered = true AND escape_attempts < '3';
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > '10.5';
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg >= '10.4' AND weight_kg <= '17.3';


/* Add a column species of type string to animals table. */

AlTER TABLE animals
ADD COLUMN species char(100);


/* Transactions */

BEGIN TRANSACTION;
UPDATE animals
SET species = 'unspecified';

SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN TRANSACTION;

UPDATE animals
SET species = 'digimon'
WHERE name = '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species is NULL;
COMMIT;






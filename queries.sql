/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = '%mon';
SELECT name FROM animals WHERE 	date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE 	neutered = true AND escape_attempts < '3';
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > '10.5';
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg >= '10.4' AND weight_kg <= '17.3';





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

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
SAVEPOINT SP1;

UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK to SP1;
SELECT * FROM animals;

UPDATE animals
COMMIT;

/* Queries */
SELECT COUNT(*) FROM animals;

SELECT count(*) FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) FROM animals;

SELECT neutered, MAX(escape_attempts) FROM animals GROUP BY neutered;

SELECT species, MAX(weight_kg) FROM animals GROUP BY species;

SELECT species, MIN(weight_kg) FROM animals GROUP BY species;

SELECT species, AVG(escape_attempts) FROM animals GROUP BY species WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31';

/* Write queries using JOIN */

SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';

SELECT * FROM owners JOIN animals ON animals.owner_id = owners.id;

SELECT species.name, COUNT(species_id) FROM species JOIN animals ON animals.species_id = species.id GROUP BY species.name;

SELECT name FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Jennifer Orwell';

SELECT name FROM animals INNER JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = ' Dean Winchester' AND animals.escape_attempts = 0;

SELECT COUNT(animals.name) AS animals_number, owners.full_name FROM animals INNER JOIN owners ON animals.owner_id = owners.id GROUP BY owners.full_name ORDER BY animals_number;

/* Join vets and species tables */

SELECT vets.name, species.name FROM vets FULL OUTER JOIN specializations ON vets.id = specializations.vets_id FULL OUTER JOIN species ON species.id = specializations.species_id;

SELECT animals.name FROM animals 
  INNER JOIN visits ON animals.id = visits.animals_id
  INNER JOIN vets ON vets.id = visits.vets_id
  WHERE vets.name = 'William Tatcher'
  ORDER BY data_of_visit DESC LIMIT 1;

  SELECT COUNT(*) FROM animals 
  INNER JOIN visits ON animals.id = visits.animals_id
  INNER JOIN vets ON vets.id = visits.vets_id
  WHERE vets.name = 'Stephanie Mendez'
  GROUP BY animals.id;

  SELECT vets.name, species.name FROM vets
  LEFT JOIN specializations ON specializations.vets_id = vets.id
  LEFT JOIN species ON specializations.species_id = species.id;

  SELECT * FROM animals 
  INNER JOIN visits ON animals.id = visits.animals_id
  INNER JOIN vets ON vets.id = visits.vets_id
  WHERE vets.name = 'Stephanie Mendez'
  AND data_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

  SELECT animals.name FROM animals 
  INNER JOIN visits ON animals.id = visits.animals_id
  INNER JOIN vets ON vets.id = visits.vets_id
  GROUP BY animals.name
  ORDER BY COUNT(*) DESC LIMIT 1;

  SELECT animals.name FROM animals 
  INNER JOIN visits ON animals.id = visits.animals_id
  INNER JOIN vets ON vets.id = visits.vets_id
  WHERE vets.name = 'Maisy Smith'
  ORDER BY data_of_visit LIMIT 1;

  SELECT * FROM animals 
  INNER JOIN visits ON animals.id = visits.animals_id
  INNER JOIN vets ON vets.id = visits.vets_id
  ORDER BY data_of_visit DESC LIMIT 1;

  SELECT COUNT(*) FROM animals 
  INNER JOIN visits ON animals.id = visits.animals_id
  INNER JOIN vets ON vets.id = visits.vets_id
  INNER JOIN species ON animals.species_id = species.id
  LEFT JOIN specializations ON specializations.vets_id = vets.id
  WHERE specializations.species_id <> species.id OR specializations.species_id IS NULL;

  SELECT species.name FROM animals 
  INNER JOIN species ON animals.species_id = species.id
  INNER JOIN visits ON animals.id = visits.animals_id
  INNER JOIN vets ON vets.id = visits.vets_id
  WHERE vets.name = 'Maisy Smith'
  GROUP BY species.name
  ORDER BY COUNT(*) DESC LIMIT 1;




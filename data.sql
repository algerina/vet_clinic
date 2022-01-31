/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '2020-02-03', '0', true, '10.23');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', '2', true, '8.00');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '2021-01-07', '1', false, '15.04');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '2017-05-12', '5', true, '11.00');

/* Update database */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (5, 'Charmander', '2020-02-08', '0', false, '-11.00');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (6, 'Plantmon', '2022-11-15', '2', true, '-5.70');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (7, 'Squirtle', '1993-04-02', '3', false, '-12.13');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (8, 'Angemon', '2005-06-12', '1', true, '-45.00');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (9, 'Boarmon', '2005-06-07', '7', true, '20.40');
INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (10, 'Blossom', '1998-10-13', '3', true, '17.00');

/* Populate owners table */

INSERT INTO owners (id, full_name, age) VALUES (1, 'Sam Smith', '34');
INSERT INTO owners (id, full_name, age) VALUES (2, 'Jennifer Orwell', '19');
INSERT INTO owners (id, full_name, age) VALUES (3, 'Bob', '45');
INSERT INTO owners (id, full_name, age) VALUES (4, 'Melody Pond', '77');
INSERT INTO owners (id, full_name, age) VALUES (5, 'Dean Winchester', '14');
INSERT INTO owners (id, full_name, age) VALUES (6, 'Jodie Whittaker', '38');


/* Populate species table */

INSERT INTO species (id, name) VALUES (1, 'Pokemon');
INSERT INTO species (id, name) VALUES (2, 'Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

Update animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id from owners WHERE full_name = 'Jennifer Orwell') WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = (SELECT id from owners WHERE full_name = 'Bob') WHERE name = 'Devimon' OR name = 'Plantmon';
Update animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Charmander';
Update animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Squirtle';
Update animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name = 'Blossom';
Update animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name = 'Angemon' OR name = 'Boarman';



INSERT INTO vets (name, age, date_of_graduation) VALUES ('William Tatcher', '45', '2000-04-23');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Maisy Smith', '26', '2019-01-17');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Stephanie Mendez', '64', '1981-05-04');
INSERT INTO vets (name, age, date_of_graduation) VALUES ('Jack Harkness', '38', '2008-06-08');



INSERT INTO specializations (vets_id, species_id) VALUES (1, 2);
INSERT INTO specializations (vets_id, species_id) VALUES (3, 1);
INSERT INTO specializations (vets_id, species_id) VALUES (3, 2);
INSERT INTO specializations (vets_id, species_id) VALUES (4, 1);



INSERT INTO visits (animals_id, vets_id, data_of_visit) 
VALUES (1, 1, '2020-05-24'), (1, 3, '2020-07-22'),
  (2, 4, '2021-02-02'),
  (3, 2, '2020-01-05'), (3, 2, '2020-03-08'), (3, 2, '2020-05-14'),
  (4, 3, '2021-05-04'),
  (5, 4, '2021-02-24'),
  (6, 2, '2019-12-21'), (6, 1, '2020-08-10'), (6, 2, '2021-04-07'),
  (7, 3, '2019-09-29'),
  (8, 4, '2020-10-03'), (8, 4, '2020-11-04'),
  (9, 2, '2019-01-24'), (9, 2, '2019-05-15'), (9, 2, '2020-02-27'), (9, 2, '2020-08-03'),
  (10, 3, '2020-05-24'), (10, 1, '2021-01-11')
;

INSERT INTO visits (vets_id, animals_id, data_of_visit) VALUES (
    (SELECT id FROM vets WHERE name = 'Maisy Smith'),
    (SELECT id FROM animals WHERE name = 'Plantmon'),
    '2019-12-21'
);

INSERT INTO visits (animals_id, vets_id, data_of_visit) SELECT * FROM (SELECT id FROM animals) animals_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;INSERT INTO visits (animals_id, vets_id, data_of_visit) SELECT * FROM (SELECT id FROM animals) animals_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;


insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';


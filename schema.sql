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

CREATE TABLE animals(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  species_id INT REFERENCES species(id),
  owner_id INT REFERENCES owners(id),
  PRIMARY KEY(id)
);

/* Create owners table */

CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(20),
  age INT,
  PRIMARY KEY(id)
);

/* Create species table */

CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(20),
  PRIMARY KEY(id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD species_id int REFERENCES species(id);

ALTER TABLE animals
ADD owner_id int REFERENCES owners(id);

/* Create vets table */

CREATE TABLE vets (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    name char(50) NOT NULL,
    age int NOT NULL,
    date_of_graduation date
);

CREATE TABLE specializations (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    vets_id int NOT NULL REFERENCES vets(id),
    species_id int NOT NULL REFERENCES species(id)

);

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY(id)
);
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

/* Create owners table */

CREATE TABLE owners (
    id int NOT NULL PRIMARY KEY, 
    full_name char(50) NOT NULL,
    age int NOT NULL
);

/* Create species table */

CREATE TABLE species (
    id int NOT NULL PRIMARY KEY, 
    name char(50)
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

CREATE TABLE visits (
    id int NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    vets_id int NOT NULL REFERENCES vets(id),
    animals_id int NOT NULL REFERENCES animals(id),
    data_of_visit date NOT NULL

);
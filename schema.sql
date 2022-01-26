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
ADD COLUMN species_id int; 

ALTER TABLE animals
ADD FOREIGN KEY (species_id) REFERENCES species;

ALTER TABLE animals
ADD COLUMN owner_id int; 


ALTER TABLE animals
ADD FOREIGN KEY (owner_id) REFERENCES owners;
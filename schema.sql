/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int NOT NULL PRIMARY KEY, 
    name char(50),
    date_of_birth date,
    escape_attempts int,
    neutered BOOLEAN NOT NULL, 
    weight_kg int NOT NULL
);

/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN Jan 1, 2016 AND Dec 31, 2019;
SELECT name from animals WHERE (neutered = 0 && escape_attempts < 3);
SELECT date_of_birth from animals WHERE (name = 'Agumon' OR name = 'Pikachu');
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = 0;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE (weight_kg >= 10.4 && weight_kg <= 17.3);

BEGIN;
UPDATE animals SET species ='unspecified';
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;

BEGIN;
DELETE FROM animals
ROLLBACK;

SELECT name from animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > Jan 1st, 2022;
SAVEPOINT savepoint1;
UPDATE animals SET weight_kg = weight_kg*-1;
ROLLBACK TO savepoint1;
UPDATE animals SET weight_kg = weight_kg*-1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(name) FROM animals;
SELECT COUNT(name) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT MAX(escape_attempts) FROM animals;
SELECT COUNT(neutered) FROM animals WHERE neutered = 1;
SELECT COUNT(neutered) from animals WHERE neutered = 0;
SELECT MIN(species) FROM animals GROUP BY species;
SELECT MAX(species) FROM animals GROUP BY species;
SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN Jan 1, 1990 AND Dec 31, 2000 GROUP BY species;



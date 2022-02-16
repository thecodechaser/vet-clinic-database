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

-- Write queries (using JOIN) :
-- What animals belong to Melody Pond?
SELECT animals.name FROM animals JOIN owners ON animals.owner_id = owners.id WHERE full_name='Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals JOIN species ON animals.species_id=species.id WHERE species_id=1;

--List all owners and their animals, remember to include those that don't own any animal.
SELECT animals.name,full_name FROM owners LEFT JOIN animals ON animals.owner_id=owners.id;

--How many animals are there per species?
SELECT species.name, COUNT(*) from animals JOIN species ON animals.species_id=species.id GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.
SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id LEFT JOIN species ON animals.species_id = species.id 
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.* FROM animals LEFT JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

--Who owns the most animals?
SELECT owners.full_name, COUNT(animals.name) AS total FROM owners LEFT JOIN animals ON animals.owner_id=owners.id 
GROUP BY owners.full_name ORDER BY total DESC LIMIT 1;

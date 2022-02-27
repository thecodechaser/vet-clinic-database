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



-- Who was the last animal seen by William Tatcher?
SELECT animals.name, visits.date_of_visit FROM animals JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 1 ORDER BY date_of_visit DESC LIMIT 1

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animals.name) FROM animals JOIN visits ON animals.id = visits.animals_id 
JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 3;

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets JOIN specializations ON vets.id = specializations.vets_id JOIN species
ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets
ON vets.id = visits.vets_id WHERE vets.id = 3 AND visits.date_of_visit >=' April 1st, 2020' AND visits.date_of_visit <='August 30th, 2020';

-- What animal has the most visits to vets?
SELECT COUNT(*) FROM visits JOIN animals ON animals.id = visits.animals_id GROUP BY animals.name;

-- Who was Maisy Smith's first visit?
SELECT animals.name FROM animals JOIN visits ON animals.id = visits.animals_id JOIN vets  ON vets.id = visits.vets_id
WHERE vets.id = 2 ORDER BY visits.date_of_visit LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT * FROM animals JOIN visits ON animals.id = visits.animals_id FULL JOIN vets  ON vets.id = visits.vets_id
WHERE vets.id = 2 ORDER BY visits.date_of_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits JOIN vets ON vets.id = visits.vets_id WHERE vets.id = 2

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(visits.animals_id) FROM visits JOIN vets ON visits.vets_id = vets.id FULL JOIN animals
ON visits.animals_id = animals.id JOIN species  ON species.id = animals.species_id WHERE vets.id = 2
GROUP BY species.name;

-- queries for performance optimization
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
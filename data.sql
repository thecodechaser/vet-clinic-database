/* Populate database with sample data. */

/* Insert data into animals table */
INSERT INTO animals VALUES (ID, name, date_of_birth, escape_attempts, neutered, weight_kg) (1, 'Agumon', Feb 3rd, 2020, 0, 1, 10.23);
INSERT INTO animals VALUES (ID, name, date_of_birth, escape_attempts, neutered, weight_kg) (2, 'Gabumon', Nov 15th, 2018, 2, 1, 8);
INSERT INTO animals VALUES (ID, name, date_of_birth, escape_attempts, neutered, weight_kg) (3, 'Pikachu', Jan 7th, 2021, 1, 0, 15.04);
INSERT INTO animals VALUES (ID, name, date_of_birth, escape_attempts, neutered, weight_kg) (4, 'Devimon', May 12th, 2017, 5, 1, 11);
INSERT INTO animals VALUES (ID, name, date_of_birth, escape_attempts, neutered, weight_kg) (5, 'Charmander', Feb 8th, 2020, 0, 0, 11);
INSERT INTO animals VALUES (ID, name, date_of_birth, escape_attempts, neutered, weight_kg) (6, 'Plantmon', Nov 15th, 2022, 2, 1, 5.7);
INSERT INTO animals VALUES (ID, name, date_of_birth, escape_attempts, neutered, weight_kg) (7, 'Squirtle', Apr 2nd, 1993, 3, 0, 12.13);
INSERT INTO animals VALUES (ID, name, date_of_birth, escape_attempts, neutered, weight_kg) (8, 'Angemon', Jun 12th, 2005, 1, 1, 45);
INSERT INTO animals VALUES (ID, name, date_of_birth, escape_attempts, neutered, weight_kg) (9, 'Boarmon', Jun 7th, 2005, 7, 1, 20.4);
INSERT INTO animals VALUES (ID, name, date_of_birth, escape_attempts, neutered, weight_kg) (10, 'Blossom', Oct 13th, 1998, 3, 1, 17);

/* Insert data into owners table */
INSERT INTO owners VALUES (full_name, age) ('Sam Smith', 34);
INSERT INTO owners VALUES (full_name, age) ('Jennifer Orwell', 19);
INSERT INTO owners VALUES (full_name, age) ('Bob', 45);
INSERT INTO owners VALUES (full_name, age) ('Melody Pond', 77);
INSERT INTO owners VALUES (full_name, age) ('Dean Winchester', 14);
INSERT INTO owners VALUES (full_name, age) ('Jodie Whittaker', 38);

/* Insert data to species table */
INSERT INTO species VALUES (name) ('Pokemon');
INSERT INTO species VALUES (name) ('Digimon');

/* Modify animals table */
BEGIN;
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;;
COMMIT;

BEGIN;
UPDATE animals SET owners_id = (SELECT id from owners WHERE full_name = 'Sam Smith') WHERE name = 'Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');
COMMIT;

-- insert data into vets
INSERT INTO vets(name, age, date_of_graduation) VALUES ('William Tatcher', 45, 'Apr 23rd, 2000');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Maisy Smith', 26, 'Jan 17th, 2019');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Stephanie Mendez', 64, 'May 4th, 1981');
INSERT INTO vets(name, age, date_of_graduation) VALUES ('Jack Harkness', 38, 'Jun 8th, 2008');

-- insert data into specializations:
INSERT INTO specializations(vets_id, species_id) VALUES (1, 1);
INSERT INTO specializations(vets_id, species_id) VALUES (3, 1);
INSERT INTO specializations(vets_id, species_id) VALUES (3, 2);
INSERT INTO specializations(vets_id, species_id) VALUES (4, 2);

-- insert data into visits:
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (1, 1, 'May 24th, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 1, 'Jul 22th, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 2, 'Feb 2nd, 2021');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 2, 'Jan 5th, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 2, 'Mar 8th, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 2, 'May 14th, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 4, 'May 4th, 2021');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 5, 'Feb 24th, 2021');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 6, 'Dec 21st, 2019');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (1, 6, 'Aug 10th, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 6, 'Apr 7th, 2021');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 7, 'Sep 29th, 2019');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 8, 'Oct 3rd, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (4, 8, 'Nov 4th, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, 'Jan 24th, 2019');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, 'May 15th, 2019');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, 'Feb 27th, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (2, 9, 'Aug 3rd, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (3, 10, 'May 24th, 2020');
INSERT INTO visits(vets_id, animals_id, date_of_visit) VALUES (1, 10, 'Jan 11th, 2021');

-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits 
  (animal_id, vet_id, date_of_visit) 
  SELECT * 
  FROM (SELECT id FROM animals) animal_ids, 
    (SELECT id FROM vets) 
    vets_ids, 
    generate_series
    ('1980-01-01'::timestamp, '2021-01-01', '4 hours') 
    visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners 
  (full_name, email) 
  select 
    'Owner ' || 
    generate_series(1,2500000), 'owner_' || 
    generate_series(1,2500000) || '@mail.com';
/* Database schema to keep the structure of entire database. */

/* animals table */
CREATE TABLE animals (
    ID INT AUTO_INCREMENT,
    name varchar(100),
    date_of_birth date,
    escape_attempts INT,
    neutered bit,
    weight_kg decimal,
    PRIMARY KEY(ID)
);

ALTER TABLE animals ADD species varchar(100);
ALTER TABLE animals DROP species;

--Add column species_id which is a foreign key referencing the species table
ALTER TABLE animals ADD species_id INT,
ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);

--Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD owner_id INT,
ADD CONSTRAINT fk_owners FOREIGN KEY(owner_id) REFERENCES owners(id);


/* owners table */
CREATE TABLE owners (
    ID INT AUTO_INCREMENT,
    full_name varchar(100),
    age INT,
    PRIMARY KEY(ID)
);

/* species table */
CREATE TABLE species (
    ID INT AUTO_INCREMENT,
    name varchar(100),
    PRIMARY KEY(ID)
);

/* vets table */
CREATE TABLE vets (
    ID INT AUTO_INCREMENT,
    name varchar(300),
    age INT,
    date_of_graduation date.
    PRIMARY KEY(ID)
);

/* specialization table */
CREATE TABLE specializations(
  vets_id integer NOT NULL,
  species_id integer NOT NULL,
  FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (species_id) REFERENCES species (id) ON DELETE RESTRICT ON UPDATE CASCADE,
)

/* visits table */
CREATE TABLE visits(
  vets_id integer NOT NULL,
  animals_id integer NOT NULL,
  date_of_visit date,
  FOREIGN KEY (vets_id) REFERENCES vets (id) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (animals_id) REFERENCES animals (id) ON DELETE RESTRICT ON UPDATE CASCADE,
)

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- commands to create indexes for the visits and owners table
CREATE INDEX animals_id_asc ON visits(animal_id asc);
CREATE INDEX vet_id_asc ON visits(vets_id asc);
CREATE INDEX email_asc ON owners(email asc);
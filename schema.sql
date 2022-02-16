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

/* soecies table */

CREATE TABLE species (
    ID INT AUTO_INCREMENT,
    name varchar(100),
    PRIMARY KEY(ID)
);

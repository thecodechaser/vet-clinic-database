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

ALTER TABLE animals ADD species_id varchar(100);
ALTER TABLE animals ADD owners_id varchar(100);


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

/* Database schema to keep the structure of entire database. */

/* animals table */
CREATE TABLE animals (
    ID INT PRIMARY KEY,
    name varchar(100),
    date_of_birth date,
    escape_attempts INT,
    neutered bit,
    weight_kg decimal,
);

ALTER TABLE animals ADD species varchar;


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

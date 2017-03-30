DROP TABLE adoptions;
DROP TABLE owners;
DROP TABLE animals;

CREATE TABLE animals
(
  id SERIAL8 PRIMARY KEY,
  profile TEXT,
  name VARCHAR(255) NOT NULL,
  species VARCHAR(255),
  breed VARCHAR(255),
  admission_date DATE,
  ready_to_adopt BOOLEAN,
  honour_level INT2
);

CREATE TABLE owners
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  profile TEXT,
  address VARCHAR(255),
  species_pref VARCHAR(255),
  honour_level INT2
);

CREATE TABLE adoptions
(
  id SERIAL8 PRIMARY KEY,
  owner_id INT8 REFERENCES owners(id) ON DELETE CASCADE,
  animal_id INT8 REFERENCES animals(id) ON DELETE CASCADE
);

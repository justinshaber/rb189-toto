-- psql dogs -f schema.sql

-- CREATE TABLE neighborhoods (
--   id serial PRIMARY KEY,
--   name varchar(50) NOT NULL
-- );

-- CREATE TYPE size_enum AS ENUM ('S', 'M', 'L');

-- CREATE TABLE dogs (
--   id serial PRIMARY KEY,
--   name varchar(50) NOT NULL,
--   favorite_snack text,
--   birthday date,
--   friendly boolean NOT NULL,
--   size size_enum NOT NULL,
--   neighborhood_id int REFERENCES neighborhoods(id) ON DELETE CASCADE
-- );



-- CREATE TABLE owners (
--   id serial PRIMARY KEY,
--   name varchar(50) NOT NULL,
--   phone_number varchar(10),
--   address text
-- );

-- CREATE TABLE dogs_owners (
--   dog_id int NOT NULL REFERENCES dogs(id) ON DELETE CASCADE,
--   owner_id int NOT NULL REFERENCES owners(id) ON DELETE CASCADE
-- );

-- ALTER TABLE owners
-- ADD CHECK (phone_number ~ '^[0-9]{10}$');

-- ALTER TABLE dogs_owners
-- ADD UNIQUE (dog_id, owner_id)

select * from dogs;
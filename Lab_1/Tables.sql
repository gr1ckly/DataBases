DROP TABLE IF EXISTS FORM_TYPES CASCADE;
DROP TABLE IF EXISTS POINTS_GROUP CASCADE;
DROP TABLE IF EXISTS HUMAN CASCADE;
DROP TABLE IF EXISTS TEAM CASCADE;
DROP TABLE IF EXISTS PLANET CASCADE;
DROP TABLE IF EXISTS DESTINATION CASCADE;
DROP TABLE IF EXISTS COLOR CASCADE;
DROP TABLE IF EXISTS CEREAL CASCADE;
DROP TABLE IF EXISTS FORM_TYPES CASCADE;
DROP TABLE IF EXISTS COLORING CASCADE;
DROP TABLE IF EXISTS COMPARISION CASCADE;
DROP TABLE IF EXISTS SURPRISING CASCADE;

DROP TYPE IF EXISTS GENDER_ENUM CASCADE;
DROP TYPE IF EXISTS PLANET_TYPE_ENUM CASCADE;
DROP TYPE IF EXISTS SPACE_SHIP_TYPE_ENUM CASCADE;

CREATE TYPE GENDER_ENUM AS ENUM('Мужской', 'Женский');
CREATE TYPE PLANET_TYPE_ENUM AS ENUM('Торресториальная планета', 'Газовый гигант', 'Ледяной гигант', 'Экзопланета', 'Планета-карлик');
CREATE TYPE SPACE_SHIP_TYPE_ENUM AS ENUM ('Helix', 'SpaceMarine', 'Scout', 'Terminator', 'Explorer');

CREATE TABLE FORM_TYPES(
ID SERIAL PRIMARY KEY,
TYPE TEXT NOT NULL);

CREATE TABLE POINTS_GROUP(
ID SERIAL PRIMARY KEY,
NAME TEXT NOT NULL,
COUNT BIGINT NOT NULL CHECK (COUNT >=0),
DESCRIPTION TEXT NOT NULL,
FORM_TYPES_ID INT NOT NULL REFERENCES FORM_TYPES (ID));

CREATE TABLE SPACE_SHIP(
  ID SERIAL PRIMARY KEY,
  NAME TEXT NOT NULL,
  TYPE SPACE_SHIP_TYPE_ENUM NOT NULL,
  CAPACITY SMALLINT NOT NULL,
  HAVING_WEAPON BOOLEAN NOT NULL);

CREATE TABLE TEAM(
ID SERIAL PRIMARY KEY,
NAME TEXT NOT NULL,
GOAL_DESCRIPTION TEXT NOT NULL,
SPACE_SHIP_ID INT NOT NULL REFERENCES SPACE_SHIP (ID));

CREATE TABLE HUMAN(
ID SERIAL PRIMARY KEY,
NAME TEXT NOT NULL,
SURNAME TEXT NOT NULL,
PATRONYMIC TEXT,
GENDER GENDER_ENUM NOT NULL,
AGE SMALLINT NOT NULL CHECK(AGE>=0),
POETRY SMALLINT NOT NULL CHECK (POETRY<=10 AND POETRY>=0),
TEAM INT NOT NULL REFERENCES TEAM (ID));

CREATE TABLE PLANET(
ID SERIAL PRIMARY KEY,
NAME TEXT NOT NULL,
RADIUS INT NOT NULL,
TYPE PLANET_TYPE_ENUM NOT NULL,
AGE BIGINT NOT NULL,
IS_POPULATED BOOLEAN NOT NULL);

CREATE TABLE DESTINATION(
ID SERIAL PRIMARY KEY,
TEAM_ID INT NOT NULL REFERENCES TEAM  (ID),
PLANET_ID INT NOT NULL REFERENCES PLANET (ID));

CREATE TABLE COLOR(
ID SERIAL PRIMARY KEY,
NAME TEXT NOT NULL,
HEX_CODE CHAR(6) NOT NULL);

CREATE TABLE CEREAL(
ID SERIAL PRIMARY KEY,
NAME TEXT NOT NULL,
COUNT BIGINT NOT NULL CHECK (COUNT >=0));

CREATE TABLE COLORING(
ID SERIAL PRIMARY KEY,
CEREAL_ID INT NOT NULL REFERENCES CEREAL (ID),
COLOR_ID INT NOT NULL REFERENCES COLOR (ID),
COLORING_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE COMPARISION(
ID SERIAL PRIMARY KEY,
HUMAN_ID INT NOT NULL REFERENCES HUMAN (ID),
POINTS_GROUP_ID INT NOT NULL REFERENCES POINTS_GROUP (ID),
PLANET_ID INT NOT NULL REFERENCES PLANET (ID),
CEREAL_ID INT NOT NULL REFERENCES CEREAL (ID),
COMPARISION_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE SURPRISING(
ID SERIAL PRIMARY KEY,
COMPARISION_ID INT NOT NULL REFERENCES COMPARISION (ID),
TEAM_ID INT NOT NULL REFERENCES TEAM (ID),
SURPRISE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP)

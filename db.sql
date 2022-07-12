CREATE DATABASE Studi;

CREATE USER manon WITH ENCRYPTED PASSWORD 'manon';

GRANT ALL PRIVILEGES ON DATABASE Studi TO manon;



CREATE TABLE Employee(
  idEmployee SERIAL NOT NULL PRIMARY KEY,
  first_name VARCHAR(20) NOT NULL,
  last_name VARCHAR(20) NOT NULL,
  email VARCHAR(30) NOT NULL,
  password VARCHAR(20),
  phone VARCHAR(10) NULL
)

CREATE TABLE Admin(
  idAdmin SERIAL NOT NULL PRIMARY KEY,
)

CREATE TABLE Customers(
  idCustomers SERIAL NOT NULL PRIMARY KEY,

)

CREATE TABLE Tarif(
  idTarif SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(20),
  price NUMERIC
)

CREATE TABLE Cinema(
  idCinema SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  address VARCHAR(150) NOT NULL,
  phone VARCHAR(10) NULL,
)

CREATE TABLE Salle(
  idSalle SERIAL NOT NULL PRIMARY KEY,
  number_salle INT,
  number_place INT,
  fk_idCinema INT,
)

CREATE TABLE Movie(
  idMovie SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description VARCHAR(300) NULL
)

CREATE TABLE Sceance(
  idSceance SERIAL NOT NULL PRIMARY KEY,
  date TIMESTAMP NOT NULL,
)

CREATE TABLE Reservation(
  id SERIAL NOT NULL PRIMARY KEY,
  reference VARCHAR(20) NOT NULL,
  choice_payment VARCHAR(20) NOT NULL,
)


/*-----MODIFICATION TIMESTRAMP SANS FUSEAU HORAIRE-------*/

ALTER TABLE Tarif ALTER COLUMN price TYPE NUMERIC;
ALTER TABLE Sceance ALTER COLUMN date TYPE TIMESTAMP WITH TIME ZONE ;



/*-------- FOREIGN KEY----------*/

ALTER TABLE Salle ADD fk_idCinema INT
ALTER TABLE Salle ADD FOREIGN KEY (fk_idCinema) REFERENCES Cinema;

ALTER TABLE Admin ADD fk_idEmployee INT,
ALTER TABLE Admin ADD FOREIGN KEY (fk_idEmployee) REFERENCES Employee;

ALTER TABLE Customers ADD fk_idEmployee INT,
ALTER TABLE Customers ADD FOREIGN KEY (fk_idEmployee) REFERENCES Employee;

ALTER TABLE Customers ADD fk_idTarif INT,
ALTER TABLE Customers ADD FOREIGN KEY (fk_idTarif) REFERENCES Tarif;

ALTER TABLE Cinema ADD fk_idEmployee INT,
ALTER TABLE Cinema ADD FOREIGN KEY (fk_idEmployee) REFERENCES Employee;

ALTER TABLE Sceance ADD fk_idSalle INT,
ALTER TABLE Sceance ADD FOREIGN KEY (fk_idSalle) REFERENCES Salle;

ALTER TABLE Sceance ADD fk_idMovie INT,
ALTER TABLE Sceance ADD FOREIGN KEY (fk_idMovie) REFERENCES Movie;

ALTER TABLE Reservation ADD fk_idCustomers INT,
ALTER TABLE Reservation ADD FOREIGN KEY (fk_idCustomers) REFERENCES Customers;

ALTER TABLE Reservation ADD fk_idSceance INT
ALTER TABLE Reservation ADD FOREIGN KEY (fk_idSceance) REFERENCES Sceance;

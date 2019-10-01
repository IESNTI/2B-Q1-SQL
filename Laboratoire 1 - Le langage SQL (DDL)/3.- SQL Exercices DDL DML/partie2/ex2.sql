USE student;

CREATE TABLE Local (
    Etage NUMERIC(1) NOT NULL,
    Numero NUMERIC(2) NOT NULL,
    NbPlaces NUMERIC(3),
    PRIMARY KEY (Etage, Numero)
);
USE student;

CREATE TABLE Local (
    Etage NUMERIC(1) NOT NULL,
    Numero NUMERIC(2) NOT NULL,
    NbPlaces NUMERIC(3),
    CONSTRAINT Etage_Numero PRIMARY KEY (Etage, Numero)
);
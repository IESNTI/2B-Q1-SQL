USE student;

CREATE TABLE Pc(
    Matricule VARCHAR(10) NOT NULL PRIMARY KEY,
    Etage NUMERIC(1) NOT NULL,
    Numero NUMERIC(2) NOT NULL,
    CONSTRAINT Etage_Numero_Fk FOREIGN KEY (Etage, Numero) REFERENCES Local(Etage, Numero)
);
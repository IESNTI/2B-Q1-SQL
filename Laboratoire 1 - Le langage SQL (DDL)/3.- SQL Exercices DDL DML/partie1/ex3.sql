USE student;
CREATE TABLE Personne(
    NumCarteId NUMERIC(20) NOT NULL PRIMARY KEY,
    NomPrenom VARCHAR(100) NOT NULL,
    NbEnfants NUMERIC(2),
    Salaire DECIMAL(6,2),
    Localite NUMERIC(3) NOT NULL,
    FOREIGN KEY (Localite) REFERENCES Localite(NumLoc)
);
USE student;

CREATE TABLE SessionTravail(
    Login VARCHAR(20) NOT NULL,
    Pc VARCHAR(10) NOT NULL,
    Debut DATE NOT NULL,
    Fin DATE,
    FOREIGN KEY (Login) REFERENCES Utilisateur(UserName),
    FOREIGN KEY (Pc) REFERENCES Pc(Matricule)
);
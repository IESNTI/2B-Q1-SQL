USE student;

CREATE TABLE SessionTravail(
    Login VARCHAR(20) NOT NULL,
    Pc VARCHAR(10) NOT NULL,
    Debut DATE NOT NULL,
    Fin DATE,
    CONSTRAINT Login_Pc_Fk PRIMARY KEY(Login, Pc, Debut),
    CONSTRAINT Login_Fk FOREIGN KEY (Login) REFERENCES Utilisateur(UserName),
    CONSTRAINT Pc_Fk FOREIGN KEY (Pc) REFERENCES Pc(Matricule)
);
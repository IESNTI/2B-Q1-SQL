USE student;

CREATE TABLE Utilisateur(
    UserName VARCHAR(20) NOT NULL PRIMARY KEY,
    Nom VARCHAR(30) NOT NULL,
    Prenom VARCHAR(50) NOT NULL,
    Categorie VARCHAR(20) NOT NULL CHECK (
        Categorie IN ('Etudiant','Professeur','Administrateur')
    ),
    DateCreation DATE NOT NULL,
    CONSTRAINT Nom_Prenom_Unique
        UNIQUE(Nom, Prenom)
);
USE student;

INSERT INTO Utilisateur(UserName, Nom, Prenom, Categorie, DateCreation) VALUES
    ("melchiorn", "Melchior", "Nicolas", "Professeur", STR_TO_DATE("11/12/2015", "%d/%m/%Y")),
    ("vandammeb", "Van Damme", "Benjamin", "Professeur", STR_TO_DATE("05/08/2019", "%d/%m/%Y")),
    ("smala", "Smal", "Anne", "Professeur", STR_TO_DATE("03/02/2018", "%d/%m/%Y")),
    ("petenjp", "Peten", "Jean-Pol", "Professeur", STR_TO_DATE("20/10/2017", "%d/%m/%Y")),
    ("hulotn", "Hulot", "Nicolas", "Etudiant", STR_TO_DATE("10/10/2011", "%d/%m/%Y")),
    ("restiauxf", "Restiaux", "Fabian", "Administrateur", STR_TO_DATE("28/06/2014", "%d/%m/%Y"));

INSERT INTO Local(Etage, Numero, NbPlaces) VALUES
    (1, 10, 25),
    (0, 15, 50),
    (2, 5, 12),
    (1, 7, 24),
    (2, 2, 48);

INSERT INTO Pc(Matricule, Etage, Numero) VALUES
    ("ie1001", 0, 15),
    ("ie0799", 1, 10),
    ("ie1245", 2, 2),
    ("ie1233", 0, 15),
    ("ie0599", 2, 2),
    ("ie0459", 1, 7),
    ("ie0958", 1, 7);

INSERT INTO SessionTravail(Login, Pc, Debut, Fin) VALUES
    ("vandammeb", "ie0459", STR_TO_DATE("29/09/2019", "%d/%m/%Y"), STR_TO_DATE("30/09/2019", "%d/%m/%Y")),
    ("petenj", "ie1245", STR_TO_DATE("25/09/2019", "%d/%m/%Y")),
    ("melchiorn", "ie1001", STR_TO_DATE("16/09/2019", "%d/%m/%Y"), STR_TO_DATE("17/09/2019", "%d/%m/%Y")),
    ("restiauxf", "ie1001", STR_TO_DATE("20/09/2019", "%d/%m/%Y"));

USE student;

INSERT INTO Utilisateur(UserName, Nom, Prenom, Categorie, DateCreation) VALUES
    ("melchiorn", "Melchior", "Nicolas", "Professeur", STR_TO_DATE("11/12/2015", "%d/%m/%Y")),
    ("vandammeb", "Van Damme", "Benjamin", "Professeur", STR_TO_DATE("05/08/2019", "%d/%m/%Y")),
    ("smala", "Smal", "Anne", "Professeur", STR_TO_DATE("03/02/2018", "%d/%m/%Y")),
    ("petenjp", "Peten", "Jean-Pol", "Professeur", STR_TO_DATE("20/10/2017", "%d/%m/%Y")),
    ("hulotn", "Hulot", "Nicolas", "Etudiant", STR_TO_DATE("10/10/2011", "%d/%m/%Y")),
    ("restiauxf", "Restiaux", "Fabian", "Administrateur", STR_TO_DATE("28/06/2014", "%d/%m/%Y"));
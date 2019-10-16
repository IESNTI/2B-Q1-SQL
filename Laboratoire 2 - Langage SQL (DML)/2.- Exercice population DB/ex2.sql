USE student;

/* WONT WORK BECAUSE
-> ERROR 1452 (23000) at line 3: Cannot add or update a child row: a foreign key constraint fails (`student`.`SessionTravail`, CONSTRAINT `Pc_Fk` FOREIGN KEY (`Pc`) REFERENCES `Pc` (`Matricule`))

INSERT INTO SessionTravail(Login, Pc, Debut) VALUES
    ("vandammeb", "ie0600", STR_TO_DATE("25/09/2019", "%d/%m/%Y"));
*/

/* WONT WORK BECAUSE
-> ERROR 1451 (23000) at line 10: Cannot delete or update a parent row: a foreign key constraint fails (`student`.`Pc`, CONSTRAINT `Etag_Numero_Fk` FOREIGN KEY (`Etage`, `Numero`) REFERENCES `Local` (`Etage`, `Numero`))
DELETE FROM Local WHERE Etage = "2" AND Numero = "2";

*/

DELETE FROM Local WHERE Etage = "2" AND Numero = "5";
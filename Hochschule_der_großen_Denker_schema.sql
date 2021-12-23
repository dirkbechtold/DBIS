DROP TABLE hoeren;
DROP TABLE voraussetzen;
DROP TABLE pruefen;
DROP TABLE Vorlesungen;
DROP TABLE Studenten;
DROP TABLE Assistenten;
DROP TABLE Professoren;

CREATE TABLE Studenten
       (MatrNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Semester       INTEGER);

CREATE TABLE Professoren
       (PersNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Rang           CHAR(2) CHECK (Rang in ('C2', 'C3', 'C4')),
        Raum           INTEGER UNIQUE);

CREATE TABLE Assistenten
       (PersNr         INTEGER PRIMARY KEY,
        Name           VARCHAR(30) NOT NULL,
        Fachgebiet     VARCHAR(30),
        Boss           INTEGER,
        FOREIGN KEY    (Boss) REFERENCES Professoren);

CREATE TABLE Vorlesungen
       (VorlNr         INTEGER PRIMARY KEY,
        Titel          VARCHAR(30),
        SWS            INTEGER,
        gelesenVon     INTEGER REFERENCES Professoren);

CREATE TABLE hoeren
       (MatrNr         INTEGER REFERENCES Studenten ON DELETE CASCADE,
        VorlNr         INTEGER REFERENCES Vorlesungen ON DELETE CASCADE,
        PRIMARY KEY    (MatrNr, VorlNr));

CREATE TABLE voraussetzen
       (Vorgaenger     INTEGER REFERENCES Vorlesungen ON DELETE CASCADE,
        Nachfolger     INTEGER REFERENCES Vorlesungen ON DELETE CASCADE,
        PRIMARY KEY    (Vorgaenger, Nachfolger));

CREATE TABLE pruefen
       (MatrNr         INTEGER REFERENCES Studenten ON DELETE CASCADE,
        VorlNr         INTEGER REFERENCES Vorlesungen,
        PersNr         INTEGER REFERENCES Professoren,
        Note           NUMERIC(2,1) CHECK (Note between 0.7 and 5.0),
        PRIMARY KEY    (MatrNr, VorlNr));
  
--Eigene Beispiele--

Create Sequence Standard_Sequenz;

Create Sequence Professoren_Sequenz
Start with 2137
Increment by 1;

drop Sequence Professoren_Sequenz;





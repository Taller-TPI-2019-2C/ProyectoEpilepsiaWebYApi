CREATE DATABASE ProyectoEpilepsia
USE ProyectoEpilepsia
CREATE TABLE tbl_User(
	UserID INT IDENTITY,
	Email VARCHAR(200) NOT NULL,
	Patient BIT NOT NULL,
	Password CHAR(40) NOT NULL,
	CONSTRAINT PK_User PRIMARY KEY(UserID),
	CONSTRAINT UNQ_Login UNIQUE(Email)
);

CREATE TABLE tbl_PatientData(
	UserID INT NOT NULL,
	BirthDate DATE NOT NULL,
	CONSTRAINT PK_Patient PRIMARY KEY (UserID),
	CONSTRAINT FK_PatientUser FOREIGN KEY (UserID) REFERENCES tbl_User(UserID),
	FirstName VARCHAR(50),
	LastName VARCHAR(50)
);

CREATE TABLE tbl_NonPatientData(
	UserID INT NOT NULL,
	BirthDate DATE NOT NULL,
	CONSTRAINT PK_NonPatient PRIMARY KEY (UserID),
	CONSTRAINT FK_NonPatientUser FOREIGN KEY (UserID) REFERENCES tbl_User(UserID),
	FirstName VARCHAR(50),
	LastName VARCHAR(50)
);

CREATE TABLE tbl_Guardian(
	Patient INT,
	NonPatient INT,
	CONSTRAINT PK_Guardian PRIMARY KEY (Patient,NonPatient),
	CONSTRAINT FK_GuardianPatient FOREIGN KEY (Patient) REFERENCES tbl_PatientData(UserID),
	CONSTRAINT FK_GuardianNonPatient FOREIGN KEY (NonPatient) REFERENCES tbl_NonPatientData(UserID)
);

INSERT INTO tbl_User(Email,Password,Patient) VALUES
	('paciente1','123',1),
	('nopaciente1','123',0);

INSERT INTO tbl_PatientData(UserID,BirthDate,FirstName,LastName) VALUES
	((SELECT UserID FROM tbl_User WHERE Email='paciente1'),'1990-01-01','jose','paciente');

INSERT INTO tbl_NonPatientData(UserID,BirthDate,FirstName,LastName) VALUES
	((SELECT UserID FROM tbl_User WHERE Email='nopaciente1'),'1990-01-01','pepe','tutor');

INSERT INTO tbl_Guardian(Patient,NonPatient) VALUES
	((SELECT UserID FROM tbl_User WHERE Email='paciente1'),(SELECT UserID FROM tbl_User WHERE Email='nopaciente1'));
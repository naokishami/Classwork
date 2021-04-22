CREATE DATABASE IF NOT EXISTS DocOffice;
USE DocOffice;

-- Question 1 table creation
DROP TABLE IF EXISTS person;
CREATE TABLE person(
  personID int(10) NOT NULL,
  lastName varchar(50) default NULL,
  firstName varchar(50) default NULL,
  streetAdress varchar(50) default NULL,
  city varchar(50) default NULL,
  state varchar(2) default NULL,
  zip varchar(9) default NULL,
  phoneNumber varchar(11) not NULL,
  SSN varchar(11) default NULL,
  PRIMARY KEY  (personID)
);

DROP TABLE IF EXISTS patient;
CREATE TABLE patient (
  patientID int(10) NOT NULL,
  DOB varchar(11) default NULL,
  phoneNumber varchar(11) not NULL,
  personID int(10) NOT NULL,
  PRIMARY KEY  (patientID),
  FOREIGN KEY (personID)
      REFERENCES person(personID)
      ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS doctor;
CREATE TABLE doctor (
  doctorID varchar(10) NOT NULL,
  medicalDegree varchar(11) default NULL,
  personID int(10) NOT NULL,
  PRIMARY KEY  (doctorID),
  FOREIGN KEY (personID)
      REFERENCES person(personID)
      ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS specialty;
CREATE TABLE specialty (
  specialtyID int(10) NOT NULL,
  specialtyName varchar(40) NOT NULL,
  PRIMARY KEY  (specialtyID)
);

DROP TABLE IF EXISTS doctorSpecialty;
CREATE TABLE doctorSpecialty (
  doctorID varchar(10) NOT NULL,
  specialtyID int(10) NOT NULL,
  FOREIGN KEY (doctorID)
      REFERENCES doctor(doctorID)
      ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (specialtyID)
      REFERENCES specialty(specialtyID)
      ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS patientVisit;
CREATE TABLE patientVisit (
  visitID int(10) NOT NULL,
  patientID int(10) NOT NULL,
  doctorID varchar(10) NOT NULL,
  docNote varchar(1000) NOT NULL,
  visitDate varchar(11) NOT NULL,
  PRIMARY KEY  (visitID),
  FOREIGN KEY (doctorID)
      REFERENCES doctor(doctorID)
      ON UPDATE CASCADE,
  FOREIGN KEY (patientID)
	  REFERENCES patient(patientID)
      ON UPDATE CASCADE
);

DROP TABLE IF EXISTS test;
CREATE TABLE test (
  testID int(10) NOT NULL,
  testName varchar(40) NOT NULL,
  PRIMARY KEY (testID)
);

DROP TABLE IF EXISTS PVisitTest;
CREATE TABLE PVisitTest (
  visitID int(10) NOT NULL,
  testID int(10) NOT NULL,
  FOREIGN KEY (visitID)
      REFERENCES patientVisit(visitID)
      ON UPDATE CASCADE,
  FOREIGN KEY (testID)
	  REFERENCES test(testID)
      ON UPDATE CASCADE
);

DROP TABLE IF EXISTS prescription;
CREATE TABLE prescription (
  prescriptionID int(10) NOT NULL,
  prescriptionName varchar(50) NOT NULL,
  PRIMARY KEY (prescriptionID)
);

DROP TABLE IF EXISTS PVisitPrescription;
CREATE TABLE PVisitPrescription (
  prescriptionID int(10) NOT NULL,
  visitID int(10) NOT NULL,
  FOREIGN KEY (visitID)
      REFERENCES patientVisit(visitID)
      ON UPDATE CASCADE,
  FOREIGN KEY (prescriptionID)
	  REFERENCES prescription(prescriptionID)
      ON UPDATE CASCADE
);

SET foreign_key_checks = 0;
SET foreign_key_checks = 1;

SET SQL_SAFE_UPDATES = 0;
-- Data Creation
INSERT INTO specialty VALUES (1, 'allergy');
INSERT INTO specialty VALUES (2, 'anesthesiology');
INSERT INTO specialty VALUES (3, 'diagnostic radiology');
INSERT INTO specialty VALUES (4, 'emergency medicine');
INSERT INTO specialty VALUES (5, 'family medicine');
INSERT INTO specialty VALUES (6, 'internal medicine');
INSERT INTO specialty VALUES (7, 'neurology');

INSERT INTO person VALUES (109, 'Stevens', 'Robert', '1464 Duke Dr.', 'Fullerton', 'CA', '44644434','6264838509','343-34-542');
INSERT INTO person VALUES (132, 'Jhon', 'Smith', '5 Pearl Lane', 'Webster', 'NY', '145801346','8539575837','541-98-182');
INSERT INTO person VALUES (122, 'Mary', 'Sun', '8798 Lakewood St.', 'Brainerd', 'CA', '564019574','8469578579','948-04-794');
INSERT INTO person VALUES (103, 'Steve', 'Jobs', '80 Court Ave.', 'Appletontest', 'WI', '549119486','8497213423','888-12-111');
INSERT INTO person VALUES (119, 'Amy', 'James', '2 Richardson St.', 'Clarkston', 'MI', '483489400','0388904787','112-74-689');
INSERT INTO person VALUES (111, 'Linda', 'Kim', '650 Alderwood Street', 'Newport News', 'VA', '236019042','0946238964','584-39-954');
INSERT INTO person VALUES (124, 'Stevens', 'Jackson', '3 Hickory Road', 'Griffin', 'GA', '302234645','8407583754','563-85-174');
INSERT INTO person VALUES (125, 'King', 'Jackson', '3 Hickory Road', 'Griffin', 'GA', '302234645','8407583444','432-13-444');


INSERT INTO prescription VALUES (4535,'vicodin');
INSERT INTO prescription VALUES (5833,'simvastatin');
INSERT INTO prescription VALUES (4214,'lisinopril');
INSERT INTO prescription VALUES (5657,'levothyroxine');
INSERT INTO prescription VALUES (3689,'azithromycin');
INSERT INTO prescription VALUES (7532,'lipitor');
INSERT INTO prescription VALUES (5778,'amlodipine');
INSERT INTO prescription VALUES (1349,'hydrochlorothiazide');

INSERT INTO doctor VALUES ('SR1040', 'PhD', 109);
INSERT INTO doctor VALUES ('JS5754', 'PhD', 132);
INSERT INTO doctor VALUES ('KJ3532', 'PhD', 125);

INSERT INTO doctorspecialty VALUES ('SR1040',1);
INSERT INTO doctorspecialty VALUES ('SR1040',3);
INSERT INTO doctorspecialty VALUES ('SR1040',2);
INSERT INTO doctorspecialty VALUES ('JS5754',2);
INSERT INTO doctorspecialty VALUES ('JS5754',6);


INSERT INTO patient VALUES (343, '04-02-1989','6265484678',109);
INSERT INTO patient VALUES (222, '10-08-1990','5897569305',132);
INSERT INTO patient VALUES (534, '02-12-1979','5839673156',122);
INSERT INTO patient VALUES (432, '12-11-1981','4859349593',103);
INSERT INTO patient VALUES (342, '09-12-1984','3459406831',119);
INSERT INTO patient VALUES (111, '01-01-2003','1349483845',111);

INSERT INTO test VALUES (342, 'blood test');
INSERT INTO test VALUES (331, 'A1C');
INSERT INTO test VALUES (231, 'throid test');
INSERT INTO test VALUES (853, 'kidney biopsy');
INSERT INTO test VALUES (143, 'liver biopsy');

insert INTO patientvisit VALUES(3,343,"SR1040","He need to do a few test!","04-12-2019");
insert INTO patientvisit VALUES(4,343,"SR1040","He still need to do a few test!","04-20-2019");
insert INTO patientvisit VALUES(5,343,'JS5754',"He seems to be healthy!","04-30-2019");
insert INTO patientvisit VALUES(6,222,'JS5754',"EZ MONEY!","04-30-2019");
insert INTO patientvisit VALUES(10,534,'JS5754',"GO DO SOME TEST!","01-01-2020");
insert INTO patientvisit VALUES(17,534,'JS5754',"He some medicine!","01-01-2019");
insert INTO patientvisit VALUES(31,432,"SR1040","He seems to be healthy!","07-03-2019");
insert INTO patientvisit VALUES(18,342,"SR1040","He seems to be healthy!","04-07-2019");
insert INTO patientvisit VALUES(25,111,'JS5754',"He seems to be healthy!","12-12-2018");


INSERT INTO pvisittest VALUES (3, 342);
INSERT INTO pvisittest VALUES (3, 331);
INSERT INTO pvisittest VALUES (3, 231);
INSERT INTO pvisittest VALUES (4, 331);
INSERT INTO pvisittest VALUES (5, 853);
INSERT INTO pvisittest VALUES (5, 331);
INSERT INTO pvisittest VALUES (6, 342);
INSERT INTO pvisittest VALUES (10, 853);
INSERT INTO pvisittest VALUES (17, 342);
INSERT INTO pvisittest VALUES (25, 231);

INSERT INTO pvisitprescription VALUES (4535, 3);
INSERT INTO pvisitprescription VALUES (5833, 3);
INSERT INTO pvisitprescription VALUES (1349, 3);
INSERT INTO pvisitprescription VALUES (5778, 4);
INSERT INTO pvisitprescription VALUES (3689, 5);
INSERT INTO pvisitprescription VALUES (5657, 6);
INSERT INTO pvisitprescription VALUES (4535, 10);
INSERT INTO pvisitprescription VALUES (5833, 10);
INSERT INTO pvisitprescription VALUES (1349, 17);
INSERT INTO pvisitprescription VALUES (5778, 31);
INSERT INTO pvisitprescription VALUES (3689, 18);
INSERT INTO pvisitprescription VALUES (5657, 25);


-- Question 2 Steven Robert's Patient
DROP VIEW IF EXISTS RobertStevensPatients;
CREATE VIEW RobertStevensPatients AS SELECT DISTINCT patient.phoneNumber, person.firstname, person.lastname
FROM patient, patientvisit, person
WHERE doctorID = "SR1040" AND patient.patientID = patientvisit.patientID 
	AND person.personID = patient.personID;
SELECT *
FROM RobertStevensPatients;

-- Question 3 Doctors Who Gave out Vicodin
DROP VIEW IF EXISTS DoctorWhoGaveOutVicodin;
CREATE VIEW DoctorWhoGaveOutVicodin AS SELECT firstName, lastname
FROM person, doctor, pvisitprescription, patientvisit, prescription
WHERE person.personID = doctor.personID AND prescriptionName = "vicodin"
AND pvisitprescription.visitID = patientvisit.visitID AND doctor.doctorID = patientvisit.doctorID
AND pvisitprescription.prescriptionID = prescription.prescriptionID;
SELECT *
FROM DoctorWhoGaveOutVicodin;


-- Question 4 All Doctor's specialty
DROP VIEW IF EXISTS AllDoctorSpecialty;
CREATE VIEW AllDoctorSpecialty AS SELECT firstname,lastname,specialtyName
FROM person, doctor, doctorspecialty, specialty
WHERE person.personID = doctor.personID AND doctor.doctorID = doctorspecialty.doctorID 
	AND doctorspecialty.specialtyID = specialty.specialtyID;
SELECT * 
FROM AllDoctorSpecialty;


-- Question 5
DROP VIEW IF EXISTS AllDoctorSpecialtyWithNoSpecialty;
CREATE VIEW AllDoctorSpecialtyWithNoSpecialty AS SELECT firstname,lastname,specialtyName
FROM person, doctor, doctorspecialty, specialty
WHERE person.personID = doctor.personID AND doctor.doctorID = doctorspecialty.doctorID 
	AND doctorspecialty.specialtyID = specialty.specialtyID
UNION
SELECT person.firstname, person.lastname, NULL as specialtyName
FROM doctor, person
WHERE doctor.doctorID NOT IN (
SELECT DISTINCT doctor.doctorID
FROM doctor, doctorspecialty
WHERE doctor.doctorID = doctorspecialty.doctorID) AND doctor.personID = person.personID;
SELECT * 
FROM AllDoctorSpecialtyWithNoSpecialty;


-- Question 6
DROP TABLE IF EXISTS audit;
CREATE TABLE audit (
     doctorFirstName VARCHAR(50),
     actionMade VARCHAR(6),
     specialty VARCHAR(40),
     dateOfModification VARCHAR(15)
);
DROP TRIGGER IF EXISTS docoffice.update_docspecialty;

DELIMITER $$
CREATE TRIGGER update_docspecialty
AFTER UPDATE 
ON doctorspecialty FOR EACH ROW
BEGIN
	INSERT INTO audit(doctorFirstName, actionMade, specialty,dateOfModification)
	VALUES((SELECT firstName FROM person, doctor WHERE doctor.doctorID = NEW.doctorID LIMIT 1), "update", (SELECT specialtyName FROM specialty WHERE NEW.specialtyID = specialty.specialtyID), CURDATE()
);
END$$
DELIMITER ;

DROP TRIGGER IF EXISTS docoffice.insert_docspecialty;
DELIMITER $$
CREATE TRIGGER insert_docspecialty
AFTER INSERT 
ON doctorspecialty FOR EACH ROW
BEGIN
	INSERT INTO audit(doctorFirstName, actionMade, specialty,dateOfModification)
	VALUES((SELECT firstName FROM person, doctor WHERE doctor.doctorID = NEW.doctorID LIMIT 1), "insert", (SELECT specialtyName FROM specialty WHERE NEW.specialtyID = specialty.specialtyID), CURDATE()
);
END$$
DELIMITER ;
SHOW TRIGGERS FROM docoffice;


-- Extra Credit
SELECT count(prescriptionName) AS people, prescriptionName
FROM person, patient, patientvisit, pvisitprescription,prescription
WHERE city = "fullerton" AND person.personID = patient.personID AND patientvisit.patientID = patient.patientID
AND pvisitprescription.visitID = patientvisit.visitID AND prescription.prescriptionID = pvisitprescription.prescriptionID;

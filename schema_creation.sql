CREATE SCHEMA NursingHome

/* PATIENT */

CREATE TABLE NursingHome.PATIENT (
    Patient_id Varchar(4) PRIMARY KEY,
    Patient_name Varchar(30) NOT NULL,
    Gender Varchar(1) CHECK (Gender IN ('M','F')),
    Date_of_birth Date NOT NULL,
    Phone_no Decimal(10) UNIQUE,
    Date_in Date DEFAULT CURRENT_DATE,
    Date_out Date 
);

/* LOCAL_GUARDIAN */

CREATE TABLE NursingHome.LOCAL_GUARDIAN(
    Patient_id Varchar(4) PRIMARY KEY,
    Guardian_name Varchar(30) NOT NULL,
    Gender Varchar(1) CHECK (Gender IN ('M','F')),
    Address Varchar(40) NOT NULL,
    Phone_no Decimal(10) NOT NULL UNIQUE,
    FOREIGN KEY (Patient_id) REFERENCES NursingHome.PATIENT(Patient_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

/* NURSE */

CREATE TABLE NursingHome.NURSE(
    Nurse_id Varchar(4) PRIMARY KEY,
    Nurse_name Varchar(30) NOT NULL,
    Gender Varchar(1) CHECK (Gender IN ('M','F')),
    Phone_no Decimal(10) NOT NULL UNIQUE
);


/* NURSE_PATIENT_ASSIGNMENT */

CREATE TABLE NursingHome.NURSE_PATIENT_ASSIGNMENT(
    Nurse_id Varchar(4) PRIMARY KEY,
    Patient_id Varchar(4) UNIQUE NOT NULL,
    FOREIGN KEY (Nurse_id) REFERENCES NursingHome.NURSE(Nurse_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Patient_id) REFERENCES NursingHome.PATIENT(Patient_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

/* ROOM */

CREATE TABLE NursingHome.ROOM(
    Room_id Decimal(3) PRIMARY KEY,
    Status Varchar(6) CHECK (Status IN ('Empty','Filled')),
    Floor_no Decimal(1) CHECK (Floor_no>=1 AND Floor_no<=4)
);


/* ROOM_ASSIGNMENT */

CREATE TABLE NursingHome.ROOM_ASSIGNMENT(
    Room_id Decimal(3) PRIMARY KEY,
    Patient_id Varchar(4) UNIQUE NOT NULL,
    FOREIGN KEY (Room_id) REFERENCES NursingHome.ROOM(Room_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Patient_id) REFERENCES NursingHome.PATIENT(Patient_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);


/* CLEANER */

CREATE TABLE NursingHome.CLEANER(
    Cleaner_id Varchar(4) PRIMARY KEY,
    Cleaner_name Varchar(30) NOT NULL,
    Gender Varchar(1) CHECK (Gender IN ('M','F')),
    Phone_no Decimal(10) NOT NULL UNIQUE    
);

/* CLEANER_ROOM_ASSIGNMENT */

CREATE TABLE NursingHome.CLEANER_ROOM_ASSIGNMENT(
    Room_id  Decimal(3) PRIMARY KEY,
    Cleaner_id Varchar(4) NOT NULL,
    FOREIGN KEY (Room_id) REFERENCES NursingHome.ROOM(Room_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Cleaner_id) REFERENCES NursingHome.CLEANER(Cleaner_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);

/* BILL */ 

CREATE TABLE NursingHome.BILL(
    Bill_id SERIAL PRIMARY KEY,
    Patient_id Varchar(4),
    Amount Decimal(10),
    Reason Varchar(20),
    FOREIGN KEY (Patient_id) REFERENCES NursingHome.PATIENT(Patient_id)
    ON DELETE CASCADE ON UPDATE CASCADE
);


/* MEDICINE */

CREATE TABLE NursingHome.MEDICINE(
    Medicine_id Varchar(4) PRIMARY KEY,
    Medicine_name Varchar(40) UNIQUE NOT NULL,
    Price Decimal(5) NOT NULL
);

/* PATIENT_MEDICATION_REQUIREMENTS */

CREATE TABLE NursingHome.PATIENT_MEDICATION_REQUIREMENTS(
    Patient_id Varchar(4),
    Medicine_id Varchar(4),
    PRIMARY KEY (Patient_id,Medicine_id),
    FOREIGN KEY (Patient_id) REFERENCES NursingHome.PATIENT(Patient_id)
    ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Medicine_id) REFERENCES NursingHome.MEDICINE(Medicine_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);

/* DISEASE */

CREATE TABLE NursingHome.DISEASE(
    Disease_id Varchar(4) PRIMARY KEY,
    Disease_name Varchar(40) UNIQUE NOT NULL
);


/* TREATMENTS */

CREATE TABLE NursingHome.TREATMENTS(
    Medicine_id Varchar(4) PRIMARY KEY,
    Disease_id Varchar(4) NOT NULL,
    FOREIGN KEY (Medicine_id) REFERENCES NursingHome.MEDICINE(Medicine_id)
    ON DELETE RESTRICT ON UPDATE CASCADE,
    FOREIGN KEY (Disease_id) REFERENCES NursingHome.DISEASE(Disease_id)
    ON DELETE RESTRICT ON UPDATE CASCADE
);
















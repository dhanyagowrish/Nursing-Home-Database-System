/* PATIENT_LOG table to audit all former elderly patients */

CREATE TABLE NursingHome.PATIENT_LOG(
    Patient_id VARCHAR(4) UNIQUE NOT NULL,
    Patient_name VARCHAR(30) NOT NULL,
    Date_in Date,
    Date_out Date
);

/*  function */

CREATE OR REPLACE FUNCTION patient_release()
    RETURNS trigger AS
$$
DECLARE
    room_patient_id NursingHome.ROOM.Room_id%TYPE;
BEGIN
    IF NEW.Date_out='today' THEN
        SELECT Room_id INTO room_patient_id FROM NursingHome.ROOM_ASSIGNMENT WHERE Patient_id=OLD.Patient_id;
        UPDATE NursingHome.ROOM SET Status='Empty' WHERE Room_id=room_patient_id;
        DELETE FROM NursingHome.PATIENT WHERE Patient_id=OLD.Patient_id;
        DELETE FROM NursingHome.CLEANER_ROOM_ASSIGNMENT WHERE Room_id=room_patient_id;

        INSERT INTO NursingHome.PATIENT_LOG(Patient_id,Patient_name,Date_in,Date_out) VALUES (OLD.Patient_id,OLD.Patient_name,OLD.Date_in,NEW.Date_out);

    END IF;
    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';


/* trigger */

CREATE TRIGGER releasing_a_patient
  AFTER UPDATE
  ON NursingHome.PATIENT
  FOR EACH ROW
  EXECUTE PROCEDURE patient_release();
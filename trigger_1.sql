/* TRIGGER FUNCTION */

CREATE OR REPLACE FUNCTION patient_insert()
    RETURNS trigger AS
$$
DECLARE
    room_new_id NursingHome.ROOM.Room_id%TYPE;
    nurse_new_id NursingHome.NURSE.Nurse_id%TYPE;
    cleaner_new_id NursingHome.CLEANER.Cleaner_id%TYPE;
BEGIN
    SELECT Room_id INTO room_new_id FROM NursingHome.ROOM WHERE Status='Empty' LIMIT 1;
    INSERT INTO NursingHome.ROOM_ASSIGNMENT VALUES (room_new_id,NEW.Patient_id);
    UPDATE NursingHome.ROOM SET Status='Filled' WHERE Room_id=room_new_id;

    SELECT n1.Nurse_id INTO nurse_new_id FROM NursingHome.NURSE as n1 LEFT JOIN NursingHome.NURSE_PATIENT_ASSIGNMENT as n2 ON n1.Nurse_id=n2.Nurse_id WHERE n2.Nurse_id IS NULL LIMIT 1;
    INSERT INTO NursingHome.NURSE_PATIENT_ASSIGNMENT VALUES (nurse_new_id,NEW.Patient_id);

    SELECT Cleaner_id INTO cleaner_new_id FROM NursingHome.CLEANER ORDER BY RANDOM() LIMIT 1;
    INSERT INTO NursingHome.CLEANER_ROOM_ASSIGNMENT VALUES (room_new_id,cleaner_new_id);

    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';



/* CREATE TRIGGER */

CREATE TRIGGER inserting_new_patient
  AFTER INSERT
  ON NursingHome.PATIENT
  FOR EACH ROW
  EXECUTE PROCEDURE patient_insert();




    








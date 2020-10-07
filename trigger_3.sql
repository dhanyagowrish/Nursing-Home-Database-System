/* function */

CREATE OR REPLACE FUNCTION requirement_delete()
    RETURNS trigger AS
$$
DECLARE
    count1 Decimal(3);
    count2 Decimal(3);
    corresp_disease NursingHome.DISEASE.Disease_id%TYPE;
BEGIN
    SELECT Disease_id INTO corresp_disease FROM NursingHome.TREATMENTS WHERE Medicine_id=OLD.Medicine_id;
    SELECT no_patients INTO count1 FROM (SELECT Medicine_id,COUNT(Medicine_id) as no_patients FROM (NursingHome.PATIENT_MEDICATION_REQUIREMENTS NATURAL JOIN NursingHome.TREATMENTS) GROUP BY Medicine_id) as m WHERE Medicine_id=OLD.Medicine_id;
    IF count1 IS NULL THEN
        DELETE FROM NursingHome.TREATMENTS WHERE Medicine_id=OLD.Medicine_id;
        DELETE FROM NursingHome.MEDICINE WHERE Medicine_id=OLD.Medicine_id;
    END IF;

    SELECT no_suffering INTO count2 FROM (SELECT Disease_id,Count(Disease_id) AS no_suffering FROM ((NursingHome.MEDICINE NATURAL JOIN NursingHome.DISEASE) NATURAL JOIN NursingHome.TREATMENTS) GROUP BY Disease_ID) as n WHERE Disease_id=corresp_disease;

    IF count2 IS NULL THEN 
        DELETE FROM NursingHome.DISEASE WHERE Disease_id=corresp_disease;
    END IF;

    RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

/* trigger */

CREATE TRIGGER delete_med_disease
  AFTER DELETE
  ON NursingHome.PATIENT_MEDICATION_REQUIREMENTS
  FOR EACH ROW
  EXECUTE PROCEDURE requirement_delete();
  






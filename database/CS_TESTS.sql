--"Sleep Disorders Investigation," COUNT
SELECT p.patient_name, COUNT(DISTINCT sp.patient_id) AS patients_with_sleep_disorder
FROM tbl_study_participants sp
JOIN tbl_studies s ON sp.study_id = s.study_id
JOIN tbl_patients p ON sp.patient_id = p.patient_id
WHERE s.study_name = 'Sleep Disorders Investigation'
GROUP BY p.patient_name;


--Patients by disease
SELECT s.study_name AS disease,
       COUNT(DISTINCT sp.patient_id) AS number_of_patients
FROM tbl_study_participants sp
JOIN tbl_studies s ON sp.study_id = s.study_id
GROUP BY s.study_name;

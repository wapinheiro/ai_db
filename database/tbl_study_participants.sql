-- 6. tbl_study_participants
CREATE TABLE tbl_study_participants (
    participant_id SERIAL PRIMARY KEY,
    study_id INT NOT NULL,
    patient_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    completion_date DATE,
    FOREIGN KEY (study_id) REFERENCES tbl_studies(study_id),
    FOREIGN KEY (patient_id) REFERENCES tbl_patients(patient_id)
);

select * from tbl_study_participants;

-- Insert sample data into tbl_study_participants
INSERT INTO tbl_study_participants (study_id, patient_id, enrollment_date)
SELECT 
    study_id, 
    patient_id, 
    CURRENT_DATE - INTERVAL '1' DAY * RANDOM() * 365 AS enrollment_date
FROM 
    tbl_studies
CROSS JOIN 
    tbl_patients
ORDER BY 
    RANDOM()
LIMIT 
    100;

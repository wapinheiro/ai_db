-- 8. tbl_medical_records
CREATE TABLE tbl_medical_records (
    record_id SERIAL PRIMARY KEY,
    participant_id INT NOT NULL,
    visit_id INT NOT NULL,
    diagnosis VARCHAR(200),
    treatment VARCHAR(200),
    medication VARCHAR(100),
    FOREIGN KEY (participant_id) REFERENCES tbl_study_participants(participant_id),
    FOREIGN KEY (visit_id) REFERENCES tbl_study_visits(visit_id)
);

Select * from tbl_medical_records;

-- Insert sample data into tbl_medical_records
-- Update tbl_medical_records with randomly assigned diseases, treatments, and medications
UPDATE tbl_medical_records AS mr
SET
    diagnosis = (
        SELECT study_name
        FROM tbl_studies
        WHERE study_id = (
            SELECT study_id
            FROM tbl_study_participants
            WHERE participant_id = mr.participant_id
            LIMIT 1
        )
    ),
    treatment = CASE 
                    WHEN (SELECT study_name FROM tbl_studies WHERE study_id = (SELECT study_id FROM tbl_study_participants WHERE participant_id = mr.participant_id)) LIKE '%COVID%' THEN 'Rest, hydration, and symptomatic relief'
                    WHEN (SELECT study_name FROM tbl_studies WHERE study_id = (SELECT study_id FROM tbl_study_participants WHERE participant_id = mr.participant_id)) LIKE '%Diabetes%' THEN 'Insulin therapy and lifestyle modifications'
                    WHEN (SELECT study_name FROM tbl_studies WHERE study_id = (SELECT study_id FROM tbl_study_participants WHERE participant_id = mr.participant_id)) LIKE '%Hypertension%' THEN 'Lifestyle changes and antihypertensive medications'
                    ELSE 'General supportive care'
                END,
    medication = CASE 
                    WHEN (SELECT study_name FROM tbl_studies WHERE study_id = (SELECT study_id FROM tbl_study_participants WHERE participant_id = mr.participant_id)) LIKE '%COVID%' THEN 'Paracetamol, ibuprofen, and antiviral medications'
                    WHEN (SELECT study_name FROM tbl_studies WHERE study_id = (SELECT study_id FROM tbl_study_participants WHERE participant_id = mr.participant_id)) LIKE '%Diabetes%' THEN 'Insulin, metformin, and sulfonylureas'
                    WHEN (SELECT study_name FROM tbl_studies WHERE study_id = (SELECT study_id FROM tbl_study_participants WHERE participant_id = mr.participant_id)) LIKE '%Hypertension%' THEN 'ACE inhibitors, beta-blockers, and diuretics'
                    ELSE 'Pain relievers and antibiotics (if needed)'
                END;

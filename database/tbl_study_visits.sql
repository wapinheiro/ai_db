-- 7. tbl_study_visits
CREATE TABLE tbl_study_visits (
    visit_id SERIAL PRIMARY KEY,
    visit_date DATE NOT NULL,
    study_id INT NOT NULL,
    participant_id INT NOT NULL,
    visit_type VARCHAR(50) NOT NULL,
    visit_notes TEXT,
    FOREIGN KEY (study_id) REFERENCES tbl_studies(study_id),
    FOREIGN KEY (participant_id) REFERENCES tbl_study_participants(participant_id)
);

Select * from tbl_study_visits;


-- Insert sample data into tbl_study_visits
INSERT INTO tbl_study_visits (visit_date, study_id, participant_id, visit_type, visit_notes)
SELECT 
    CURRENT_DATE - INTERVAL '1' DAY * RANDOM() * 365 AS visit_date,
    sp.study_id,
    sp.participant_id,
    CASE 
        WHEN RANDOM() < 0.5 THEN 'Initial'
        ELSE 'Follow-up'
    END AS visit_type,
    'Sample visit notes' AS visit_notes
FROM 
    tbl_study_participants sp
ORDER BY 
    RANDOM()
LIMIT 
    (SELECT COUNT(*) FROM tbl_study_participants);

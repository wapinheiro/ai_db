-- 5. tbl_study_sites
CREATE TABLE tbl_study_sites (
    site_id SERIAL PRIMARY KEY,
    site_name VARCHAR(100) NOT NULL,
    site_location VARCHAR(200),
    clinic_id INT NOT NULL,
    study_id INT NOT NULL,
    FOREIGN KEY (clinic_id) REFERENCES tbl_clinics(clinic_id),
    FOREIGN KEY (study_id) REFERENCES tbl_studies(study_id)
);

Select * from tbl_study_sites;

-- Insert sample data into tbl_study_sites
INSERT INTO tbl_study_sites (site_name, site_location, clinic_id, study_id)
VALUES
    ('Site 1', '123 Main St, Anytown, USA', 1, 1),
    ('Site 2', '456 Elm St, Othertown, USA', 2, 2),
    ('Site 3', '789 Oak St, Anycity, USA', 3, 3),
    ('Site 4', '567 Pine St, Somewhereville, USA', 4, 4),
    ('Site 5', '890 Cedar St, Nowhereville, USA', 5, 5),
    ('Site 6', '901 Maple St, Anytown, USA', 6, 6),
    ('Site 7', '234 Oak St, Othertown, USA', 7, 7),
    ('Site 8', '567 Pine St, Anycity, USA', 8, 8),
    ('Site 9', '890 Cedar St, Somewhereville, USA', 9, 9),
    ('Site 10', '123 Elm St, Nowhereville, USA', 10, 10);

-- 4. tbl_clinics
CREATE TABLE tbl_clinics (
    clinic_id SERIAL PRIMARY KEY,
    clinic_name VARCHAR(100) NOT NULL,
    clinic_location VARCHAR(200),
    clinic_contact VARCHAR(20)
);

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

-- 2. tbl_patients
CREATE TABLE tbl_patients (
    patient_id SERIAL PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    patient_dob DATE NOT NULL,
    patient_gender VARCHAR(10),
    patient_address VARCHAR(200),
    patient_contact VARCHAR(20)
);

-- 3. tbl_researchers
CREATE TABLE tbl_researchers (
    researcher_id SERIAL PRIMARY KEY,
    researcher_name VARCHAR(100) NOT NULL,
    researcher_email VARCHAR(50),
    researcher_department VARCHAR(100)
);

-- 1. tbl_studies
CREATE TABLE tbl_studies (
    study_id SERIAL PRIMARY KEY,
    study_name VARCHAR(100) NOT NULL,
    study_description TEXT,
    study_start_date DATE NOT NULL,
    study_end_date DATE,
    principal_investigator_id INT NOT NULL
);

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


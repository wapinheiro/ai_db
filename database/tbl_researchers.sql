-- 3. tbl_researchers
CREATE TABLE tbl_researchers (
    researcher_id SERIAL PRIMARY KEY,
    researcher_name VARCHAR(100) NOT NULL,
    researcher_email VARCHAR(50),
    researcher_department VARCHAR(100)
);

Select * from tbl_researchers;


-- Insert sample data into tbl_researchers
INSERT INTO tbl_researchers (researcher_name, researcher_email, researcher_department)
VALUES
    ('Dr. Olivia Johnson', 'olivia.johnson@example.com', 'Cardiology'),
    ('Prof. William Smith', 'william.smith@example.com', 'Oncology'),
    ('Dr. Emily Brown', 'emily.brown@example.com', 'Neurology'),
    ('Prof. Michael Davis', 'michael.davis@example.com', 'Pediatrics'),
    ('Dr. Sophia Wilson', 'sophia.wilson@example.com', 'Endocrinology'),
    ('Prof. Ethan Garcia', 'ethan.garcia@example.com', 'Psychiatry'),
    ('Dr. Mia Anderson', 'mia.anderson@example.com', 'Dermatology'),
    ('Prof. Alexander Martinez', 'alexander.martinez@example.com', 'Gastroenterology'),
    ('Dr. Ava Taylor', 'ava.taylor@example.com', 'Rheumatology'),
    ('Prof. James Jackson', 'james.jackson@example.com', 'Pulmonology');

-- 4. tbl_clinics
CREATE TABLE tbl_clinics (
    clinic_id SERIAL PRIMARY KEY,
    clinic_name VARCHAR(100) NOT NULL,
    clinic_location VARCHAR(200),
    clinic_contact VARCHAR(20)
);

Select * from tbl_clinics;

-- Insert sample data into tbl_clinics
INSERT INTO tbl_clinics (clinic_name, clinic_location, clinic_contact)
VALUES
    ('Medical Center A', '123 Main St, Anytown, USA', '(555) 123-4567'),
    ('Hospital B', '456 Elm St, Othertown, USA', '(555) 987-6543'),
    ('Healthcare Center C', '789 Oak St, Anycity, USA', '(555) 456-7890'),
    ('Clinic D', '567 Pine St, Somewhereville, USA', '(555) 234-5678'),
    ('Hospital E', '890 Cedar St, Nowhereville, USA', '(555) 345-6789'),
    ('Medical Center F', '901 Maple St, Anytown, USA', '(555) 456-7890'),
    ('Clinic G', '234 Oak St, Othertown, USA', '(555) 567-8901'),
    ('Healthcare Center H', '567 Pine St, Anycity, USA', '(555) 678-9012'),
    ('Hospital I', '890 Cedar St, Somewhereville, USA', '(555) 789-0123'),
    ('Medical Center J', '123 Elm St, Nowhereville, USA', '(555) 890-1234');

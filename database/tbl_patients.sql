-- 2. tbl_patients
CREATE TABLE tbl_patients (
    patient_id SERIAL PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    patient_dob DATE NOT NULL,
    patient_gender VARCHAR(10),
    patient_address VARCHAR(200),
    patient_contact VARCHAR(20)
);


Select * from tbl_patients;

-- Insert sample data into tbl_patients
INSERT INTO tbl_patients (patient_name, patient_dob, patient_gender, patient_address, patient_contact)
VALUES
    ('John Doe', '1980-05-15', 'Male', '123 Main St, Anytown, USA', '(555) 123-4567'),
    ('Jane Smith', '1975-08-20', 'Female', '456 Elm St, Othertown, USA', '(555) 987-6543'),
    ('Michael Johnson', '1990-12-10', 'Male', '789 Oak St, Anycity, USA', '(555) 456-7890'),
    ('Emily Davis', '1988-04-25', 'Female', '567 Pine St, Somewhereville, USA', '(555) 234-5678'),
    ('Christopher Lee', '1972-10-30', 'Male', '890 Cedar St, Nowhereville, USA', '(555) 345-6789'),
    ('Jessica Brown', '1985-06-05', 'Female', '901 Maple St, Anytown, USA', '(555) 456-7890');


-- Insert more sample data into tbl_patients
INSERT INTO tbl_patients (patient_name, patient_dob, patient_gender, patient_address, patient_contact)
VALUES
    ('Sarah Johnson', '1992-09-18', 'Female', '234 Oak St, Anycity, USA', '(555) 789-0123'),
    ('Matthew Wilson', '1983-07-12', 'Male', '345 Pine St, Somewhereville, USA', '(555) 890-1234'),
    ('Amanda Martinez', '1978-03-27', 'Female', '456 Cedar St, Nowhereville, USA', '(555) 901-2345'),
    ('David Thompson', '1987-01-08', 'Male', '567 Maple St, Anytown, USA', '(555) 012-3456'),
    ('Jennifer Taylor', '1971-11-02', 'Female', '678 Main St, Othertown, USA', '(555) 123-4567'),
    ('Daniel Harris', '1982-08-14', 'Male', '789 Elm St, Anycity, USA', '(555) 234-5678'),
    ('Elizabeth Clark', '1995-05-29', 'Female', '890 Oak St, Somewhereville, USA', '(555) 345-6789'),
    ('Christopher Lewis', '1980-04-12', 'Male', '901 Cedar St, Nowhereville, USA', '(555) 456-7890'),
    ('Amy Hall', '1989-12-04', 'Female', '123 Pine St, Anytown, USA', '(555) 567-8901'),
    ('Kevin Young', '1976-10-19', 'Male', '234 Maple St, Othertown, USA', '(555) 678-9012'),
    ('Melissa King', '1990-07-23', 'Female', '345 Main St, Anycity, USA', '(555) 789-0123'),
    ('Steven Turner', '1984-03-16', 'Male', '456 Elm St, Somewhereville, USA', '(555) 890-1234'),
    ('Laura Scott', '1979-01-30', 'Female', '567 Cedar St, Nowhereville, USA', '(555) 901-2345'),
    ('Ryan Rodriguez', '1993-09-12', 'Male', '678 Oak St, Anytown, USA', '(555) 012-3456'),
    ('Michelle Green', '1973-11-25', 'Female', '789 Pine St, Othertown, USA', '(555) 123-4567'),
    ('Joshua Baker', '1986-08-08', 'Male', '890 Elm St, Anycity, USA', '(555) 234-5678'),
    ('Kimberly Adams', '1991-05-02', 'Female', '901 Maple St, Somewhereville, USA', '(555) 345-6789'),
    ('Timothy Perez', '1977-03-17', 'Male', '123 Main St, Nowhereville, USA', '(555) 456-7890'),
    ('Angela Evans', '1981-12-10', 'Female', '234 Cedar St, Anytown, USA', '(555) 567-8901'),
    ('Brandon Cook', '1988-10-05', 'Male', '345 Oak St, Othertown, USA', '(555) 678-9012');
	
-- Insert more sample data into tbl_patients
INSERT INTO tbl_patients (patient_name, patient_dob, patient_gender, patient_address, patient_contact)
VALUES
    ('Rachel Morgan', '1994-06-15', 'Female', '456 Pine St, Anycity, USA', '(555) 789-0123'),
    ('Jason Ward', '1982-02-28', 'Male', '567 Elm St, Somewhereville, USA', '(555) 890-1234'),
    ('Stephanie Murphy', '1976-12-03', 'Female', '678 Cedar St, Nowhereville, USA', '(555) 901-2345'),
    ('Patrick Rivera', '1990-08-17', 'Male', '789 Maple St, Anytown, USA', '(555) 012-3456'),
    ('Samantha Cooper', '1972-06-20', 'Female', '890 Main St, Othertown, USA', '(555) 123-4567'),
    ('Nathan Coleman', '1985-03-12', 'Male', '901 Oak St, Anycity, USA', '(555) 234-5678'),
    ('Christina Ortiz', '1997-10-25', 'Female', '123 Cedar St, Somewhereville, USA', '(555) 345-6789'),
    ('Justin Lee', '1981-08-08', 'Male', '234 Maple St, Nowhereville, USA', '(555) 456-7890'),
    ('Heather Diaz', '1974-04-02', 'Female', '345 Pine St, Anytown, USA', '(555) 567-8901'),
    ('Kyle Wright', '1989-01-14', 'Male', '456 Elm St, Othertown, USA', '(555) 678-9012'),
    ('Nicole Ross', '1993-07-28', 'Female', '567 Cedar St, Anycity, USA', '(555) 789-0123'),
    ('Alexander Bell', '1979-05-21', 'Male', '678 Oak St, Somewhereville, USA', '(555) 890-1234'),
    ('Rebecca Powell', '1984-02-03', 'Female', '789 Elm St, Nowhereville, USA', '(555) 901-2345'),
    ('Tyler Hughes', '1998-09-16', 'Male', '890 Maple St, Anytown, USA', '(555) 012-3456'),
    ('Alyssa Peterson', '1975-11-29', 'Female', '901 Pine St, Othertown, USA', '(555) 123-4567'),
    ('Bryan Foster', '1980-07-12', 'Male', '123 Cedar St, Anycity, USA', '(555) 234-5678'),
    ('Vanessa Simmons', '1991-04-25', 'Female', '234 Oak St, Somewhereville, USA', '(555) 345-6789'),
    ('Dylan Hayes', '1977-02-08', 'Male', '345 Elm St, Nowhereville, USA', '(555) 456-7890'),
    ('Kelly Barnes', '1988-12-01', 'Female', '456 Maple St, Anytown, USA', '(555) 567-8901'),
    ('Jeremy Murphy', '1992-08-05', 'Male', '567 Pine St, Othertown, USA', '(555) 678-9012');


-- Insert more sample data into tbl_patients
INSERT INTO tbl_patients (patient_name, patient_dob, patient_gender, patient_address, patient_contact)
VALUES
    ('Emma Ward', '1983-09-15', 'Female', '123 Elm St, Anytown, USA', '(555) 789-0123'),
    ('Brandon Reed', '1977-05-28', 'Male', '234 Cedar St, Othertown, USA', '(555) 890-1234'),
    ('Michelle Evans', '1995-01-03', 'Female', '345 Oak St, Anycity, USA', '(555) 901-2345'),
    ('Kevin Turner', '1980-08-17', 'Male', '456 Maple St, Somewhereville, USA', '(555) 012-3456'),
    ('Kimberly Campbell', '1973-06-20', 'Female', '567 Pine St, Nowhereville, USA', '(555) 123-4567'),
    ('Ryan Murphy', '1986-03-12', 'Male', '678 Elm St, Anytown, USA', '(555) 234-5678'),
    ('Megan Martinez', '1998-10-25', 'Female', '789 Cedar St, Othertown, USA', '(555) 345-6789'),
    ('Joshua Rodriguez', '1982-08-08', 'Male', '890 Oak St, Anycity, USA', '(555) 456-7890'),
    ('Amanda Scott', '1975-04-02', 'Female', '901 Maple St, Somewhereville, USA', '(555) 567-8901'),
    ('Daniel Gonzalez', '1990-01-14', 'Male', '123 Pine St, Nowhereville, USA', '(555) 678-9012'),
    ('Brittany Lopez', '1989-07-28', 'Female', '234 Elm St, Anytown, USA', '(555) 789-0123'),
    ('Matthew Hill', '1978-05-21', 'Male', '345 Cedar St, Othertown, USA', '(555) 890-1234'),
    ('Laura Baker', '1984-02-03', 'Female', '456 Oak St, Anycity, USA', '(555) 901-2345'),
    ('Justin Young', '1997-09-16', 'Male', '567 Maple St, Somewhereville, USA', '(555) 012-3456'),
    ('Melissa White', '1976-11-29', 'Female', '678 Pine St, Nowhereville, USA', '(555) 123-4567'),
    ('Jordan Harris', '1981-07-12', 'Male', '789 Elm St, Anytown, USA', '(555) 234-5678'),
    ('Chelsea King', '1992-04-25', 'Female', '890 Cedar St, Othertown, USA', '(555) 345-6789'),
    ('Nicholas Perez', '1979-02-08', 'Male', '901 Oak St, Anycity, USA', '(555) 456-7890'),
    ('Katherine Nelson', '1988-12-01', 'Female', '123 Pine St, Somewhereville, USA', '(555) 567-8901'),
    ('Andrew Adams', '1993-08-05', 'Male', '234 Elm St, Nowhereville, USA', '(555) 678-9012'),
    ('Kayla Wright', '1986-04-30', 'Female', '345 Maple St, Anytown, USA', '(555) 789-0123'),
    ('Cody Martinez', '1982-01-23', 'Male', '456 Cedar St, Othertown, USA', '(555) 890-1234'),
    ('Lauren Turner', '1990-09-06', 'Female', '567 Oak St, Anycity, USA', '(555) 901-2345'),
    ('Tyler Robinson', '1975-07-09', 'Male', '678 Maple St, Somewhereville, USA', '(555) 012-3456'),
    ('Jennifer Collins', '1988-05-12', 'Female', '789 Cedar St, Nowhereville, USA', '(555) 123-4567'),
    ('Austin Martinez', '1995-10-27', 'Male', '890 Elm St, Anytown, USA', '(555) 234-5678'),
    ('Hannah Rivera', '1983-03-14', 'Female', '901 Pine St, Othertown, USA', '(555) 345-6789'),
    ('Zachary Baker', '1977-11-17', 'Male', '123 Cedar St, Anycity, USA', '(555) 456-7890'),
    ('Alexis Reed', '1989-07-20', 'Female', '234 Oak St, Somewhereville, USA', '(555) 567-8901'),
    ('David Adams', '1984-01-03', 'Male', '345 Maple St, Nowhereville, USA', '(555) 678-9012'),
    ('Olivia Hill', '1996-09-16', 'Female', '456 Cedar St, Anytown, USA', '(555) 789-0123'),
    ('Jacob Mitchell', '1981-05-29', 'Male', '567 Elm St, Othertown, USA', '(555) 890-1234'),
    ('Taylor Green', '1972-04-12', 'Female', '678 Oak St, Anycity, USA', '(555) 901-2345'),
    ('Madison Powell', '1987-11-25', 'Female', '789 Pine St, Somewhereville, USA', '(555) 012-3456'),
    ('Ryan Hernandez', '1993-08-28', 'Male', '890 Cedar St, Nowhereville, USA', '(555) 123-4567'),
    ('Abigail Perry', '1978-03-03', 'Female', '901 Oak St, Anytown, USA', '(555) 234-5678'),
    ('Ethan Nelson', '1985-12-16', 'Male', '123 Maple St, Othertown, USA', '(555) 345-6789'),
    ('Grace Martinez', '1998-07-20', 'Female', '234 Elm St, Anycity, USA', '(555) 456-7890'),
    ('Noah Lee', '1980-02-13', 'Male', '345 Oak St, Somewhereville, USA', '(555) 567-8901'),
    ('Lily Rodriguez', '1991-10-26', 'Female', '456 Pine St, Nowhereville, USA', '(555) 678-9012');
	

-- Insert more sample data into tbl_patients
INSERT INTO tbl_patients (patient_name, patient_dob, patient_gender, patient_address, patient_contact)
VALUES
    ('Logan Lewis', '1976-07-09', 'Male', '567 Cedar St, Anytown, USA', '(555) 789-0123'),
    ('Chloe Walker', '1983-03-24', 'Female', '678 Elm St, Othertown, USA', '(555) 890-1234'),
    ('Jackson Hill', '1996-11-07', 'Male', '789 Oak St, Anycity, USA', '(555) 901-2345'),
    ('Samantha Young', '1982-08-10', 'Female', '890 Pine St, Somewhereville, USA', '(555) 012-3456'),
    ('Caleb King', '1975-05-13', 'Male', '901 Maple St, Nowhereville, USA', '(555) 123-4567'),
    ('Alyssa Wright', '1989-12-26', 'Female', '123 Pine St, Anytown, USA', '(555) 234-5678'),
    ('Nathan Hernandez', '1987-07-29', 'Male', '234 Elm St, Othertown, USA', '(555) 345-6789'),
    ('Hailey King', '1994-04-02', 'Female', '345 Cedar St, Anycity, USA', '(555) 456-7890'),
    ('Elijah White', '1980-11-15', 'Male', '456 Oak St, Somewhereville, USA', '(555) 567-8901'),
    ('Sofia Turner', '1997-09-18', 'Female', '567 Pine St, Nowhereville, USA', '(555) 678-9012'),
    ('Gabriel Lewis', '1982-06-21', 'Male', '678 Elm St, Anytown, USA', '(555) 789-0123'),
    ('Ava Martinez', '1991-01-04', 'Female', '789 Cedar St, Othertown, USA', '(555) 890-1234'),
    ('Isaac Taylor', '1978-04-17', 'Male', '890 Oak St, Anycity, USA', '(555) 901-2345'),
    ('Sophia Scott', '1998-11-20', 'Female', '901 Maple St, Somewhereville, USA', '(555) 012-3456'),
    ('Dylan Hall', '1983-08-23', 'Male', '123 Cedar St, Nowhereville, USA', '(555) 123-4567'),
    ('Mia Allen', '1986-05-26', 'Female', '234 Elm St, Anytown, USA', '(555) 234-5678'),
    ('Luke Adams', '1993-02-09', 'Male', '345 Cedar St, Othertown, USA', '(555) 345-6789'),
    ('Avery Ward', '1977-10-12', 'Female', '456 Oak St, Anycity, USA', '(555) 456-7890'),
    ('Emma Reed', '1985-07-25', 'Female', '567 Maple St, Somewhereville, USA', '(555) 567-8901'),
    ('Mason Bell', '1990-12-28', 'Male', '678 Pine St, Nowhereville, USA', '(555) 678-9012');



-- 1. tbl_studies
CREATE TABLE tbl_studies (
    study_id SERIAL PRIMARY KEY,
    study_name VARCHAR(100) NOT NULL,
    study_description TEXT,
    study_start_date DATE NOT NULL,
    study_end_date DATE,
    principal_investigator_id INT NOT NULL
);

Select * from tbl_studies

-- Insert sample data into tbl_studies
INSERT INTO tbl_studies (study_name, study_description, study_start_date, study_end_date, principal_investigator_id)
VALUES
    ('COVID-19 Vaccine Trial', 'A clinical trial to evaluate the efficacy and safety of a COVID-19 vaccine candidate.', '2023-01-01', '2023-12-31', 1),
    ('Diabetes Management Study', 'A study aimed at evaluating the effectiveness of different management strategies for type 2 diabetes.', '2022-06-15', '2023-06-15', 2),
    ('Heart Disease Prevention Trial', 'A trial to investigate the impact of lifestyle changes on the prevention of heart disease.', '2022-08-01', '2023-08-01', 3),
    ('Alzheimer''s Disease Research', 'A longitudinal study examining the progression of Alzheimer''s disease and potential treatments.', '2022-03-10', '2025-03-10', 4),
    ('Cancer Immunotherapy Study', 'An investigation into the effectiveness of immunotherapy in treating various types of cancer.', '2022-10-01', '2024-10-01', 5),
    ('Mental Health Intervention Trial', 'A randomized controlled trial evaluating the efficacy of a novel intervention for managing depression and anxiety.', '2022-05-01', '2023-05-01', 6),
    ('Obesity Prevention Study', 'A community-based intervention to prevent obesity and promote healthy lifestyles among children and adolescents.', '2022-09-15', '2023-09-15', 7),
    ('Asthma Management Trial', 'A multicenter trial assessing the effectiveness of different treatment approaches for asthma management.', '2022-07-01', '2023-07-01', 8),
    ('Stroke Rehabilitation Study', 'A study investigating the efficacy of rehabilitation interventions for improving outcomes in stroke survivors.', '2022-04-01', '2023-04-01', 9),
    ('Pain Management Research', 'An investigation into the effectiveness of various pharmacological and non-pharmacological approaches for chronic pain management.', '2022-11-01', '2023-11-01', 10),
    ('HIV Prevention Trial', 'A randomized controlled trial evaluating the efficacy of pre-exposure prophylaxis (PrEP) in preventing HIV transmission.', '2022-02-01', '2023-02-01', 11),
    ('Parkinson''s Disease Study', 'A longitudinal study examining the progression of Parkinson''s disease and potential neuroprotective therapies.', '2022-12-01', '2025-12-01', 12),
    ('Nutrition Intervention Trial', 'A trial to assess the impact of dietary interventions on cardiovascular health and metabolic parameters.', '2022-10-15', '2023-10-15', 13),
    ('Smoking Cessation Program', 'A community-based program aimed at helping individuals quit smoking and reduce tobacco-related harm.', '2022-08-15', '2023-08-15', 14),
    ('Infectious Disease Surveillance', 'A surveillance study monitoring the incidence and transmission dynamics of infectious diseases in a population.', '2022-06-01', '2024-06-01', 15),
    ('Maternal and Child Health Study', 'A cohort study investigating factors influencing maternal and child health outcomes.', '2022-07-15', '2025-07-15', 16),
    ('Genetic Epidemiology Research', 'A study examining the genetic basis of common complex diseases and traits in diverse populations.', '2022-09-01', '2024-09-01', 17),
    ('Sleep Disorders Investigation', 'An investigation into the prevalence, risk factors, and treatment outcomes of sleep disorders.', '2022-05-15', '2023-05-15', 18),
    ('Vaccination Effectiveness Study', 'A study assessing the effectiveness of vaccines in preventing infectious diseases in different age groups.', '2022-03-01', '2023-03-01', 19),
    ('Cognitive Aging Research', 'A longitudinal study examining age-related changes in cognitive function and factors influencing cognitive aging trajectories.', '2022-11-15', '2025-11-15', 20);

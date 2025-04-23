-- Create all the tables needed to support the internal hiring process.
-- Table for HR users
CREATE TABLE HR_Users (
    hr_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
);

-- Table for job locations
CREATE TABLE Locations (
    location_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Table for job categories or departments (optional normalization)
CREATE TABLE Job_Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Table for job vacancies
CREATE TABLE Job_Vacancies (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    hr_id INT NOT NULL,
    category_id INT,
    location_id INT,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    requirements TEXT,
    posted_date DATE NOT NULL,
    application_deadline DATE NOT NULL,
    FOREIGN KEY (hr_id) REFERENCES HR_Users(hr_id),
    FOREIGN KEY (location_id) REFERENCES Locations(location_id),
    FOREIGN KEY (category_id) REFERENCES Job_Categories(category_id)
);

-- Table for applicants
CREATE TABLE Applicants (
    applicant_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    resume_file_path VARCHAR(255),
    placement_preference ENUM('South Jakarta', 'Jambi') DEFAULT 'South Jakarta'
);

-- Table for applications
CREATE TABLE Applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    job_id INT NOT NULL,
    applicant_id INT NOT NULL,
    status ENUM('Submitted', 'Shortlisted', 'Interviewed', 'Rejected', 'Hired') DEFAULT 'Submitted',
    applied_date DATE NOT NULL,
    FOREIGN KEY (job_id) REFERENCES Job_Vacancies(job_id),
    FOREIGN KEY (applicant_id) REFERENCES Applicants(applicant_id)
);

-- Table for types of interview
CREATE TABLE Interview_Types (
    interview_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL
);

-- Table for interviews
CREATE TABLE Interviews ( 
    interview_id INT AUTO_INCREMENT PRIMARY KEY, 
    application_id INT NOT NULL, 
    hr_id INT NOT NULL, 
    interview_type_id INT NOT NULL, 
    scheduled_date DATETIME NOT NULL, 
    interview_notes TEXT, 
    result ENUM('Pending', 'Passed', 'Failed') DEFAULT 'Pending', 
    FOREIGN KEY (application_id) REFERENCES Applications(application_id), 
    FOREIGN KEY (hr_id) REFERENCES HR_Users(hr_id), 
    FOREIGN KEY (interview_type_id) REFERENCES Interview_Types(interview_type_id)
) AUTO_INCREMENT = 1;

-- Create a column in the HR_Users table to specify the department of each HR user
-- Insert records into the HR_Users table with specific departments
ALTER TABLE hr_users ADD COLUMN specific_department VARCHAR(50) NOT NULL;
INSERT INTO hr_users (name, email, password_hash, specific_department)
VALUES
    ('Dewi Anggraini', 'dewi.anggraini@rasaprima.co.id', 'hashed_pw_1', 'Office Department'),
    ('Andi Prasetyo', 'andi.prasetyo@rasaprima.co.id', 'hashed_pw_2', 'Logistics Department'),
    ('Siti Rahmawati', 'siti.rahmawati@rasaprima.co.id', 'hashed_pw_3', 'Production Department');

-- Insert records into locations table
INSERT INTO locations (name)
VALUES
    ('South Jakarta'),
    ('Jambi');

-- Insert records into job categories table
INSERT INTO job_categories (name)
VALUES
    ('Office Department'),
    ('Logistics Department'),
    ('Production Department');

__ -- Insert records into job vacancies table
INSERT INTO Job_Vacancies (hr_id, category_id, location_id, title, description, requirements, posted_date, application_deadline)
VALUES
-- Office Department (South Jakarta) - HR ID: 1, Category ID: 1, Location ID: 1
(1, 1, 1, 'Admin Officer', 'Manage office documentation and internal coordination.', 'Bachelor’s in Administration or related field.', '2025-04-22', '2025-05-15'),
(1, 1, 1, 'HR Generalist', 'Handle recruitment and employee affairs.', 'Bachelor’s in HR, Psychology, or Law.', '2025-04-22', '2025-05-15'),
(1, 1, 1, 'Finance Staff', 'Manage daily financial records and reporting.', 'Bachelor’s in Accounting or Finance.', '2025-04-22', '2025-05-15'),
(1, 1, 1, 'Marketing Coordinator', 'Coordinate product promotion and campaigns.', 'Bachelor’s in Marketing or Communication.', '2025-04-22', '2025-05-15'),

-- Logistics Department (South Jakarta) - HR ID: 2, Category ID: 2, Location ID: 1
(2, 2, 1, 'Inventory Controller', 'Monitor and control warehouse stock levels.', 'Diploma or Bachelor’s in Logistics.', '2025-04-22', '2025-05-15'),
(2, 2, 1, 'Fleet Coordinator', 'Schedule and track deliveries and transport.', 'Experience in fleet or delivery management.', '2025-04-22', '2025-05-15'),
(2, 2, 1, 'Warehouse Staff', 'Assist in sorting, storing, and preparing stock.', 'Physically fit, warehouse experience preferred.', '2025-04-22', '2025-05-15'),
(2, 2, 1, 'Delivery Scheduler', 'Plan delivery routes and time slots.', 'Attention to detail, logistics knowledge.', '2025-04-22', '2025-05-15'),

-- Production Department (South Jakarta) - HR ID: 3, Category ID: 3, Location ID: 1
(3, 3, 1, 'Machine Operator', 'Operate and maintain production machinery.', 'Technical diploma or machinery experience.', '2025-04-22', '2025-05-15'),
(3, 3, 1, 'QA Technician', 'Check and ensure product quality.', 'Familiarity with GMP and HACCP.', '2025-04-22', '2025-05-15'),
(3, 3, 1, 'Line Supervisor', 'Oversee production line team performance.', 'Leadership and food industry experience.', '2025-04-22', '2025-05-15'),
(3, 3, 1, 'Maintenance Staff', 'Conduct routine equipment maintenance.', 'Skilled in electrical/mechanical repairs.', '2025-04-22', '2025-05-15'),

-- Production Department (Jambi) - HR ID: 3, Category ID: 3, Location ID: 2
(3, 3, 2, 'Production Assistant', 'Support daily factory operations.', 'Willing to work shifts, trainable.', '2025-04-22', '2025-05-15'),
(3, 3, 2, 'Quality Control Inspector', 'Inspect final product before shipment.', 'Detail-oriented, knowledge of quality standards.', '2025-04-22', '2025-05-15'),
(3, 3, 2, 'Packaging Operator', 'Operate and monitor packaging equipment.', 'Attention to detail, packaging experience preferred.', '2025-04-22', '2025-05-15'),
(3, 3, 2, 'Shift Supervisor', 'Supervise shift workers and meet targets.', 'Leadership and production line experience.', '2025-04-22', '2025-05-15');

-- Insert records into applicants table
INSERT INTO Applicants (full_name, email, phone_number, resume_file_path, placement_preference)
VALUES
-- for south jakarta placement
('Applicant_SJ_1', 'applicant_sj_1@example.com', '08120000001', '/resumes/applicant_sj_1.pdf', 'South Jakarta'),
('Applicant_SJ_2', 'applicant_sj_2@example.com', '08120000002', '/resumes/applicant_sj_2.pdf', 'South Jakarta'),
('Applicant_SJ_3', 'applicant_sj_3@example.com', '08120000003', '/resumes/applicant_sj_3.pdf', 'South Jakarta'),
('Applicant_SJ_4', 'applicant_sj_4@example.com', '08120000004', '/resumes/applicant_sj_4.pdf', 'South Jakarta'),
('Applicant_SJ_5', 'applicant_sj_5@example.com', '08120000005', '/resumes/applicant_sj_5.pdf', 'South Jakarta'),
('Applicant_SJ_6', 'applicant_sj_6@example.com', '08120000006', '/resumes/applicant_sj_6.pdf', 'South Jakarta'),
('Applicant_SJ_7', 'applicant_sj_7@example.com', '08120000007', '/resumes/applicant_sj_7.pdf', 'South Jakarta'),
('Applicant_SJ_8', 'applicant_sj_8@example.com', '08120000008', '/resumes/applicant_sj_8.pdf', 'South Jakarta'),
('Applicant_SJ_9', 'applicant_sj_9@example.com', '08120000009', '/resumes/applicant_sj_9.pdf', 'South Jakarta'),
('Applicant_SJ_10', 'applicant_sj_10@example.com', '08120000010', '/resumes/applicant_sj_10.pdf', 'South Jakarta'),
('Applicant_SJ_11', 'applicant_sj_11@example.com', '08120000011', '/resumes/applicant_sj_11.pdf', 'South Jakarta'),
('Applicant_SJ_12', 'applicant_sj_12@example.com', '08120000012', '/resumes/applicant_sj_12.pdf', 'South Jakarta'),
('Applicant_SJ_13', 'applicant_sj_13@example.com', '08120000013', '/resumes/applicant_sj_13.pdf', 'South Jakarta'),
('Applicant_SJ_14', 'applicant_sj_14@example.com', '08120000014', '/resumes/applicant_sj_14.pdf', 'South Jakarta'),
('Applicant_SJ_15', 'applicant_sj_15@example.com', '08120000015', '/resumes/applicant_sj_15.pdf', 'South Jakarta'),
('Applicant_SJ_16', 'applicant_sj_16@example.com', '08120000016', '/resumes/applicant_sj_16.pdf', 'South Jakarta'),
('Applicant_SJ_17', 'applicant_sj_17@example.com', '08120000017', '/resumes/applicant_sj_17.pdf', 'South Jakarta'),
('Applicant_SJ_18', 'applicant_sj_18@example.com', '08120000018', '/resumes/applicant_sj_18.pdf', 'South Jakarta'),
('Applicant_SJ_19', 'applicant_sj_19@example.com', '08120000019', '/resumes/applicant_sj_19.pdf', 'South Jakarta'),
('Applicant_SJ_20', 'applicant_sj_20@example.com', '08120000020', '/resumes/applicant_sj_20.pdf', 'South Jakarta'),
('Applicant_SJ_21', 'applicant_sj_21@example.com', '08120000021', '/resumes/applicant_sj_21.pdf', 'South Jakarta'),
('Applicant_SJ_22', 'applicant_sj_22@example.com', '08120000022', '/resumes/applicant_sj_22.pdf', 'South Jakarta'),
('Applicant_SJ_23', 'applicant_sj_23@example.com', '08120000023', '/resumes/applicant_sj_23.pdf', 'South Jakarta'),
('Applicant_SJ_24', 'applicant_sj_24@example.com', '08120000024', '/resumes/applicant_sj_24.pdf', 'South Jakarta'),
('Applicant_SJ_25', 'applicant_sj_25@example.com', '08120000025', '/resumes/applicant_sj_25.pdf', 'South Jakarta'),
('Applicant_SJ_26', 'applicant_sj_26@example.com', '08120000026', '/resumes/applicant_sj_26.pdf', 'South Jakarta'),
('Applicant_SJ_27', 'applicant_sj_27@example.com', '08120000027', '/resumes/applicant_sj_27.pdf', 'South Jakarta'),
('Applicant_SJ_28', 'applicant_sj_28@example.com', '08120000028', '/resumes/applicant_sj_28.pdf', 'South Jakarta'),
('Applicant_SJ_29', 'applicant_sj_29@example.com', '08120000029', '/resumes/applicant_sj_29.pdf', 'South Jakarta'),
('Applicant_SJ_30', 'applicant_sj_30@example.com', '08120000030', '/resumes/applicant_sj_30.pdf', 'South Jakarta'),
('Applicant_SJ_31', 'applicant_sj_31@example.com', '08120000031', '/resumes/applicant_sj_31.pdf', 'South Jakarta'),
('Applicant_SJ_32', 'applicant_sj_32@example.com', '08120000032', '/resumes/applicant_sj_32.pdf', 'South Jakarta'),
('Applicant_SJ_33', 'applicant_sj_33@example.com', '08120000033', '/resumes/applicant_sj_33.pdf', 'South Jakarta'),
('Applicant_SJ_34', 'applicant_sj_34@example.com', '08120000034', '/resumes/applicant_sj_34.pdf', 'South Jakarta'),
('Applicant_SJ_35', 'applicant_sj_35@example.com', '08120000035', '/resumes/applicant_sj_35.pdf', 'South Jakarta'),
('Applicant_SJ_36', 'applicant_sj_36@example.com', '08120000036', '/resumes/applicant_sj_36.pdf', 'South Jakarta'),
('Applicant_SJ_37', 'applicant_sj_37@example.com', '08120000037', '/resumes/applicant_sj_37.pdf', 'South Jakarta'),
('Applicant_SJ_38', 'applicant_sj_38@example.com', '08120000038', '/resumes/applicant_sj_38.pdf', 'South Jakarta'),
('Applicant_SJ_39', 'applicant_sj_39@example.com', '08120000039', '/resumes/applicant_sj_39.pdf', 'South Jakarta'),
('Applicant_SJ_40', 'applicant_sj_40@example.com', '08120000040', '/resumes/applicant_sj_40.pdf', 'South Jakarta'),
('Applicant_SJ_41', 'applicant_sj_41@example.com', '08120000041', '/resumes/applicant_sj_41.pdf', 'South Jakarta'),
('Applicant_SJ_42', 'applicant_sj_42@example.com', '08120000042', '/resumes/applicant_sj_42.pdf', 'South Jakarta'),
('Applicant_SJ_43', 'applicant_sj_43@example.com', '08120000043', '/resumes/applicant_sj_43.pdf', 'South Jakarta'),
('Applicant_SJ_44', 'applicant_sj_44@example.com', '08120000044', '/resumes/applicant_sj_44.pdf', 'South Jakarta'),
('Applicant_SJ_45', 'applicant_sj_45@example.com', '08120000045', '/resumes/applicant_sj_45.pdf', 'South Jakarta'),
('Applicant_SJ_46', 'applicant_sj_46@example.com', '08120000046', '/resumes/applicant_sj_46.pdf', 'South Jakarta'),
('Applicant_SJ_47', 'applicant_sj_47@example.com', '08120000047', '/resumes/applicant_sj_47.pdf', 'South Jakarta'),
('Applicant_SJ_48', 'applicant_sj_48@example.com', '08120000048', '/resumes/applicant_sj_48.pdf', 'South Jakarta'),
('Applicant_SJ_49', 'applicant_sj_49@example.com', '08120000049', '/resumes/applicant_sj_49.pdf', 'South Jakarta'),
('Applicant_SJ_50', 'applicant_sj_50@example.com', '08120000050', '/resumes/applicant_sj_50.pdf', 'South Jakarta'),
('Applicant_SJ_51', 'applicant_sj_51@example.com', '08120000051', '/resumes/applicant_sj_51.pdf', 'South Jakarta'),
('Applicant_SJ_52', 'applicant_sj_52@example.com', '08120000052', '/resumes/applicant_sj_52.pdf', 'South Jakarta'),
('Applicant_SJ_53', 'applicant_sj_53@example.com', '08120000053', '/resumes/applicant_sj_53.pdf', 'South Jakarta'),
('Applicant_SJ_54', 'applicant_sj_54@example.com', '08120000054', '/resumes/applicant_sj_54.pdf', 'South Jakarta'),
('Applicant_SJ_55', 'applicant_sj_55@example.com', '08120000055', '/resumes/applicant_sj_55.pdf', 'South Jakarta'),
('Applicant_SJ_56', 'applicant_sj_56@example.com', '08120000056', '/resumes/applicant_sj_56.pdf', 'South Jakarta'),
('Applicant_SJ_57', 'applicant_sj_57@example.com', '08120000057', '/resumes/applicant_sj_57.pdf', 'South Jakarta'),
('Applicant_SJ_58', 'applicant_sj_58@example.com', '08120000058', '/resumes/applicant_sj_58.pdf', 'South Jakarta'),
('Applicant_SJ_59', 'applicant_sj_59@example.com', '08120000059', '/resumes/applicant_sj_59.pdf', 'South Jakarta'),
('Applicant_SJ_60', 'applicant_sj_60@example.com', '08120000060', '/resumes/applicant_sj_60.pdf', 'South Jakarta'),
-- for jambi placement
('Applicant_JA_1', 'applicant_ja_1@example.com', '08230000001', '/resumes/applicant_ja_1.pdf', 'Jambi'),
('Applicant_JA_2', 'applicant_ja_2@example.com', '08230000002', '/resumes/applicant_ja_2.pdf', 'Jambi'),
('Applicant_JA_3', 'applicant_ja_3@example.com', '08230000003', '/resumes/applicant_ja_3.pdf', 'Jambi'),
('Applicant_JA_4', 'applicant_ja_4@example.com', '08230000004', '/resumes/applicant_ja_4.pdf', 'Jambi'),
('Applicant_JA_5', 'applicant_ja_5@example.com', '08230000005', '/resumes/applicant_ja_5.pdf', 'Jambi'),
('Applicant_JA_6', 'applicant_ja_6@example.com', '08230000006', '/resumes/applicant_ja_6.pdf', 'Jambi'),
('Applicant_JA_7', 'applicant_ja_7@example.com', '08230000007', '/resumes/applicant_ja_7.pdf', 'Jambi'),
('Applicant_JA_8', 'applicant_ja_8@example.com', '08230000008', '/resumes/applicant_ja_8.pdf', 'Jambi'),
('Applicant_JA_9', 'applicant_ja_9@example.com', '08230000009', '/resumes/applicant_ja_9.pdf', 'Jambi'),
('Applicant_JA_10', 'applicant_ja_10@example.com', '08230000010', '/resumes/applicant_ja_10.pdf', 'Jambi'),
('Applicant_JA_11', 'applicant_ja_11@example.com', '08230000011', '/resumes/applicant_ja_11.pdf', 'Jambi'),
('Applicant_JA_12', 'applicant_ja_12@example.com', '08230000012', '/resumes/applicant_ja_12.pdf', 'Jambi'),
('Applicant_JA_13', 'applicant_ja_13@example.com', '08230000013', '/resumes/applicant_ja_13.pdf', 'Jambi'),
('Applicant_JA_14', 'applicant_ja_14@example.com', '08230000014', '/resumes/applicant_ja_14.pdf', 'Jambi'),
('Applicant_JA_15', 'applicant_ja_15@example.com', '08230000015', '/resumes/applicant_ja_15.pdf', 'Jambi'),
('Applicant_JA_16', 'applicant_ja_16@example.com', '08230000016', '/resumes/applicant_ja_16.pdf', 'Jambi'),
('Applicant_JA_17', 'applicant_ja_17@example.com', '08230000017', '/resumes/applicant_ja_17.pdf', 'Jambi'),
('Applicant_JA_18', 'applicant_ja_18@example.com', '08230000018', '/resumes/applicant_ja_18.pdf', 'Jambi'),
('Applicant_JA_19', 'applicant_ja_19@example.com', '08230000019', '/resumes/applicant_ja_19.pdf', 'Jambi'),
('Applicant_JA_20', 'applicant_ja_20@example.com', '08230000020', '/resumes/applicant_ja_20.pdf', 'Jambi');

-- to make the hiring process more efficient, the interview process will be done online
INSERT INTO interview_types (type_name)
VALUES
('Online');

-- Insert records into applications table
-- Randomly generate application records for the last 30 days
INSERT INTO Applications (job_id, applicant_id, status, applied_date)
SELECT 
    FLOOR(1 + (RAND() * 3)) AS job_id, -- Randomly choose a job ID between 1 and 3 (assuming 3 job vacancies)
    FLOOR(1 + (RAND() * 80)) AS applicant_id, -- Randomly choose an applicant ID between 1 and 80
    CASE
        WHEN RAND() < 0.2 THEN 'Submitted' -- 20% chance of 'Submitted'
        WHEN RAND() < 0.4 THEN 'Shortlisted' -- 20% chance of 'Shortlisted'
        WHEN RAND() < 0.6 THEN 'Interviewed' -- 20% chance of 'Interviewed'
        WHEN RAND() < 0.8 THEN 'Rejected' -- 20% chance of 'Rejected'
        ELSE 'Hired' -- 20% chance of 'Hired'
    END AS status,
    DATE_ADD(CURDATE(), INTERVAL (FLOOR(RAND() * 30) - 30) DAY) AS applied_date -- Random date within the past 30 days
FROM 
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5
     UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10
     UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15
     UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20
     UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25
     UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30
     UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35
     UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40
     UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45
     UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL SELECT 50
     UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55
     UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59 UNION ALL SELECT 60
     UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65
     UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69 UNION ALL SELECT 70
     UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75
     UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79 UNION ALL SELECT 80) AS applicants;

-- Insert records into interviews table
INSERT INTO Interviews (application_id, hr_id, interview_type_id, scheduled_date, interview_notes, result)
SELECT 
    FLOOR(1 + (RAND() * 80)) AS application_id, -- Randomly assign application from 1 to 80
    FLOOR(1 + (RAND() * 3)) AS hr_id, -- Randomly assign HR user from the 3 HR users
    1 AS interview_type_id, -- Set interview type to 'Online' (interview_type_id = 1)
    DATE_ADD(CURDATE(), INTERVAL (FLOOR(RAND() * 30) - 30) DAY) AS scheduled_date, -- Random interview date in the last 30 days
    CONCAT('Interview for job vacancy ', FLOOR(1 + (RAND() * 3)), ' with HR user ', FLOOR(1 + (RAND() * 3))) AS interview_notes, -- Random interview notes
    'Pending' AS result -- All interviews are initially set to Pending
FROM 
    (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 UNION ALL SELECT 28 UNION ALL SELECT 29 UNION ALL SELECT 30 UNION ALL SELECT 31 UNION ALL SELECT 32 UNION ALL SELECT 33 UNION ALL SELECT 34 UNION ALL SELECT 35 UNION ALL SELECT 36 UNION ALL SELECT 37 UNION ALL SELECT 38 UNION ALL SELECT 39 UNION ALL SELECT 40 UNION ALL SELECT 41 UNION ALL SELECT 42 UNION ALL SELECT 43 UNION ALL SELECT 44 UNION ALL SELECT 45 UNION ALL SELECT 46 UNION ALL SELECT 47 UNION ALL SELECT 48 UNION ALL SELECT 49 UNION ALL SELECT 50 UNION ALL SELECT 51 UNION ALL SELECT 52 UNION ALL SELECT 53 UNION ALL SELECT 54 UNION ALL SELECT 55 UNION ALL SELECT 56 UNION ALL SELECT 57 UNION ALL SELECT 58 UNION ALL SELECT 59 UNION ALL SELECT 60 UNION ALL SELECT 61 UNION ALL SELECT 62 UNION ALL SELECT 63 UNION ALL SELECT 64 UNION ALL SELECT 65 UNION ALL SELECT 66 UNION ALL SELECT 67 UNION ALL SELECT 68 UNION ALL SELECT 69 UNION ALL SELECT 70 UNION ALL SELECT 71 UNION ALL SELECT 72 UNION ALL SELECT 73 UNION ALL SELECT 74 UNION ALL SELECT 75 UNION ALL SELECT 76 UNION ALL SELECT 77 UNION ALL SELECT 78 UNION ALL SELECT 79 UNION ALL SELECT 80) AS applications;
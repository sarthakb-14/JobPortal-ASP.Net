-- Create the JobPortal database
CREATE DATABASE JobPortal;
USE JobPortal;

-- Create the admin table
CREATE TABLE admin (
    aid INT IDENTITY(1101,1) PRIMARY KEY,  -- Auto-increment primary key
    aname VARCHAR(30) NOT NULL,           -- Admin's name
    aemail VARCHAR(30) NOT NULL UNIQUE,   -- Unique email address
    ausername VARCHAR(30) NOT NULL UNIQUE, -- Unique username
    apassword VARCHAR(30) NOT NULL        -- Password
);
 
-- Create the company table
CREATE TABLE company (
    cid INT IDENTITY(2101,1) PRIMARY KEY, -- Auto-increment primary key
    cname VARCHAR(30) NOT NULL,           -- Company name
    cemail VARCHAR(30) NOT NULL UNIQUE,   -- Unique email address
    cusername VARCHAR(30) NOT NULL UNIQUE, -- Unique username
    cpassword VARCHAR(30) NOT NULL,       -- Password
    caddress TEXT,                         -- Address
    ccity VARCHAR(30) NOT NULL,            -- City
    cwebsiteurl VARCHAR(30),              -- Website URL
    ccontactno VARCHAR(10)                 -- Contact number
);
 
-- Create the student table
CREATE TABLE student (
    sid INT IDENTITY(3101,1) PRIMARY KEY, -- Auto-increment primary key
    sname VARCHAR(30) NOT NULL,          -- Student's name
    semail VARCHAR(30) NOT NULL UNIQUE,  -- Unique email address
    susername VARCHAR(30) NOT NULL UNIQUE, -- Unique username
    spassword VARCHAR(30) NOT NULL,      -- Password
    sdob DATE NOT NULL,                   -- Date of Birth
    sgender VARCHAR(10) NOT NULL CHECK (sgender IN ('Male', 'Female', 'Other')), -- Gender
    saddress TEXT,                        -- Address
    scontactno VARCHAR(10),               -- Contact number
    sskills TEXT NOT NULL                  -- Skills relevant to the job application
);
 
-- Create the joblist table
CREATE TABLE joblist (
    jobid INT IDENTITY(4101,1) PRIMARY KEY,  -- Auto-increment primary key
    cid INT NOT NULL,                       -- Foreign key to company table
    jobtitle VARCHAR(30) NOT NULL,         -- Job title
    jobvacancy INT NOT NULL,               -- Number of vacancies
    jobexperience VARCHAR(30) NOT NULL,    -- Required experience (e.g., "3-5 years")
    jobsalary DECIMAL(10, 2) NOT NULL,     -- Salary (e.g., "50000.00")
    jobpublishdate DATE NOT NULL,          -- Date when the job was published
    jobdeadline DATE NOT NULL,             -- Application deadline
    jobemployeementstatus VARCHAR(15) NOT NULL CHECK (jobemployeementstatus IN ('Full Time', 'Part Time', 'Freelancer', 'Internship')), -- Employment status
    jobJD TEXT,                           -- Job Description
    FOREIGN KEY (cid) REFERENCES company(cid) ON DELETE CASCADE -- Foreign key with cascading delete
);
 
-- Create the applyjob table
CREATE TABLE applyjob (
    applyid INT IDENTITY(5101,1) PRIMARY KEY,  -- Auto-increment primary key
    sid INT NOT NULL,                       -- Foreign key to student table
    jobid INT NOT NULL,
    FOREIGN KEY (sid) REFERENCES student(sid) ON DELETE CASCADE,  -- Foreign key with cascading delete
    FOREIGN KEY (jobid) REFERENCES joblist(jobid)  ON DELETE CASCADE-- Foreign key constraint
);

-- Insert records into the admin table
INSERT INTO admin (aname, aemail, ausername, apassword) VALUES
('Ravi Sharma', 'ravi.sharma@example.com', 'ravi123', 'password123'),
('Sneha Verma', 'sneha.verma@example.com', 'sneha123', 'password123'),
('Amit Patel', 'amit.patel@example.com', 'amit123', 'password123'),
('Priya Rao', 'priya.rao@example.com', 'priya123', 'password123'),
('Vikram Singh', 'vikram.singh@example.com', 'vikram123', 'password123'),
('Anjali Iyer', 'anjali.iyer@example.com', 'anjali123', 'password123'),
('Karan Mehta', 'karan.mehta@example.com', 'karan123', 'password123'),
('Neha Gupta', 'neha.gupta@example.com', 'neha123', 'password123'),
('Rajesh Khanna', 'rajesh.khanna@example.com', 'rajesh123', 'password123'),
('Deepika Choudhary', 'deepika.choudhary@example.com', 'deepika123', 'password123');

-- Insert records into the company table
INSERT INTO company (cname, cemail, cusername, cpassword, caddress, ccity, cwebsiteurl, ccontactno) VALUES
('Tata Consultancy Services', 'contact@tcs.com', 'tcs_user', 'password123', 'TCS House, Ravali Park', 'Mumbai', 'www.tcs.com', '0221234567'),
('Infosys Limited', 'info@infosys.com', 'infosys_user', 'password123', 'Infy Campus, Electronics City', 'Bangalore', 'www.infosys.com', '0802345678'),
('Wipro Limited', 'contact@wipro.com', 'wipro_user', 'password123', 'Doddakannalli, Sarjapur Road', 'Bangalore', 'www.wipro.com', '0803456789'),
('HCL Technologies', 'info@hcl.com', 'hcl_user', 'password123', 'HCL Technologies Ltd.', 'Noida', 'www.hcl.com', '0120345678'),
('Tech Mahindra', 'support@techmahindra.com', 'techmahindra_user', 'password123', 'Tech Mahindra Campus', 'Pune', 'www.techmahindra.com', '0201234567'),
('Larsen & Toubro', 'info@lt.com', 'lt_user', 'password123', 'L&T House, N.M. Marg', 'Mumbai', 'www.larsentoubro.com', '0222345678'),
('Accenture', 'contact@accenture.com', 'accenture_user', 'password123', 'Accenture Tower, Shriram', 'Gurgaon', 'www.accenture.com', '0123456789'),
('Cognizant', 'info@cognizant.com', 'cognizant_user', 'password123', 'Cognizant Technology Solutions', 'Chennai', 'www.cognizant.com', '0444567890'),
('Capgemini', 'contact@capgemini.com', 'capgemini_user', 'password123', 'Capgemini Tower', 'Bangalore', 'www.capgemini.com', '0805678901'),
('Mindtree', 'info@mindtree.com', 'mindtree_user', 'password123', 'Mindtree Limited, Global Village', 'Bangalore', 'www.mindtree.com', '0806789012');

-- Insert records into the student table
INSERT INTO student (sname, semail, susername, spassword, sdob, sgender, saddress, scontactno, sskills) VALUES
('Aarav Mehta', 'aarav.mehta@example.com', 'aarav123', 'password123', '2001-01-15', 'Male', '1234 Student St, Mumbai', '9876543210', 'Java, SQL'),
('Vivaan Gupta', 'vivaan.gupta@example.com', 'vivaan123', 'password123', '2000-02-20', 'Male', '5678 College Ave, Delhi', '9876543211', 'Python, JavaScript'),
('Diya Sharma', 'diya.sharma@example.com', 'diya123', 'password123', '2000-03-25', 'Female', '91011 University Blvd, Bangalore', '9876543212', 'HTML, CSS'),
('Anaya Rao', 'anaya.rao@example.com', 'anaya123', 'password123', '2000-04-30', 'Female', '1213 College St, Chennai', '9876543213', 'C++, React'),
('Arjun Singh', 'arjun.singh@example.com', 'arjun123', 'password123', '2000-05-05', 'Male', '1415 Academy Rd, Pune', '9876543214', 'Ruby, Rails'),
('Saanvi Iyer', 'saanvi.iyer@example.com', 'saanvi123', 'password123', '2000-06-10', 'Female', '1617 Scholar Ln, Hyderabad', '9876543215', 'PHP, Laravel'),
('Krishna Patel', 'krishna.patel@example.com', 'krishna123', 'password123', '2000-07-15', 'Male', '1819 Student Blvd, Ahmedabad', '9876543216', 'Swift, iOS'),
('Riya Verma', 'riya.verma@example.com', 'riya123', 'password123', '2000-08-20', 'Female', '2021 College Ave, Kolkata', '9876543217', 'Kotlin, Android'),
('Dev Sharma', 'dev.sharma@example.com', 'dev123', 'password123', '2000-09-25', 'Male', '2223 University Rd, Jaipur', '9876543218', 'Java, Spring'),
('Nisha Kapoor', 'nisha.kapoor@example.com', 'nisha123', 'password123', '2000-10-30', 'Female', '2425 Academy Ln, Surat', '9876543219', 'Django, Python');

-- Insert records into the joblist table
INSERT INTO joblist (cid, jobtitle, jobvacancy, jobexperience, jobsalary, jobpublishdate, jobdeadline, jobemployeementstatus, jobJD) VALUES
(2101, 'Software Engineer', 5, '2-3 years', 60000.00, '2024-01-01', '2024-03-01', 'Full Time', 'Develop software solutions.'),
(2102, 'Data Analyst', 3, '1-2 years', 50000.00, '2024-01-05', '2024-02-28', 'Full Time', 'Analyze data and provide insights.'),
(2103, 'Web Developer', 4, '1-2 years', 55000.00, '2024-01-10', '2024-03-15', 'Full Time', 'Develop and maintain websites.'),
(2104, 'Project Manager', 2, '5+ years', 80000.00, '2024-01-15', '2024-04-01', 'Full Time', 'Manage software development projects.'),
(2105, 'Intern - Software Development', 10, '0-1 years', 20000.00, '2024-01-20', '2024-02-20', 'Internship', 'Assist in software development tasks.'),
(2106, 'HR Executive', 2, '2-3 years', 40000.00, '2024-02-01', '2024-03-15', 'Full Time', 'Manage HR processes.'),
(2107, 'Marketing Executive', 5, '1-2 years', 35000.00, '2024-02-05', '2024-03-20', 'Full Time', 'Handle marketing campaigns.'),
(2108, 'Business Analyst', 3, '2-3 years', 60000.00, '2024-02-10', '2024-04-01', 'Full Time', 'Analyze business requirements.'),
(2109, 'System Administrator', 2, '3-5 years', 70000.00, '2024-02-15', '2024-04-15', 'Full Time', 'Manage IT infrastructure.'),
(2110, 'Graphic Designer', 4, '1-2 years', 40000.00, '2024-02-20', '2024-03-30', 'Part Time', 'Create visual content.');

-- Insert records into the applyjob table
INSERT INTO applyjob (sid, jobid) VALUES
(3101, 4101), -- Aarav applies for Software Engineer
(3102, 4102), -- Vivaan applies for Data Analyst
(3103, 4103), -- Diya applies for Web Developer
(3104, 4104), -- Anaya applies for Project Manager
(3105, 4105), -- Arjun applies for Intern
(3106, 4106), -- Saanvi applies for HR Executive
(3107, 4107), -- Krishna applies for Marketing Executive
(3108, 4108), -- Riya applies for Business Analyst
(3109, 4109), -- Dev applies for System Administrator
(3110, 4110); -- Nisha applies for Graphic Designer


SELECT * FROM admin;
SELECT * FROM company;
SELECT * FROM student;
SELECT * FROM joblist;
SELECT * FROM applyjob;



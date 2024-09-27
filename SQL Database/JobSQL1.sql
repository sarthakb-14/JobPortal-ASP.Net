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


SELECT * FROM admin;
SELECT * FROM company;
SELECT * FROM student;
SELECT * FROM joblist;
SELECT * FROM applyjob;



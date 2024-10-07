use JobPortal;

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
('Riya Verma', 'riya.verma@example.com', 'riya123', 'password123', '2000-08-20', 'Female', '2021 University St, Kolkata', '9876543217', 'Kotlin, Android'),
('Lakshmi Nair', 'lakshmi.nair@example.com', 'lakshmi123', 'password123', '2000-09-25', 'Female', '2223 College Ave, Jaipur', '9876543218', 'Node.js, Express'),
('Vikram Joshi', 'vikram.joshi@example.com', 'vikram123', 'password123', '2000-10-30', 'Male', '2425 Student St, Surat', '9876543219', 'Scala, Akka');
 


-- Insert records into the joblist table
INSERT INTO joblist (cid, jobtitle, jobvacancy, jobexperience, jobsalary, jobpublishdate, jobdeadline, jobemployeementstatus, jobJD) VALUES
(2101, 'Software Engineer', 5, '2-4 years', 700000.00, '2024-01-01', '2024-02-01', 'Full Time',
'Develop software applications using Java and related technologies. Collaborate with teams to design and maintain solutions. Strong problem-solving skills are essential.'),
(2102, 'Frontend Developer', 3, '1-3 years', 600000.00, '2024-01-05', '2024-02-05', 'Freelancer',
'Create responsive web applications using HTML, CSS, and JavaScript. Work closely with designers to implement user-friendly interfaces.'),
(2103, 'Data Analyst', 4, '1-2 years', 500000.00, '2024-01-10', '2024-02-10', 'Internship',
'Analyze complex datasets to provide insights. Create reports and dashboards to communicate findings. Strong analytical skills required.'),
(2104, 'Project Manager', 2, '5+ years', 1500000.00, '2024-02-01', '2024-03-01', 'Full Time',
'Lead project teams to ensure timely delivery of software projects. Manage project scope, timelines, and budgets. Strong leadership is essential.'),
(2105, 'Marketing Executive', 5, '0-2 years', 400000.00, '2024-01-15', '2024-02-15', 'Part Time',
'Develop and implement marketing strategies. Conduct market research and analyze trends to identify new opportunities.'),
(2106, 'Business Analyst', 3, '2-3 years', 800000.00, '2024-01-20', '2024-02-20', 'Freelancer',
'Gather and analyze business requirements. Create detailed project documentation. Strong communication skills are required.'),
(2107, 'UX Designer', 4, '1-3 years', 650000.00, '2024-02-01', '2024-03-01', 'Part Time',
'Design intuitive user interfaces and user experiences. Collaborate with product teams to deliver compelling designs.'),
(2108, 'Network Engineer', 3, '2-4 years', 700000.00, '2024-01-25', '2024-02-25', 'Full Time',
'Manage and maintain network infrastructure. Troubleshoot network issues and ensure optimal performance.'),
(2109, 'Content Writer', 5, '0-2 years', 300000.00, '2024-02-10', '2024-03-10', 'Internship',
'Create engaging content for various platforms. Conduct research and gather information to support content creation.'),
(2110, 'Sales Associate', 6, '0-2 years', 350000.00, '2024-02-15', '2024-03-15', 'Part Time',
'Assist customers in finding products. Build relationships with clients and provide excellent service.'),
(2104, 'DevOps Engineer', 4, '3-5 years', 900000.00, '2024-02-20', '2024-03-20', 'Full Time',
'Build and maintain CI/CD pipelines. Manage cloud infrastructure and ensure system reliability. Strong knowledge of automation tools required.'),
(2102, 'Quality Assurance Tester', 5, '1-3 years', 450000.00, '2024-03-01', '2024-04-01', 'Part Time',
'Test software to identify bugs and ensure product quality. Collaborate with developers to resolve issues.'),
(2103, 'Mobile App Developer', 3, '2-4 years', 700000.00, '2024-02-10', '2024-03-10', 'Freelancer',
'Develop mobile applications for Android and iOS platforms. Work with UI/UX teams to improve user experience.'),
(2101, 'Graphic Designer', 4, '0-2 years', 500000.00, '2024-02-25', '2024-03-25', 'Internship',
'Design visual elements for websites and marketing materials. Collaborate with marketing teams to deliver creative assets.'),
(2105, 'HR Manager', 2, '5+ years', 1200000.00, '2024-03-01', '2024-04-01', 'Full Time',
'Oversee recruitment, employee relations, and organizational development. Ensure compliance with labor laws and regulations.'),
(2106, 'Cybersecurity Specialist', 3, '3-5 years', 950000.00, '2024-03-05', '2024-04-05', 'Freelancer',
'Identify security vulnerabilities and implement measures to protect networks and data. Respond to security incidents and breaches.'),
(2107, 'Product Manager', 2, '4-6 years', 1400000.00, '2024-02-28', '2024-03-28', 'Full Time',
'Lead product development and strategy. Work closely with engineering and marketing teams to deliver successful products.'),
(2108, 'Social Media Manager', 5, '1-3 years', 400000.00, '2024-03-10', '2024-04-10', 'Part Time',
'Manage social media accounts and campaigns. Create content and analyze performance metrics to drive engagement.'),
(2109, 'IT Support Specialist', 6, '0-1 years', 350000.00, '2024-02-15', '2024-03-15', 'Internship',
'Troubleshoot hardware and software issues for internal users. Provide technical support and training to employees.'),
(2110, 'Digital Marketing Specialist', 4, '2-4 years', 550000.00, '2024-03-01', '2024-04-01', 'Freelancer',
'Plan and execute digital marketing campaigns. Optimize websites and content for SEO and manage online advertising.'),
(2101, 'Machine Learning Engineer', 3, '3-5 years', 1100000.00, '2024-03-15', '2024-04-15', 'Full Time',
'Develop machine learning models and algorithms. Work with data scientists to improve performance and scalability of AI systems.'),
(2103, 'Operations Manager', 2, '5+ years', 1300000.00, '2024-03-20', '2024-04-20', 'Part Time',
'Manage day-to-day operations, ensuring efficient processes and workflow. Lead teams to meet organizational goals.'),
(2105, 'Video Editor', 5, '1-3 years', 450000.00, '2024-03-05', '2024-04-05', 'Freelancer',
'Edit video content for online platforms, including promotional and instructional videos. Collaborate with content creators to deliver high-quality output.'),
(2106, 'Technical Writer', 4, '1-3 years', 400000.00, '2024-03-01', '2024-04-01', 'Freelancer',
'Create detailed technical documentation, user manuals, and product descriptions. Work with engineers to ensure accuracy and clarity.'),
(2109, 'Data Scientist', 3, '3-5 years', 1000000.00, '2024-03-15', '2024-04-15', 'Full Time',
'Analyze large datasets and build predictive models. Use statistical methods to provide insights and recommendations for business decisions.');


 
 
-- Insert records into the applyjob table
INSERT INTO applyjob (sid, jobid) VALUES
(3101, 4101),  -- Aarav Mehta applies for Software Engineer
(3102, 4102),  -- Vivaan Gupta applies for Frontend Developer
(3103, 4103),  -- Diya Sharma applies for Data Analyst
(3104, 4104),  -- Anaya Rao applies for Project Manager
(3105, 4105),  -- Arjun Singh applies for Marketing Executive
(3106, 4106),  -- Saanvi Iyer applies for Business Analyst
(3107, 4107),  -- Krishna Patel applies for UX Designer
(3108, 4108),  -- Riya Verma applies for Network Engineer
(3109, 4109),  -- Lakshmi Nair applies for Content Writer
(3110, 4110);  -- Vikram Joshi applies for Sales Associate





















---- Insert records into the admin table
--INSERT INTO admin (aname, aemail, ausername, apassword) VALUES
--('Ravi Sharma', 'ravi.sharma@example.com', 'ravi123', 'password123'),
--('Sneha Verma', 'sneha.verma@example.com', 'sneha123', 'password123'),
--('Amit Patel', 'amit.patel@example.com', 'amit123', 'password123'),
--('Priya Rao', 'priya.rao@example.com', 'priya123', 'password123'),
--('Vikram Singh', 'vikram.singh@example.com', 'vikram123', 'password123'),
--('Anjali Iyer', 'anjali.iyer@example.com', 'anjali123', 'password123'),
--('Karan Mehta', 'karan.mehta@example.com', 'karan123', 'password123'),
--('Neha Gupta', 'neha.gupta@example.com', 'neha123', 'password123'),
--('Rajesh Khanna', 'rajesh.khanna@example.com', 'rajesh123', 'password123'),
--('Deepika Choudhary', 'deepika.choudhary@example.com', 'deepika123', 'password123');

---- Insert records into the company table
--INSERT INTO company (cname, cemail, cusername, cpassword, caddress, ccity, cwebsiteurl, ccontactno) VALUES
--('Tata Consultancy Services', 'contact@tcs.com', 'tcs_user', 'password123', 'TCS House, Ravali Park', 'Mumbai', 'www.tcs.com', '0221234567'),
--('Infosys Limited', 'info@infosys.com', 'infosys_user', 'password123', 'Infy Campus, Electronics City', 'Bangalore', 'www.infosys.com', '0802345678'),
--('Wipro Limited', 'contact@wipro.com', 'wipro_user', 'password123', 'Doddakannalli, Sarjapur Road', 'Bangalore', 'www.wipro.com', '0803456789'),
--('HCL Technologies', 'info@hcl.com', 'hcl_user', 'password123', 'HCL Technologies Ltd.', 'Noida', 'www.hcl.com', '0120345678'),
--('Tech Mahindra', 'support@techmahindra.com', 'techmahindra_user', 'password123', 'Tech Mahindra Campus', 'Pune', 'www.techmahindra.com', '0201234567'),
--('Larsen & Toubro', 'info@lt.com', 'lt_user', 'password123', 'L&T House, N.M. Marg', 'Mumbai', 'www.larsentoubro.com', '0222345678'),
--('Accenture', 'contact@accenture.com', 'accenture_user', 'password123', 'Accenture Tower, Shriram', 'Gurgaon', 'www.accenture.com', '0123456789'),
--('Cognizant', 'info@cognizant.com', 'cognizant_user', 'password123', 'Cognizant Technology Solutions', 'Chennai', 'www.cognizant.com', '0444567890'),
--('Capgemini', 'contact@capgemini.com', 'capgemini_user', 'password123', 'Capgemini Tower', 'Bangalore', 'www.capgemini.com', '0805678901'),
--('Mindtree', 'info@mindtree.com', 'mindtree_user', 'password123', 'Mindtree Limited, Global Village', 'Bangalore', 'www.mindtree.com', '0806789012');

---- Insert records into the student table
--INSERT INTO student (sname, semail, susername, spassword, sdob, sgender, saddress, scontactno, sskills) VALUES
--('Aarav Mehta', 'aarav.mehta@example.com', 'aarav123', 'password123', '2001-01-15', 'Male', '1234 Student St, Mumbai', '9876543210', 'Java, SQL'),
--('Vivaan Gupta', 'vivaan.gupta@example.com', 'vivaan123', 'password123', '2000-02-20', 'Male', '5678 College Ave, Delhi', '9876543211', 'Python, JavaScript'),
--('Diya Sharma', 'diya.sharma@example.com', 'diya123', 'password123', '2000-03-25', 'Female', '91011 University Blvd, Bangalore', '9876543212', 'HTML, CSS'),
--('Anaya Rao', 'anaya.rao@example.com', 'anaya123', 'password123', '2000-04-30', 'Female', '1213 College St, Chennai', '9876543213', 'C++, React'),
--('Arjun Singh', 'arjun.singh@example.com', 'arjun123', 'password123', '2000-05-05', 'Male', '1415 Academy Rd, Pune', '9876543214', 'Ruby, Rails'),
--('Saanvi Iyer', 'saanvi.iyer@example.com', 'saanvi123', 'password123', '2000-06-10', 'Female', '1617 Scholar Ln, Hyderabad', '9876543215', 'PHP, Laravel'),
--('Krishna Patel', 'krishna.patel@example.com', 'krishna123', 'password123', '2000-07-15', 'Male', '1819 Student Blvd, Ahmedabad', '9876543216', 'Swift, iOS'),
--('Riya Verma', 'riya.verma@example.com', 'riya123', 'password123', '2000-08-20', 'Female', '2021 College Ave, Kolkata', '9876543217', 'Kotlin, Android'),
--('Dev Sharma', 'dev.sharma@example.com', 'dev123', 'password123', '2000-09-25', 'Male', '2223 University Rd, Jaipur', '9876543218', 'Java, Spring'),
--('Nisha Kapoor', 'nisha.kapoor@example.com', 'nisha123', 'password123', '2000-10-30', 'Female', '2425 Academy Ln, Surat', '9876543219', 'Django, Python');

---- Insert records into the joblist table
--INSERT INTO joblist (cid, jobtitle, jobvacancy, jobexperience, jobsalary, jobpublishdate, jobdeadline, jobemployeementstatus, jobJD) VALUES
--(2101, 'Software Engineer', 5, '2-3 years', 60000.00, '2024-01-01', '2024-03-01', 'Full Time', 'Develop software solutions.'),
--(2102, 'Data Analyst', 3, '1-2 years', 50000.00, '2024-01-05', '2024-02-28', 'Full Time', 'Analyze data and provide insights.'),
--(2103, 'Web Developer', 4, '1-2 years', 55000.00, '2024-01-10', '2024-03-15', 'Full Time', 'Develop and maintain websites.'),
--(2104, 'Project Manager', 2, '5+ years', 80000.00, '2024-01-15', '2024-04-01', 'Full Time', 'Manage software development projects.'),
--(2105, 'Intern - Software Development', 10, '0-1 years', 20000.00, '2024-01-20', '2024-02-20', 'Internship', 'Assist in software development tasks.'),
--(2106, 'HR Executive', 2, '2-3 years', 40000.00, '2024-02-01', '2024-03-15', 'Full Time', 'Manage HR processes.'),
--(2107, 'Marketing Executive', 5, '1-2 years', 35000.00, '2024-02-05', '2024-03-20', 'Full Time', 'Handle marketing campaigns.'),
--(2108, 'Business Analyst', 3, '2-3 years', 60000.00, '2024-02-10', '2024-04-01', 'Full Time', 'Analyze business requirements.'),
--(2109, 'System Administrator', 2, '3-5 years', 70000.00, '2024-02-15', '2024-04-15', 'Full Time', 'Manage IT infrastructure.'),
--(2110, 'Graphic Designer', 4, '1-2 years', 40000.00, '2024-02-20', '2024-03-30', 'Part Time', 'Create visual content.');

---- Insert records into the applyjob table
--INSERT INTO applyjob (sid, jobid) VALUES
--(3101, 4101), -- Aarav applies for Software Engineer
--(3102, 4102), -- Vivaan applies for Data Analyst
--(3103, 4103), -- Diya applies for Web Developer
--(3104, 4104), -- Anaya applies for Project Manager
--(3105, 4105), -- Arjun applies for Intern
--(3106, 4106), -- Saanvi applies for HR Executive
--(3107, 4107), -- Krishna applies for Marketing Executive
--(3108, 4108), -- Riya applies for Business Analyst
--(3109, 4109), -- Dev applies for System Administrator
--(3110, 4110); -- Nisha applies for Graphic Designer

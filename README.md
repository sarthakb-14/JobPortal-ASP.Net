# 🌐 **Job Portal Capstone** 🎯

![ASP.NET](https://img.shields.io/badge/ASP.NET-MVC-blue) ![C#](https://img.shields.io/badge/C%23-Backend-purple) ![SQL Server](https://img.shields.io/badge/SQL%20Server-Database-orange) ![Bootstrap](https://img.shields.io/badge/Bootstrap-Responsive-ff69b4)

## 🚀 Overview

The **Job Portal Capstone** is a full-stack web application developed using **ASP.NET MVC**, **C#**, and **SQL Server**. It comprises three specialized portals, offering seamless job search, management, and application features for Admins, Companies, and Students.

---

## 📋 **Table of Contents**

1. [🔧 Features](#-features)
2. [💻 Technologies Used](#-technologies-used)
3. [⚙️ Installation](#%EF%B8%8F-installation)
4. [🔐 Configuration](#-configuration)
5. [🛠️ Usage](#%EF%B8%8F-usage)
6. [📡 API Endpoints](#-api-endpoints)
7. [🧑‍🤝‍🧑 Contributors](#-contributors)
8. [📜 License](#-license)

---

## 🔧 **Features**

### 🛠️ **Admin Portal**
- **👤 User Management**: Create, update, and delete user accounts (Admins, Companies, Students).
- **🏢 Company Management**: Approve or reject company registrations.
- **📋 Job Management**: Moderate job postings across the platform.
- **📊 Analytics Dashboard**: View key system statistics and performance metrics.

### 🏢 **Company Portal**
- **📝 Job Posting**: Create, update, and delete job listings.
- **📂 Application Management**: View and manage student job applications.
- **🏷️ Company Profile**: Update company information and branding.

### 🎓 **Student Portal**
- **🔍 Job Search**: Search and filter jobs based on your criteria.
- **✉️ Application Management**: Apply for jobs and track your status.
- **👤 Profile Management**: Update your profile, upload resumes, and manage job preferences.

---

## 💻 **Technologies Used**

- **ASP.NET MVC**: 🚀 Backend and frontend framework for web application development.
- **C#**: ⚙️ Backend logic.
- **SQL Server**: 🗄️ Relational database management using SSMS.
- **Entity Framework**: 🌐 ORM for database interaction.
- **Bootstrap**: 🎨 Responsive design and layout.
- **AJAX**: 🚦 Asynchronous updates without reloading the page.

---

## ⚙️ **Installation**

### Prerequisites:
1. **💻 Visual Studio**: IDE for developing the ASP.NET application.
2. **🗄️ SQL Server**: Relational database management system.
3. **🔍 SSMS**: To query and manage the database.

### Steps:

1. **📥 Clone the Repository**:
    ```bash
    git clone https://github.com/yourusername/job-portal-capstone.git
    cd job-portal-capstone
    ```

2. **🗄️ Database Setup**:
    - Create a database in SQL Server.
    - Run the scripts located in the `/DatabaseScripts` folder to create tables and relationships.
    - Update the connection string in `web.config` or `appsettings.json`.

3. **🛠️ Configure the Application**:
    - Open the solution in **Visual Studio**.
    - Restore NuGet packages with **Restore NuGet Packages**.

4. **▶️ Run the Application**:
    - Press `Ctrl + F5` to run the application locally.
    - Navigate to `http://localhost:PORT_NUMBER` in your browser.

---

## 🔐 **Configuration**

### **Database Configuration**

Ensure that the database connection string in `web.config` is correct:

```xml
<connectionStrings>
  <add name="DefaultConnection" connectionString="Server=YOUR_SERVER;Database=JobPortalDB;Trusted_Connection=True;" providerName="System.Data.SqlClient" />
</connectionStrings>
```

### **Entity Framework Migrations**

To update the database schema:
1. Open **Package Manager Console** in Visual Studio.
2. Run the following commands:
   - **Add Migration**:
     ```bash
     Add-Migration MigrationName
     ```
   - **Update Database**:
     ```bash
     Update-Database
     ```

---

## 🛠️ **Usage**

### **Admin Portal**
- **URL**: `/admin`
- **Key Features**:
   - Manage users, companies, and job postings.
   - View system-wide analytics and health.

### **Company Portal**
- **URL**: `/company`
- **Key Features**:
   - Post, update, and delete job listings.
   - Manage student applications for jobs.

### **Student Portal**
- **URL**: `/student`
- **Key Features**:
   - Search and apply for jobs.
   - Manage profile and resumes.

---

## 📡 **API Endpoints**

The project uses **ASP.NET MVC** with **C#** to handle API requests. Key endpoints:

### **Admin API**
- **Get All Users** (`GET /api/Admin/Users`)
    ```sql
    SELECT aid, aname, aemail, ausername FROM admin;
    ```
    Example (C#):
    ```csharp
    [HttpGet]
    public ActionResult GetAllUsers()
    {
        string query = "SELECT aid, aname, aemail, ausername FROM admin";
        DataTable dataTable = ExecuteQuery(query);
        return Json(dataTable, JsonRequestBehavior.AllowGet);
    }
    ```

- **Approve/Reject Companies** (`POST /api/Admin/Companies`)
    ```sql
    UPDATE company SET status = 'Approved' WHERE cid = @cid;
    ```
    Example (C#):
    ```csharp
    [HttpPost]
    public ActionResult ApproveCompany(int cid)
    {
        string query = "UPDATE company SET status = 'Approved' WHERE cid = @cid";
        ExecuteNonQuery(query, new SqlParameter("@cid", cid));
        return Json(new { success = true, message = "Company approved" });
    }
    ```

### **Company API**
- **Post New Job** (`POST /api/Company/Jobs`)
    ```sql
    INSERT INTO joblist (cid, jobtitle, jobvacancy, jobexperience, jobsalary, jobpublishdate, jobdeadline, jobemploymentstatus, jobJD)
    VALUES (@cid, @jobtitle, @jobvacancy, @jobexperience, @jobsalary, @jobpublishdate, @jobdeadline, @jobemploymentstatus, @jobJD);
    ```
    Example (C#):
    ```csharp
    [HttpPost]
    public ActionResult PostNewJob(Job job)
    {
        int cid = (int)Session["CompanyID"];
        string query = @"INSERT INTO joblist (cid, jobtitle, jobvacancy, jobexperience, jobsalary, jobpublishdate, jobdeadline, jobemploymentstatus, jobJD)
                         VALUES (@cid, @jobtitle, @jobvacancy, @jobexperience, @jobsalary, @jobpublishdate, @jobdeadline, @jobemploymentstatus, @jobJD)";
        SqlParameter[] parameters = {
            new SqlParameter("@cid", cid),
            new SqlParameter("@jobtitle", job.JobTitle),
            // Additional parameters...
        };
        ExecuteNonQuery(query, parameters);
        return Json(new { success = true, message = "Job posted successfully" });
    }
    ```
    
---

## 🧑‍🤝‍🧑 <span style="color: deeppink; font-weight: bold;">**Contributors**</span> 🚀✨

### 🎉 **Special Thanks to the Amazing Team** 👏

<div align="center">

| Name       | Role           | GitHub Profile         |
|------------|----------------|------------------------|
| 🏆 Utkarsh | Full Stack Developer | [Utkarsh](https://github.com/Utkarshsinghhhhh) |
| 🚀 Devansh | Full Stack Developer | [Devansh](https://github.com/Devanshsati)      |
| 💡 Roshan  | Full Stack Developer | [Roshan](https://github.com/Roshankumar151p)   |
| 🎓 Sarthak | Full Stack Developer | [Sarthak](https://github.com/sarthakb-14)      |

</div>

<div align="center">
  
**Big thanks** 🙌 to everyone who contributed to making the **Job Portal Capstone** a success!

</div>

---

### 🚀 <span style="color: royalblue;">**Want to Contribute?**</span>

We love contributions from the community! 🥳 If you would like to contribute to this project, here’s how you can help:

1. **Fork the Repository** 🍴: Click the **Fork** button in the top right corner.
2. **Create a New Branch** 🌿: Name your branch something like `feature/amazing-feature`.
3. **Submit a Pull Request** 🤝: Once your changes are ready, create a **pull request** with a detailed description of the changes.

We’re excited to collaborate with you! 🎉

---

### 👏 **Acknowledgments**

Thanks to everyone involved! Your hard work, dedication, and creativity made this project what it is today. Together, we’ve built something truly awesome! 🌟

---

## 📜 **License**

This project is licensed under the **MIT License**. See the `LICENSE` file for more details.

---

## ❓ **Further Help**

For more information about **ASP.NET MVC**, check out the [official documentation](https://docs.microsoft.com/en-us/aspnet/mvc/overview/getting-started/introduction/getting-started).

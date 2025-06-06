# ALTIS - AIR Learning & Training Information System

## 👨‍💻 Group Members

|    Name          |  Student ID     |
|------------------|-----------------|
|   Haseeb Jalil   |    241908       |
|   Taimur Sajid   |    241839       |

---

## 📌 Project Title & Description

**Project Title:** ALTIS - AIR Learning & Training Information System

**Description:**
ALTIS is a university-level virtual campus system developed to provide a seamless platform for managing academic activities and communication between administrators, faculty members, and students. The system offers role-based access and features such as:

- **Admin Panel**: Manage faculty, students, courses, and schedules.
- **Faculty Portal**: Manage student records, upload results, view course allocations.
- **Student Dashboard**: View course enrollments, grades, schedules, and notices.

This system is built using **.NET (ASP.NET Core)** for backend functionality and integrates with **SQL Server** as its database.

---

## ⚙️ Setup Instructions

### 1. Database Restoration

- Open **SQL Server Management Studio (SSMS)**.
- Go to **File > Open > File...** and select the provided `.sql` backup script or `.bak` file.
- If it's a `.bak` file:
  - Right-click on **Databases > Restore Database**.
  - Choose **Device** > select the `.bak` file from your local storage.
  - Click **OK** to restore.

### 2. Running the Application

- Open the solution in **Visual Studio 2022 or later**.
- Make sure **SQL Server** is running and the connection string in `appsettings.json` is correctly configured:
  ```json
  "ConnectionStrings": {
    "DefaultConnection": "Server=YOUR_SERVER_NAME;Database=ALTIS_DB;Trusted_Connection=True;"
  }

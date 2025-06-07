----------------------------------------------------------------------------------------
-------------------------------Creating Tables------------------------------------------
----------------------------------------------------------------------------------------

-- 1. ADMINS
CREATE TABLE ADMINS (
    AdminID INT PRIMARY KEY,
    StaffName VARCHAR(100),
    StaffMail VARCHAR(100) UNIQUE,
    StaffPassword VARCHAR(100)
);

-- 2. STUDENTS
CREATE TABLE STUDENTS (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Contact VARCHAR(20),
    StudentMail VARCHAR(100) UNIQUE,
    StudentPassword VARCHAR(100),
    Address VARCHAR(200),
    SectionID VARCHAR(10),
    FOREIGN KEY (SectionID) REFERENCES SECTIONS(SectionID)
);

-- 3. FACULTY
CREATE TABLE FACULTY (
    FacultyID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Contact VARCHAR(20),
    FacultyMail VARCHAR(100) UNIQUE,
    FacultyPassword VARCHAR(100),
    Address VARCHAR(200)
);

-- 4. COURSES
CREATE TABLE COURSES (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

-- 5. SECTIONS
CREATE TABLE SECTIONS (
    SectionID VARCHAR(10) PRIMARY KEY,
    SectionName VARCHAR(50)
);

-- 6. COURSE_ASSIGNMENTS
CREATE TABLE COURSE_ASSIGNMENTS (
    AssignmentID INT PRIMARY KEY,
    CourseID INT,
    FacultyID INT,
    SectionID VARCHAR(10),
    AdminID INT,
    Semester VARCHAR(20),
    FOREIGN KEY (CourseID) REFERENCES COURSES(CourseID),
    FOREIGN KEY (FacultyID) REFERENCES FACULTY(FacultyID),
    FOREIGN KEY (SectionID) REFERENCES SECTIONS(SectionID),
    FOREIGN KEY (AdminID) REFERENCES ADMINS(AdminID)
);

-- 7. CLASSROOMS
CREATE TABLE CLASSROOMS (
    ClassroomID INT PRIMARY KEY,
    CourseID INT,
    FacultyID INT,
    SectionID VARCHAR(10),
    Title VARCHAR(100),
    FOREIGN KEY (CourseID) REFERENCES COURSES(CourseID),
    FOREIGN KEY (FacultyID) REFERENCES FACULTY(FacultyID),
    FOREIGN KEY (SectionID) REFERENCES SECTIONS(SectionID)
);

-- 8. ENROLLMENTS
CREATE TABLE ENROLLMENTS (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    ClassroomID INT,
    FOREIGN KEY (StudentID) REFERENCES STUDENTS(StudentID),
    FOREIGN KEY (ClassroomID) REFERENCES CLASSROOMS(ClassroomID)
);

-- 9. ASSIGNMENTS
CREATE TABLE ASSIGNMENTS (
    AssignmentID INT PRIMARY KEY,
    ClassroomID INT,
    Title VARCHAR(100),
    Description TEXT,
    DueDate DATE,
    FOREIGN KEY (ClassroomID) REFERENCES CLASSROOMS(ClassroomID)
);

-- 10. SUBMISSIONS
CREATE TABLE SUBMISSIONS (
    SubmissionID INT PRIMARY KEY,
    AssignmentID INT,
    StudentID INT,
    SubmittedAt DATE,
    FileName VARCHAR(255),
    FOREIGN KEY (AssignmentID) REFERENCES ASSIGNMENTS(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES STUDENTS(StudentID)
);

-- 11. ATTENDANCE
CREATE TABLE ATTENDANCE (
    AttendanceID INT PRIMARY KEY,
    ClassroomID INT,
    StudentID INT,
    Date DATE,
    Status VARCHAR(10) CHECK (Status IN ('Present', 'Absent')),
    FOREIGN KEY (ClassroomID) REFERENCES CLASSROOMS(ClassroomID),
    FOREIGN KEY (StudentID) REFERENCES STUDENTS(StudentID)
);

-- 12. MARKS
CREATE TABLE MARKS (
    MarkID INT PRIMARY KEY,
    StudentID INT,
    AssignmentID INT,
    ClassroomID INT,
    Score FLOAT CHECK (Score >= 0 AND Score <= 100),
    FOREIGN KEY (StudentID) REFERENCES STUDENTS(StudentID),
    FOREIGN KEY (AssignmentID) REFERENCES ASSIGNMENTS(AssignmentID),
    FOREIGN KEY (ClassroomID) REFERENCES CLASSROOMS(ClassroomID)
);

-- 13. RESULTS
CREATE TABLE RESULTS (
    ResultID INT PRIMARY KEY,
    StudentID INT,
    AdminID INT,
    GPA FLOAT CHECK (GPA >= 0.0 AND GPA <= 4.0),
    Remarks VARCHAR(200),
    FOREIGN KEY (StudentID) REFERENCES STUDENTS(StudentID),
    FOREIGN KEY (AdminID) REFERENCES ADMINS(AdminID)
);

----------------------------------------------------------------------------------------
-------------------------------Inserting Data-------------------------------------------
----------------------------------------------------------------------------------------

-- 1. ADMINS
INSERT INTO ADMINS VALUES
(1, 'Taimur Ali', 'taimur@altis.edu.pk', 'taimur123'),
(2, 'Haseeb Anwar', 'haseeb@altis.edu.pk', 'haseeb123'),
(3, 'Raheem Siddiq', 'raheem@altis.edu.pk', 'raheem123');

-- 2. SECTIONS
INSERT INTO SECTIONS VALUES
('A1', 'Alpha 1'),
('B1', 'Bravo 1'),
('C1', 'Charlie 1');

-- 3. STUDENTS
INSERT INTO STUDENTS VALUES
(101, 'Ahmad', 'Khan', '03001234567', 'ahmad@student.altis.edu.pk', 'pass101', 'F-10 Islamabad', 'A1'),
(102, 'Usman', 'Ali', '03111234567', 'usman@student.altis.edu.pk', 'pass102', 'G-11 Islamabad', 'A1'),
(103, 'Fatima', 'Zahid', '03211234567', 'fatima@student.altis.edu.pk', 'pass103', 'F-6 Islamabad', 'A1'),
(104, 'Ayesha', 'Malik', '03011234567', 'ayesha@student.altis.edu.pk', 'pass104', 'I-8 Islamabad', 'B1'),
(105, 'Amina', 'Shah', '03331234567', 'amina@student.altis.edu.pk', 'pass105', 'H-8 Islamabad', 'B1'),
(106, 'Zain', 'Ibrahim', '03441234567', 'zain@student.altis.edu.pk', 'pass106', 'DHA Karachi', 'B1'),
(107, 'Hina', 'Rafiq', '03551234567', 'hina@student.altis.edu.pk', 'pass107', 'Gulshan Karachi', 'C1'),
(108, 'Kashif', 'Tariq', '03011234678', 'kashif@student.altis.edu.pk', 'pass108', 'Bahria Lahore', 'C1'),
(109, 'Nimra', 'Aslam', '03021234567', 'nimra@student.altis.edu.pk', 'pass109', 'Cantt Lahore', 'C1'),
(110, 'Bilal', 'Ahmed', '03661234567', 'bilal@student.altis.edu.pk', 'pass110', 'G-7 Islamabad', 'A1'),
(111, 'Sameer', 'Hussain', '03171234567', 'sameer@student.altis.edu.pk', 'pass111', 'PWD Islamabad', 'B1'),
(112, 'Iqra', 'Naeem', '03281234567', 'iqra@student.altis.edu.pk', 'pass112', 'Askari 10', 'C1'),
(113, 'Sana', 'Rehman', '03391234567', 'sana@student.altis.edu.pk', 'pass113', 'Gulberg Lahore', 'A1');

-- 4. FACULTY
INSERT INTO FACULTY VALUES
(201, 'Dr. Asim', 'Raza', '03012345678', 'asim@faculty.altis.edu.pk', 'pass201', 'F-11 Islamabad'),
(202, 'Sir Imran', 'Qureshi', '03112345678', 'imran@faculty.altis.edu.pk', 'pass202', 'E-11 Islamabad'),
(203, 'Madam Nadia', 'Khan', '03212345678', 'nadia@faculty.altis.edu.pk', 'pass203', 'DHA Lahore');

-- 5. COURSES
INSERT INTO COURSES VALUES
(501, 'Database Systems'),
(502, 'Object-Oriented Programming'),
(503, 'Web Engineering');

-- 6. COURSE_ASSIGNMENTS
INSERT INTO COURSE_ASSIGNMENTS VALUES
(1, 501, 201, 'A1', 1, 'Spring 2025'),
(2, 502, 202, 'B1', 2, 'Spring 2025'),
(3, 503, 203, 'C1', 3, 'Spring 2025');

-- 7. CLASSROOMS
INSERT INTO CLASSROOMS VALUES
(301, 501, 201, 'A1', 'DBMS - A1'),
(302, 502, 202, 'B1', 'OOP - B1'),
(303, 503, 203, 'C1', 'Web Eng - C1');

-- 8. ENROLLMENTS
INSERT INTO ENROLLMENTS VALUES
(1, 101, 301),
(2, 102, 301),
(3, 103, 301),
(4, 104, 302),
(5, 105, 302),
(6, 106, 302),
(7, 107, 303),
(8, 108, 303),
(9, 109, 303),
(10, 110, 301),
(11, 111, 302),
(12, 112, 303),
(13, 113, 301);

-- 9. ASSIGNMENTS
INSERT INTO ASSIGNMENTS VALUES
(101, 301, 'ERD Assignment', 'Draw an ERD for ALTIS', '2025-03-01'),
(102, 301, 'Normalization Task', 'Convert schema to 3NF', '2025-03-05'),
(103, 302, 'OOP Quiz', 'Inheritance and Polymorphism', '2025-03-10');

-- 10. SUBMISSIONS
INSERT INTO SUBMISSIONS VALUES
(1001, 101, 101, '2025-02-28', 'erd_ahmad.pdf'),
(1002, 101, 102, '2025-02-28', 'erd_usman.pdf'),
(1003, 101, 103, '2025-02-28', 'erd_fatima.pdf'),
(1004, 102, 101, '2025-03-03', 'nf_ahmad.docx'),
(1005, 103, 104, '2025-03-08', 'oop_ayesha.cpp');

-- 11. ATTENDANCE
INSERT INTO ATTENDANCE VALUES
(1, 301, 101, '2025-02-15', 'Present'),
(2, 301, 102, '2025-02-15', 'Absent'),
(3, 301, 103, '2025-02-15', 'Present'),
(4, 302, 104, '2025-02-15', 'Present'),
(5, 303, 107, '2025-02-15', 'Absent');

-- 12. MARKS
INSERT INTO MARKS VALUES
(1, 101, 101, 301, 88.0),
(2, 102, 101, 301, 76.5),
(3, 103, 101, 301, 92.0),
(4, 104, 103, 302, 85.0),
(5, 105, 103, 302, 78.0);

-- 13. RESULTS
INSERT INTO RESULTS VALUES
(1, 101, 1, 3.8, 'Very Good'),
(2, 102, 1, 3.2, 'Good'),
(3, 103, 1, 3.9, 'Excellent'),
(4, 104, 2, 3.5, 'Good'),
(5, 105, 2, 3.1, 'Satisfactory');

----------------------------------------------------------------------------------------
-------------------------------CRUD Queries---------------------------------------------
----------------------------------------------------------------------------------------

--READ (SELECT) – Data Retrieval--

 --a. Get all students in Section A1
SELECT StudentID, FirstName, LastName, SectionID
FROM STUDENTS
WHERE SectionID = 'A1';

--b. View all assignments for Classroom 301
SELECT AssignmentID, Title, DueDate
FROM ASSIGNMENTS
WHERE ClassroomID = 301;

--c. Get student marks for a specific assignment
SELECT M.StudentID, ST.FirstName, ST.LastName, M.Score
FROM MARKS M
JOIN STUDENTS ST ON M.StudentID = ST.StudentID
WHERE M.AssignmentID = 101;


--d. See attendance record for a student
SELECT A.Date, A.Status, C.Title AS Classroom
FROM ATTENDANCE A
JOIN CLASSROOMS C ON A.ClassroomID = C.ClassroomID
WHERE A.StudentID = 101;

--UPDATE – Modify Records--

--a. Update a student's contact information
UPDATE STUDENTS
SET Contact = '03005554444'
WHERE StudentID = 101;

--b. Extend an assignment deadline
UPDATE ASSIGNMENTS
SET DueDate = '2025-03-10'
WHERE AssignmentID = 101;

--c. Change a student’s GPA in RESULTS
UPDATE RESULTS
SET GPA = 3.95, Remarks = 'Excellent!'
WHERE StudentID = 101;

--DELETE – Remove Records--

--a. Delete a student record
--Delete related data first--
DELETE FROM ENROLLMENTS WHERE StudentID = 113;
DELETE FROM SUBMISSIONS WHERE StudentID = 113;
DELETE FROM ATTENDANCE WHERE StudentID = 113;
DELETE FROM MARKS WHERE StudentID = 113;
DELETE FROM RESULTS WHERE StudentID = 113;
-- Now safe to delete the student
DELETE FROM STUDENTS WHERE StudentID = 113;

--b. Delete a submission
DELETE FROM SUBMISSIONS
WHERE SubmissionID = 1005;

--c. Delete a course assignment (e.g., in case it was reassigned)
DELETE FROM COURSE_ASSIGNMENTS
WHERE AssignmentID = 2;

----------------------------------------------------------------------------------------
-------------------------------Stored Procedures---------------------------------------------
----------------------------------------------------------------------------------------

-- 1. Add a New Student
CREATE PROCEDURE AddStudent
    @StudentID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Contact VARCHAR(20),
    @StudentMail VARCHAR(100),
    @StudentPassword VARCHAR(100),
    @Address VARCHAR(200),
    @SectionID VARCHAR(10)
AS
BEGIN
    INSERT INTO STUDENTS (StudentID, FirstName, LastName, Contact, StudentMail, StudentPassword, Address, SectionID)
    VALUES (@StudentID, @FirstName, @LastName, @Contact, @StudentMail, @StudentPassword, @Address, @SectionID);
END;
GO

-- 2. Get Student Marks by Student ID
CREATE PROCEDURE GetStudentMarks
    @StudentID INT
AS
BEGIN
    SELECT M.MarkID, A.Title AS Assignment, M.Score, C.Title AS Classroom
    FROM MARKS M
    JOIN ASSIGNMENTS A ON M.AssignmentID = A.AssignmentID
    JOIN CLASSROOMS C ON M.ClassroomID = C.ClassroomID
    WHERE M.StudentID = @StudentID;
END;
GO

-- 3. Update Assignment Due Date
CREATE PROCEDURE UpdateAssignmentDueDate
    @AssignmentID INT,
    @NewDueDate DATE
AS
BEGIN
    UPDATE ASSIGNMENTS
    SET DueDate = @NewDueDate
    WHERE AssignmentID = @AssignmentID;
END;
GO

-- 4. Delete a Student (with related data)
CREATE PROCEDURE DeleteStudent
    @StudentID INT
AS
BEGIN
    DELETE FROM ENROLLMENTS WHERE StudentID = @StudentID;
    DELETE FROM SUBMISSIONS WHERE StudentID = @StudentID;
    DELETE FROM ATTENDANCE WHERE StudentID = @StudentID;
    DELETE FROM MARKS WHERE StudentID = @StudentID;
    DELETE FROM RESULTS WHERE StudentID = @StudentID;
    DELETE FROM STUDENTS WHERE StudentID = @StudentID;
END;
GO

-- 5. Add Course Assignment
CREATE PROCEDURE AddCourseAssignment
    @AssignmentID INT,
    @CourseID INT,
    @FacultyID INT,
    @SectionID VARCHAR(10),
    @AdminID INT,
    @Semester VARCHAR(20)
AS
BEGIN
    INSERT INTO COURSE_ASSIGNMENTS (AssignmentID, CourseID, FacultyID, SectionID, AdminID, Semester)
    VALUES (@AssignmentID, @CourseID, @FacultyID, @SectionID, @AdminID, @Semester);
END;
GO

-- 6. Add New Faculty
CREATE PROCEDURE AddFaculty
    @FacultyID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Contact VARCHAR(20),
    @FacultyMail VARCHAR(100),
    @FacultyPassword VARCHAR(100),
    @Address VARCHAR(200)
AS
BEGIN
    INSERT INTO FACULTY (FacultyID, FirstName, LastName, Contact, FacultyMail, FacultyPassword, Address)
    VALUES (@FacultyID, @FirstName, @LastName, @Contact, @FacultyMail, @FacultyPassword, @Address);
END;
GO

-- 7. Add Result Entry
CREATE PROCEDURE AddResult
    @ResultID INT,
    @StudentID INT,
    @AdminID INT,
    @GPA FLOAT,
    @Remarks VARCHAR(200)
AS
BEGIN
    INSERT INTO RESULTS (ResultID, StudentID, AdminID, GPA, Remarks)
    VALUES (@ResultID, @StudentID, @AdminID, @GPA, @Remarks);
END;
GO

-- 8. Get Result By Student
CREATE PROCEDURE GetResultByStudent
    @StudentID INT
AS
BEGIN
    SELECT R.ResultID, R.GPA, R.Remarks, A.StaffName
    FROM RESULTS R
    JOIN ADMINS A ON R.AdminID = A.AdminID
    WHERE R.StudentID = @StudentID;
END;
GO

-- 9. Create a Classroom
CREATE PROCEDURE CreateClassroom
    @ClassroomID INT,
    @CourseID INT,
    @FacultyID INT,
    @SectionID VARCHAR(10),
    @Title VARCHAR(100)
AS
BEGIN
    INSERT INTO CLASSROOMS (ClassroomID, CourseID, FacultyID, SectionID, Title)
    VALUES (@ClassroomID, @CourseID, @FacultyID, @SectionID, @Title);
END;
GO

-- 10. Get Classroom Info
CREATE PROCEDURE GetClassroomInfo
    @ClassroomID INT
AS
BEGIN
    SELECT C.ClassroomID, C.Title, CO.CourseName, F.FirstName + ' ' + F.LastName AS FacultyName, S.SectionName
    FROM CLASSROOMS C
    JOIN COURSES CO ON C.CourseID = CO.CourseID
    JOIN FACULTY F ON C.FacultyID = F.FacultyID
    JOIN SECTIONS S ON C.SectionID = S.SectionID
    WHERE C.ClassroomID = @ClassroomID;
END;
GO



--CREATE DATABASE CheckpointDDL_Insaf;
--or use if database already exists
USE CheckpointDDL_Insaf;
GO

--create tables
if object_id ('dbo.Department', 'U') is null 
BEGIN
CREATE TABLE Department (
    Num_S INT PRIMARY KEY,
    Label VARCHAR(255) NOT NULL,
    Manager_Name VARCHAR(255) NOT NULL
);
END
go

if object_id ('dbo.Employee', 'U') is null 
BEGIN
CREATE TABLE Employee (
    Num_E INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Position VARCHAR(255) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL CHECK (Salary >= 0),
    Department_Num_S INT,
    FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S) ON DELETE SET NULL
);
END

go

if object_id ('dbo.Project', 'U') is null 
BEGIN
CREATE TABLE Project (
    Num_P INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Start_Date DATE NOT NULL,
    End_Date DATE NOT NULL,
    Department_Num_S INT,
    FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S) ON DELETE SET NULL
);
--add a constraint by logic that the start date should be before the end date
ALTER TABLE Project
ADD CONSTRAINT chk_project_dates CHECK (End_Date >= Start_Date);

END

go



if object_id ('dbo.Employee_Project', 'U') is null 
BEGIN
CREATE TABLE Employee_Project (
    Employee_Num_E INT,
    Project_Num_P INT,
    Role VARCHAR(255) NOT NULL,
    PRIMARY KEY (Employee_Num_E, Project_Num_P),
    FOREIGN KEY (Employee_Num_E) REFERENCES Employee(Num_E) ON DELETE CASCADE,
    FOREIGN KEY (Project_Num_P) REFERENCES Project(Num_P) ON DELETE CASCADE
);
END

go



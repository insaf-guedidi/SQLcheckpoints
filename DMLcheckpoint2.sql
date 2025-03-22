

--inserting into tables has to follow an order to avoid this error message: 'The INSERT statement conflicted with the FOREIGN KEY constraint etc.'

select * from Department
-- Insert into Department table
INSERT INTO Department (Num_S, Label, Manager_Name) VALUES
(1, 'IT', 'Alice Johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');

select * from Employee
-- Insert into Employee table
INSERT INTO Employee (Num_E, Name, Position, Salary, Department_Num_S) VALUES
(101, 'John Doe', 'Developer', 60000.00, 1),
(102, 'Jane Smith', 'Analyst', 55000.00, 2),
(103, 'Mike Brown', 'Designer', 50000.00, 3),
(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);

select * from Project
-- Insert into Project table
INSERT INTO Project (Num_P, Title, Start_Date, End_Date, Department_Num_S) VALUES
(201, 'Website Redesign', '2024-01-15', '2024-06-30', 1),
(202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
(203, 'Market Research', '2024-02-01', '2024-07-31', 3),
(204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);

select * from Employee_Project
-- Insert into Employee_Project table
INSERT INTO Employee_Project (Employee_Num_E, Project_Num_P, Role) VALUES
(101, 201, 'Frontend Developer'),
(104, 201, 'Backend Developer'),
(102, 202, 'Trainer'),
(105, 202, 'Coordinator'),
(103, 203, 'Research Lead'),
(101, 204, 'Network Specialist');

select * from Employee_Project
--update the table
UPDATE Employee_Project
SET Role = 'Full Stack Developer'
WHERE Employee_Num_E = 101 AND Project_Num_P = 201;

select * from Employee_Project
-- Delete from Employee_Project table first (otherwise it will be deleted automatically)
DELETE FROM Employee_Project
WHERE Employee_Num_E = 103;

select * from Employee
-- Then delete from Employee table
DELETE FROM Employee
WHERE Num_E = 103;

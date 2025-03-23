
-----Insaf DQL checkpoint --------

--1. Employees assigned to more than one project
SELECT 
    E.Name,
    COUNT(EP.Project_Num_P) AS Total_Projects
FROM 
    Employee E
INNER JOIN 
    Employee_Project EP ON E.Num_E = EP.Employee_Num_E
GROUP BY 
    E.Name
HAVING 
    COUNT(EP.Project_Num_P) > 1;


--2. Projects managed by each department (with label and manager name)
SELECT 
    D.Label AS Department_Label,
    D.Manager_Name,
    P.Title AS Project_Title
FROM 
    Department D
INNER JOIN 
    Project P ON D.Num_S = P.Department_Num_S;


--3. Employees working on "Website Redesign" with their roles
	SELECT 
    E.Name,
    EP.Role,
	P.Title
FROM 
    Employee E
INNER JOIN 
    Employee_Project EP ON E.Num_E = EP.Employee_Num_E
INNER JOIN 
    Project P ON EP.Project_Num_P = P.Num_P
WHERE 
    P.Title = 'Website Redesign';


--4. Department with the highest number of employees
	SELECT TOP 1
    D.Label AS Department_Label,
    D.Manager_Name,
    COUNT(E.Num_E) AS Total_Employees
FROM 
    Department D
INNER JOIN 
    Employee E ON D.Num_S = E.Department_Num_S
GROUP BY 
    D.Label, D.Manager_Name
ORDER BY 
    Total_Employees DESC;


-- 5. Employees earning more than 60,000
SELECT 
    E.Name,
    E.Position,
    D.Label AS Department_Name,
	 E.Salary
FROM 
    Employee E
INNER JOIN 
    Department D ON E.Department_Num_S = D.Num_S
WHERE 
    E.Salary > 60000;


--6. Number of employees per project
	SELECT 
    P.Title AS Project_Title,
    COUNT(EP.Employee_Num_E) AS Number_of_Employees
FROM 
    Project P
INNER JOIN 
    Employee_Project EP ON P.Num_P = EP.Project_Num_P
GROUP BY 
    P.Title;


--7. Summary of roles employees have across projects
SELECT 
    E.Name AS Employee_Name,
    P.Title AS Project_Title,
    EP.Role
FROM 
    Employee E
INNER JOIN 
    Employee_Project EP ON E.Num_E = EP.Employee_Num_E
INNER JOIN 
    Project P ON EP.Project_Num_P = P.Num_P;


--8. Total salary expenditure per department
SELECT 
    D.Label AS Department_Label,
    D.Manager_Name,
    SUM(E.Salary) AS Total_Salary_Expenditure
FROM 
    Department D
INNER JOIN 
    Employee E ON D.Num_S = E.Department_Num_S
GROUP BY 
    D.Label, D.Manager_Name;

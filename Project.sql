-- Schemes--
CREATE TABLE Projects (
    ProjectID INT IDENTITY(1,1) PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE Employees (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(100),
    Department VARCHAR(50),
    ProjectID INT FOREIGN KEY REFERENCES Projects(ProjectID)
);

-- Queries--

INSERT INTO Projects (ProjectName, StartDate, EndDate)
VALUES ('Project Alpha', '2023-01-01', '2023-06-30'),
       ('Project Beta', '2023-02-15', '2023-08-15');

INSERT INTO Employees (FullName, Department, ProjectID)
VALUES ('Γιάννης Κυριαζής', 'Sales', 1),
       ('Μαρία Γεροκο', 'IT', 1),
       ('Κώστας Παπαδόπουλος', 'Finance', 2);


SELECT e.FullName, e.Department, p.ProjectName
FROM Employees e
LEFT JOIN Projects p ON e.ProjectID = p.ProjectID;


UPDATE Employees
SET Department = 'IT'
WHERE EmployeeID = 3;


DELETE FROM Employees
WHERE EmployeeID = 1;


SELECT * FROM Employees;

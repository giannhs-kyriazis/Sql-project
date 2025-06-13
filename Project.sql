/*  Schema Sql  */

CREATE TABLE Departments (
    DepartmentID SERIAL PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT REFERENCES Departments(DepartmentID),
    HireDate DATE
);

CREATE TABLE Projects (
    ProjectID SERIAL PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);



/*  Queries  */


INSERT INTO Departments (DepartmentName) VALUES ('Sales'), ('IT'), ('Finance');
SELECT * FROM Departments;

INSERT INTO Employees (FirstName, LastName, DepartmentID, HireDate)
VALUES ('Γιάννης', 'Κυριαζής', 1, '2022-01-15'),
       ('Μαρία', 'Γεροκο', 2, '2021-07-10');

SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID;

SELECT d.DepartmentName, COUNT(e.EmployeeID) AS NumEmployees
FROM Departments d
LEFT JOIN Employees e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;

UPDATE Employees SET DepartmentID = 3 WHERE EmployeeID = 1;

DELETE FROM Employees WHERE EmployeeID = 2;

SELECT * FROM Employees;
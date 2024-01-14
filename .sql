--Question 1: Show the first five thousand employees in the employees table
SELECT *
FROM Employees
LIMIT 5000;

--Question 2: Display all employee first names in alphabetical order
SELECT EmployeeFirstName
FROM Employees
ORDER BY EmployeeFirstName;

--Question 3: Show employees who have worked at the University the shortest amount of time
SELECT *
FROM Employees
ORDER BY yearHired ASC
LIMIT 20;

--Question 4: Display the names of all employees whose age is a palindrome
SELECT EmployeeFirstName, EmployeeLastName
FROM Employees
WHERE SUBSTRING(birthyear, 1, 1) = SUBSTRING(birthyear, 4, 1)
   AND SUBSTRING(birthyear, 2, 1) = SUBSTRING(birthyear, 3, 1);

--Question 5: Write a query to display all male and female employees who were not born in 1993 and who will not receive a performance bonus
SELECT *
FROM Employees
WHERE (Gender = 'M' OR Gender = 'F')
  AND birthyear != '1993'
  AND PerformanceBonus = 'F';

--Question 6: Is there anything in this database that you would improve? If no, explain why. If yes, what would you change and why? 
-- Improvements to the Database:
-- While the current database design adequately represents the structure of the University of Australia's (UoA) employee information, there are a few considerations for potential improvements.

-- 1. Normalization: Databases can reduce redundancy and improve data integrity through further normalization. For instance, having a separate table for employee personal details, such as birthdate and gender, could enhance the overall structure.

-- 2. Additional Tables: Introducing tables for additional information, such as employee contact details or academic qualifications, could provide a more comprehensive view of employee profiles without overloading the existing tables.

-- 3. Indexing: To optimize query performance, consider implementing indexes on columns that are commonly used in search and retrieval operations.

-- 4. Foreign key constraints: Use foreign key constraints to maintain referential integrity between tables and improve the reliability of relationships within the database.

-- These suggestions aim to enhance the overall efficiency, maintainability, and completeness of the database.

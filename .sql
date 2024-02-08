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

-----------------------------------------------------------------------------------------------------------------------------------------

-- Question 1: Add a new attribute called "EmployeeInitials" to the Employees table
ALTER TABLE Employees
ADD COLUMN EmployeeInitials VARCHAR(5);

--Question 2: Display the first names of all employees who work in the department located in Sydney
SELECT E.EmployeeFirstName
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
WHERE D.Location = 'Sydney';

--Question 3: Display employee first and last names and work out the original salary for all employees and their new salary after their (10%) bonus is applied
SELECT
    EmployeeFirstName,
    EmployeeLastName,
    S.Salary AS OriginalSalary,
    ROUND(S.Salary * 1.1, 2) AS NewSalary
FROM
    Employees E
JOIN
    SalaryClass S ON E.SalaryID = S.SalaryID;

--Question 4: Display how many employees will not receive a performance bonus
SELECT COUNT(*) AS NoBonusCount
FROM Employees
WHERE PerformanceBonus = 'F';

--Question 5: Write a query that returns the employees with initials that are a palindrome and also return employees without palindrome initials, but output 'not a palindrome!' 
SELECT
    EmployeeFirstName,
    EmployeeLastName,
    CONCAT(LEFT(EmployeeFirstName, 1), LEFT(EmployeeLastName, 1)) AS EmployeeInitials,
    CASE
        WHEN CONCAT(LEFT(EmployeeFirstName, 1), LEFT(EmployeeLastName, 1)) = REVERSE(CONCAT(LEFT(EmployeeFirstName, 1), LEFT(EmployeeLastName, 1)))
        THEN 'Palindrome'
        ELSE 'Not a palindrome!'
    END AS PalindromeStatus
FROM Employees;

--Question 6: Write a query that populates EmployeeInitials, based off the existing stored names
UPDATE Employees
SET EmployeeInitials = CONCAT(LEFT(EmployeeFirstName, 1), LEFT(EmployeeLastName, 1));


--Question 7: Which joins did you use in your queries and why? Would other joins have worked?

-- In the questions, I utilized INNER JOINs to consolidate information from two tables in light of a predefined condition. In particular, I used INNER JOINs in Question 2 to show the first names of employees in the Sydney-based department, and in Question 3, I showed the first and last names of employees along with their old and new salaries.
-- The decision of INNER JOIN depends on your desired suspicion to recover just the lines where there is a match in the two tables in light of the predetermined condition. For instance, Being referred to 2, just representatives who work in the division situated in Sydney will be remembered for the outcome set.
-- Different sorts of joins might have been utilized relying upon the necessities:
-- LEFT JOIN (or LEFT OUTER JOIN): This would incorporate all columns from the left table (Workers) and the matching lines from the right table (Divisions). In the event that there is no match, Invalid qualities will be returned for sections from the right table.
-- Right join, also known as right outer join: Similar to LEFT JOIN, but includes all matching rows from both the right and left tables.
-- FULL JOIN (or FULL External JOIN): This includes all rows from both tables, with columns with no match having NULL values.


--Question 8: Write 250 words explaining the integrity of this database. Is it up to standards? If yes, explain why and how. If no, what is wrong with the database's integrity?

-- Database integrity refers to the accuracy, consistency, and reliability of the data stored in the database. For the University of Australia (UoA) database, completeness can be assessed based on several factors.
-- Foreign Key Constraints: An important aspect of database integrity is the use of foreign key constraints to enforce referential integrity between tables. In the provided schema, the DepartmentID and SalaryID columns of the Employees table are foreign keys that point to DepartmentID of the Departments table and SalaryID of the SalaryClass table. This ensures that relationships between employees, departments, and pay grades are maintained, contributing to overall database integrity.
-- Data types and constraints: Define appropriate data types and constraints for columns. Other actions, such as enforcing NOT NULL and UNIQUE constraints, also contribute to database integrity. For example, the Gender column has a restriction that only allows values ​​of M, F, or O, ensuring that only valid gender values ​​are stored.
-- Normalization: Normalization is the process of organizing data to minimize redundancy and is a key element in maintaining data integrity. The provided database schema appears to be normalized, but there may be opportunities for further normalization to eliminate potential redundancies.
-- Data validation: The database could benefit from additional data validation mechanisms that ensure that only valid and consistent information is stored. For example, we might introduce limits on annual ranges for birthdays and enlistment dates.
-- In summary, UoA databases have good integrity standards through the use of foreign key constraints, appropriate data types, and normalization. However, continued monitoring and improvement, such as implementing additional data validation measures, can further improve overall database integrity.


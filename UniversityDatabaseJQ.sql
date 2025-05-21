--University Database - Join Queries
use university;
--1. Display the department ID, name, and the full name of the faculty managing it. 
select * from Department;
select * from Faculty;
select D.Department_ID , D.D_Name , F.Name from Department D, Faculty F where F.Department_ID = D.Department_ID;

--2. Display each program's name and the name of the department offering it.
select * from Department;
select * from Course;

Select  D.D_Name as 'Department Name' , C.Course_Name as 'Course Name' from Department D , Course C where C.Department_ID = D.Department_ID;

--3. Display the full student data and the full name of their faculty advisor.
select * from Student;
select * from Faculty;
SELECT S.* , F.Name as 'faculty advisor'from Student S , Faculty F where S.F_ID =F.F_ID;

--4. Display class IDs, course titles, and room locations for classes in buildings 'A' or 'B'. 
select * from Course;

-- select Course_ID , Course_Name , Room from Course where Location = 'A' or 'B'

--5. Display full data about courses whose titles start with "I" (e.g., "Introduction to..."). 
select Course_Name from Course where Course_Name like 'I%';

--6. Display names of students in program ID 3 whose GPA is between 2.5 and 3.5. 
-- select S.Fname +' '+ S.Lname as ' Student Name ' from Student S ,Course C where C.Course_ID = 3 and GPA Between 2.5 and 3.5 ;

--7. Retrieve student names in the Engineering program who earned grades ≥ 90 in the "Database" course. 
-- select S.Fname +' '+ S.Lname as ' Student Name ' from Student S  , Course C where C.Course_Name='Database' and grade >= 90 

--8. Find names of students who are advised by "Dr. Ahmed Hassan". 
--select  S.Fname +' '+ S.Lname as ' Student Name ' from Student S where 
SELECT S.Fname +' '+ S.Lname as ' Student Name ' , F.Name as 'faculty advisor'from Student S , Faculty F where F.Name= 'Dr. Ahmed Hassan'

--9. Retrieve each student's name and the titles of courses they are enrolled in, ordered by course title. 

select * from Student;
select * from Course;

select S.Fname +' ' +S.Lname as 'Student Name' , C.Course_Name as 'Course Name ' from Student S ,Course C where C.S_ID = S.S_ID order by Course_Name

--10.  For each class in Building 'Main', retrieve class ID, course name, department name, and faculty name teaching the class. 
select * from Student;
select * from Course;
select * from Faculty;
select S.Fname +' ' +S.Lname as 'Student Name' , C.Course_Name as 'Course Name ', D.D_Name as 'Department Name ' from Student S 
inner join Course C  ON C.S_ID = S.S_ID
inner join Faculty F  ON F.F_ID = S.F_ID
inner join Department D on D.Department_ID =F.Department_ID


--11.  Display all faculty members who manage any department. 
select * from Faculty;
select * from Department;

SELECT F.* FROM Faculty F , Department D WHERE D.Department_ID = F.Department_ID ;

--12.  Display all students and their advisors' names, even if some students don’t have advisors yet.
select * from Student;
select * from Faculty;

SELECT S.* , F.Name as 'advisors name' FROM Student S LEFT OUTER JOIN Faculty F ON F.F_ID = S.F_ID;



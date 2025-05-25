-- Library Database – JOIN Queries 
use LibraryDB;

-- 1. Display library ID, name, and the name of the manager. 
select L.L_ID,L.Library_Name from Library L inner join Staff S on S.L_ID = L.L_ID

-- 2. Display library names and the books available in each one. 
select L.Library_Name , B.Title from Library L inner join Book LB on L.L_ID=LB.L_ID
inner join Book B on B.B_ID= LB.B_ID


-- 3. Display all member data along with their loan history. 
select M.* , L.* from Member M inner join Loan L on M.M_ID = L.M_ID

-- 4. Display all books located in 'Zamalek' or 'Downtown'. 
select * from Book
select * from Member
select * from Library
select B.* from Book B inner join Member M on M.M_ID =B.M_ID inner join Library L on L.L_ID = M.M_ID where L.location IN ('Zamalek', 'Downtown')


-- 5. Display all books whose titles start with 'T'. 
select B.* from Book B where b.Title like 'T%'

-- 6. List members who borrowed books priced between 100 and 300 LE. 
select M.* from Member M inner join Book B on B.M_ID = M.M_ID where B.Price between 100 and 300;

-- 7. Retrieve members who borrowed and returned books titled 'The Alchemist'. 
select M.* from Member M inner join Book B on B.M_ID= M.M_ID where B.Title ='The Alchemist'

-- 8. Find all members assisted by librarian "Sarah Fathy". 
select * from Staff
--select M.* from Member M inner join Staff S on S.M_ID= M.M_ID where B.Title ='The Alchemist'

-- 9. Display each member’s name and the books they borrowed, ordered by book title. 
SELECT m.FName,b.Title FROM Member m inner join Book b ON b.B_ID = b.B_ID ORDER BY b.Title;

-- 10.  For each book located in 'Cairo Branch', show title, library name, manager, and shelf info. 
SELECT 
    b.Title,
    l.Library_Name,
    s.FName AS manager_name,
    b.Shelf_Location
FROM 
    Book b
JOIN 
    Library l ON b.L_ID = l.L_ID
JOIN 
    Staff s ON l.manager_id = s.staff_id
WHERE 
    l.branch_name = 'Cairo Branch';

-- 11.  Display all staff members who manage libraries. 
SELECT s.Staff_ID,s.FName FROM Staff s inner join Library l ON s.staff_id = l.manager_id;

-- 12.  Display all members and their reviews, even if some didn’t submit any review yet. 

SELECT M.M_ID,M.FName + ' '+ M.LName as 'Member Name ',RB.Comments, RB.Rating
FROM Member M LEFT JOIN Review RB ON m.M_ID = RB.M_ID;
-- Hotel Database – JOIN Queries 
use hotel
-- 1. Display hotel ID, name, and the name of its manager. 
 
 select B.Branch_ID as ' Hotel ID ' , B.B_Name as ' Hotel Name ' from Branch B inner join Staff S on S.S_ID = B.S_ID

-- 2. Display hotel names and the rooms available under them. 

select B.B_Name as ' Hotel Name ', R.Room_Number  from Branch B Left outer join Room R on R.Branch_ID = B.Branch_ID 

-- 3. Display guest data along with the bookings they made. 
select * from booking
select C.* from Customer C Right outer join Booking B on B.C_ID =C.C_ID

-- 4. Display bookings for hotels in 'Hurghada' or 'Sharm El Sheikh'. 

SELECT B.*,Br.B_Name,Br.Location FROM Booking B
inner join Branch Br ON Br.S_ID = B.S_ID
WHERE Br.Location IN ('Hurghada', 'Sharm El Sheikh');

-- 5. Display all room records where room type starts with "S" (e.g., "Suite", "Single"). 

select * from Room where R_Type like 'S%'

-- 6. List guests who booked rooms priced between 1500 and 2500 LE. 

--select C.C_Name from Customer C inner join Room R on R.C_ID = C.C_ID where R.Price between 1500 and 2500; 

-- 7. Retrieve guest names who have bookings marked as 'Confirmed' in hotel "Hilton Downtown". 

 select C.C_Name from Customer C inner join Booking B on B.C_ID = C.C_ID 
 inner join Room R on R.C_ID = C.C_ID
 inner join Branch Br on Br.Branch_ID = R.Branch_ID
 where B.Booking_ID = 'Confirmed' and Br.B_Name = 'Hilton Downtown'

-- 8. Find guests whose bookings were handled by staff member "Mona Ali". 
select * from Staff
select * from Booking
select * from Customer
select C.C_Name from Customer C 
inner join Booking B on B.C_ID = C.C_ID 
inner join Staff S on S.S_ID = B.S_ID
where S_Name = 'Hassan Al-Habsi'



-- 9. Display each guest’s name and the rooms they booked, ordered by room type. 

select C.C_Name  from Customer C inner join Room R on R.C_ID= C.C_ID order by R.R_Type

-- 10.  For each hotel in 'Cairo', display hotel ID, name, manager name, and contact info. 

SELECT B.Branch_ID,B.B_Name,S.S_Name AS 'Manager Name ',S.Job_Title
FROM Branch B inner join Staff S ON B.S_ID = S.S_ID
WHERE B.Location = 'Cairo';

-- 11.  Display all staff members who hold 'Manager' positions. 

select * from Staff where Job_Title = 'Branch Manager'

-- 12.  Display all guests and their reviews, even if some guests haven't submitted any reviews.

-- SELECT C.C_ID,C.C_Name,C.Email,R.rating FROM Customer C LEFT JOIN Reviews R ON C.C_ID = R.C_ID;

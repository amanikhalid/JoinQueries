--Airline Database – JOIN Queries
use Airline;
--1. Display each flight leg's ID, schedule, and the name of the airplane assigned to it. 
select * from FlightLeg;
select * from Airport;
select F.Leg_No ,  F.Scheduled_dep_time ,  F.Scheduled_arr_time, A.Name from FlightLeg F inner join Airport A on A.Airport_Code=F.Airport_Code

--2. Display all flight numbers and the names of the departure and arrival airports. 
select * from FlightLeg;
select * from Airport;
select * from Flight
select * from LegInstance;

select F.Number as 'flight numbers' , A.Name as  'departure_airport' , A.Name as 'arrival_airport' from Flight F 
inner join  FlightLeg FL on F.Number = FL.Number
inner join Airport A on A.Airport_Code = F.Number

--3. Display all reservation data with the name and phone of the customer who made each booking. 
select * from Reservation;

select LegDate as 'Reservation Data', Customer_Name as 'Customer Name' , CPhone as 'Customer Phone' from Reservation;

--4. Display IDs and locations of flights departing from 'CAI' or 'DXB'. 
select * from Flight
-- select Number as ' Flight ID ', Location  from Flight where Departing from 'CAI' or 'DXB'

--5. Display full data of flights whose names start with 'A'. 
select * from Flight where Airline like 'A%'

--6. List customers who have bookings with total payment between 3000 and 5000. 
-- select Customer_Name as 'Customer Name'  from Reservation where Total between 3000 and 5000;

--7. Retrieve all passengers on 'Flight 110' who booked more than 2 seats. 
select * from Flight
select * from Reservation
select * from LegInstance
select * from Seats

select R.Customer_Name as 'Customer Name'  from Reservation R inner join Seats S on S.Seat_No = R.Seat_No
inner join LegInstance L on L.LegDate = R.LegDate
inner join FlightLeg FL on FL.Leg_No = L.Leg_No
inner join Flight F on F.Number = FL.Number 
where S.Seat_No > 2 ;

--8. Find names of passengers whose booking was handled by agent "Youssef Hamed". 
--  select Customer_Name as 'Customer Name'  from Reservation 

--9. Display each passenger’s name and the flights they booked, ordered by flight date. 
select R.Customer_Name as 'Customer Name' , F.Airline from Reservation R inner join LegInstance L on L.LegDate = R.LegDate
inner join FlightLeg FL on Fl.Leg_No =L.Leg_No
inner join Flight F on F.Number=Fl.Number
order by L.LegDate


--10.  For each flight departing from 'Cairo', display the flight number, departure time, and airline name. 
SELECT F.Number,FL.Scheduled_dep_time,A.Name FROM Flight F
inner join FlightLeg FL ON F.Number = F.Number
inner join Airport A ON FL.Airport_Code = A.Airport_Code
WHERE A.Name = 'Cairo';

--11.  Display all staff members who are assigned as supervisors for flights. 
--SELECT s.staff_id,s.staff_name,s.role FROM Staff s inner join Flights f ON s.staff_id = f.supervisor_id;


--12.  Display all bookings and their related passengers, even if some bookings are unpaid.
-- SELECT b.booking_id,b.paid,p.passenger_id,p.passenger_name FROM Bookings b LEFT JOIN Passengers p ON b.passenger_id = p.passenger_id;


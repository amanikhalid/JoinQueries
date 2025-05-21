-- Bank Database – JOIN Queries 
use Banking;
-- 1. Display branch ID, name, and the name of the employee who manages it. 

select * from Employee
Select * from Branch

select B.Branch_ID , B.Branch_ID , E.Name from  Branch B inner join Employee E on B.Branch_ID = E.Branch_ID

-- 2. Display branch names and the accounts opened under each. 

select * from Employee
Select * from Branch

-- select B.Branch_ID , B.Branch_Address  from  Branch B inner join Customer C on B.Branch_ID = C.Branch_ID inner join 
-- 3. Display full customer details along with their loans. 
select * from Loan
select * from Customers
select C.* from Customers C inner join Loan L on L.Customer_ID = C.Customer_ID

-- 4. Display loan records where the loan office is in 'Alexandria' or 'Giza'. 

Select L.* from Loan L where L.LType in ('Personal' ,'Education');

-- 5. Display account data where the type starts with "S" (e.g., "Savings"). 

select * from Accounts where AType like 'S%'

-- 6. List customers with accounts having balances between 20,000 and 50,000. 

select C.* from Customers C inner join Accounts A on A.Customer_ID = C.Customer_ID where A.Balance between 200 and 500;

-- 7. Retrieve customer names who borrowed more than 100,000 LE from 'Cairo Main Branch'. 

-- select C.CName from Customer C inner join Accounts A on A.Customer_ID = C.Customer_ID where A.Balance > 100 and B.Branch_Address= 'Cairo Main Branch'

-- 8. Find all customers assisted by employee "Amira Khaled". 

select C.* from Customers C inner join Employee E on E.Employee_ID = C.Employee_ID  where C.Name = 'Amira Khaled'

-- 9. Display each customer’s name and the accounts they hold, sorted by account type. 

select C.Name as 'Customer Name' ,A.Account_Number as 'Account Number' from Customers C inner join Accounts A on A.Customer_ID = C.Customer_ID order by A.AType

-- 10.  For each loan issued in Cairo, show loan ID, customer name, employee handling it, and branch name. 

SELECT L.Loan_ID, C.Name, E.Name AS handled_by,b.Branch_ID
FROM Loan L inner join Customers C ON L.customer_id = C.customer_id
inner join Employee E ON L.employee_id = E.employee_id
inner join Branch B ON L.Loan_ID = B.branch_id
WHERE B.Branch_ID = 'Cairo';

-- 11.  Display all employees who manage any branch. 

--SELECT E.Employee_ID,E.E_Name FROM Employee E inner join Branch B ON E.Employee_ID = B.Manager_id;

-- 12.  Display all customers and their transactions, even if some customers have no transactions yet.

-- SELECT C.Customer_ID,C.CName,T.Transactions_ID,T.amount,T.T_Date FROM Customer C LEFT JOIN Transactions T ON C.Customer_ID = T.Customer_ID;
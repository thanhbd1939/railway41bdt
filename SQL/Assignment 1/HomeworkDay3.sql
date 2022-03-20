SELECT * FROM testing_system_assignment_1.department; 					-- Q2
select DepartmentID from Department where DepartmentName ='Sale';       -- Q3 
Select * From Account;
select Max(length(Fullname)) From Account;   							-- Q4 
Select * From Account where Length(FullName) = (select Max(length(Fullname)) From Account where DepartmentID=2) and DepartmentID=2; -- Q5
Select * from `group`;
Select GroupName From `Group` Where createdate < '2019-12-20'; 			-- Q6
Select * from Answer;  													-- Q7 chưa làm được groupby và count
Select * From exam;
select Code From Exam where Duration >= 60 and CreateDate < '2019-12-20';  -- Q8
Select * From `Group` order by createdate DESC Limit 5;						-- Q9
Select* From Department;
Select * From account;
SELECT count(departmentid) from Account where AccountID = 2;
SELECT count(departmentid) from Account where DepartmentID = 2;  			-- Q10
Select Username from account where username like 'D%o';						-- Q11
SET SQL_SAFE_UPDATES = 0;
Delete from Exam where CreateDate <'2019-12-20'; 							-- Q12
-- Q13 chưa làm được
update Account 
    set Fullname = 'Nguyen Ba Loc' , Email = 'loc.nguyenba@vti.com.vn'
    where AccountID = 5;													-- Q14
select * From Groupaccount;
Update GroupAccount 
set AccountID = 5 where groupID = 4;										-- Q15


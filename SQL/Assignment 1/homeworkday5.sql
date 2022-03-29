SELECT * FROM testing_system_assignment_1.group;
-- Q1 Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
create view member_sale as
select a.*,d.departmentname from account a join department d on a.departmentid = d.departmentid
where d.departmentname = 'sale'
group by a.AccountID;
drop view if exists member_sale;


-- Q2
 create view MAX_acount_in_group as
 select a.*,count(*) from account as a join groupaccount as ga on a.AccountID=ga.AccountID group by a.AccountID
having count(*)=(select max(SL) from (
select accountid,count(*) as SL from groupaccount group by AccountID) as gamax);


-- Q3: Tạo view có chứa câu hỏi có những content quá dài (content quá 10 từ được coi là quá dài) và xóa nó đi
create view short_content as
select * from question where length(content) < 10
group by QuestionID; 
create view long_content as
select * from question where length(content) > 10
group by QuestionID;
drop view if exists long_content; 

-- Q4 Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
create view MAX_account_in_department2 as
 select d.*,count(*) from department d join account a on d.DepartmentID=a.departmentID group by d.DepartmentID
having count(*)=(select max(SL) from (
select accountid,count(*) as SL from account group by Departmentid) as amax);
-- Q5 Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
create view Questions_by_user_Nguyen as
select q.questionID,q.content, a.username from question q join account a on a.accountid = q.creatorid -- creatorid khoá ngoại với accountid chưa fix
where a.username = "%nguyen%"; -- chưa chạy 
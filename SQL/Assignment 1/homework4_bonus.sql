SELECT * FROM testing_system_assignment_1.account;
Select a.Username, a.DepartmentID , d.departmentName 
From Account a
Inner join Department d on a.DepartmentID = d.DepartmentID;																-- Q1
 
Select * From `Account` where CreateDate < '2010-12-20';																-- Q2
 
Select * From `Account` a
Left join position p on a.PositionID = p.positionID where p.positionName = 'dev'; 										-- Q3

select * from Account;
select d.departmentName, count(a.departmentID) as sl
from `account` a
Inner join Department d on a.departmentid = d.departmentid group by a.departmentid having count(a.departmentid) >3;		 -- Q4

Select q.* from (
select max(CQ) as max_count, questionid from (select count(Questionid) as CQ, questionID from examquestion group by questionID) as temp) as temp1
join question q on q.questionID = temp1.questionID;																		-- Q5

SELECT cq.CategoryName, count(q.CategoryID) 
FROM categoryquestion cq
JOIN question q ON cq.CategoryID = q.CategoryID
GROUP BY q.CategoryID;															-- Q6

select count(*), q.content from question q
join examquestion eq on eq.questionID=q.questionid 
group by eq.examquestionID;														-- Q7


-- Lấy ra Question có nhiều câu trả lời nhất
select * from 	
(select max(co),questionid from 
(select count(*) as co, questionID from Answer an group by questionID) as temp) temp1
join question q on q.questionID = temp1.questionid;								-- Q8


-- Thống kê số lượng account trong mỗi group
select count(Ga.AccountID) sl, G.groupID from groupaccount GA join `group` g on Ga.groupID  = g.groupID group by g.groupID; -- Q9 


-- Tìm chức vụ có ít người nhất
select * from
(select min(co),PositionID from ( select count(*) as co, PositionID from account acc group by positionID) as temp) as temp1
join position p on p.PositionID = temp1.positionID;								-- Q10

select position.positionname,a.*
from (select positionID, min(SL) 
from (select positionID,count(*) as SL from `account`
group by positionID) a) a
join position on  a.positionId=position.positionID; 							-- Q10


Select d.departmentName as ten_phong_ban, p.positionName as ten_chuc_vu, 
    count(*) as soluong
    from account a
    join department d on a.departmentID = d.departmentID
    join position p on a.positionID = p.positionID
    group by a.departmentID , a.positionID 
    order by a.departmentID asc, a.positionID asc; -- Q11
-- Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT Q.QuestionID, Q.Content, TQ.TypeName as TypeQuestion, a.Content as RightAnswer FROM question Q
JOIN categoryquestion CQ ON Q.CategoryID = CQ.CategoryID
JOIN typequestion TQ ON Q.TypeID = TQ.TypeID
JOIN Answer AS a ON Q.QuestionID = a.QuestionID;  -- chưa đặt creatorid làm khoá ngoại với accoutid -- Q12
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
select count(q.typeID) as SL, q.TypeID,tq.Typename from question Q
join typequestion Tq on q.TypeID = Tq.TypeID
Group by q.questionID;
-- Question 14:Lấy ra group không có account nào
Select ga.groupID,ga.accountID, g.groupname from groupaccount ga
join `group` g on g.groupID = ga.groupid
where ga.accountID is null; 
-- Question 15: Lấy ra group không có account nào
-- Question 16: Lấy ra question không có answer nào
select a.*,q.Content from answer a
join question q on a.QuestionID = q.QuestionID
where a.isCorrect is null;

SELECT q.content FROM question q
RIGHT JOIN answer a on a.QuestionID = q.QuestionID
WHERE a.iscorrect IS NULL; -- test
-- QQuestion 17: a) Lấy các account thuộc nhóm thứ 1
select * from account where departmentID = 5
union
select * from account where PositionID = 2; -- q17
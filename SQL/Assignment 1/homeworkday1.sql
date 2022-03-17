CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
CREATE TABLE Department(
DepartmentID int primary key,
DepartmentName Varchar(50)
);
CREATE TABLE `Position`(
PositionID int primary key,
PositionName Enum('dev','test','pm')
);
CREATE TABLE Account(
AccountID tinyint primary key auto_increment,
Email Varchar(100), -- unique key,
UserName Varchar(50),  -- not null,
FullName Varchar(50),
DepartmentID int,
foreign key (DepartmentID) references Department(DepartmentID),
PositionID int,
foreign key (PositionID) references `Position`(PositionID),
CreateDate Date -- datetime default now()
-- check age (>=18)
);
Alter table Account add constraint unique_email unique key(Email) ;
Alter table Account modify UserName varchar(50) not null;
alter table Account modify CreateDate Datetime default now();
CREATE TABLE `Group` (
GroupID int primary key auto_increment,
GroupName Varchar(50),
CreatorID int,
CreateDate Date
);
CREATE TABLE GROUPACCOUNT(
GroupID int,
foreign key (GroupID) references `Group` (GroupID),
AccountID tinyint,
foreign key (AccountID) references Account(AccountID),
JoinDate Date
);
Alter table Groupaccount modify GroupID int primary key;
Alter table Groupaccount modify JoinDate Datetime Default now();
CREATE TABLE TypeQuestion(
TypeID int primary key auto_increment,
TypeName enum('Essay','Multiple-choice')
);
CREATE TABLE CategoryQuestion(
CategoryID int primary key auto_increment,
CategoryName enum('Java','.NET','SQL','Postman','Ruby')
);
CREATE TABLE Question(
QuestionID int auto_increment primary key,
Content varchar(100),
CategoryID int,
foreign key (CategoryID) references CategoryQuestion(CategoryID),
TypeID int,
foreign key (TypeID) references TypeQuestion(TypeID),
CreatorID int,
CreateDate Date
);
CREATE TABLE Answer(
AnswerID int primary key auto_increment,
Content varchar(100),
QuestionID int,
foreign key (QuestionID) references Question(QuestionID),
isCorrect enum('Yes','No')
);
CREATE TABLE Exam(
ExamID int primary key auto_increment,
Code int,
Title varchar(50),
CategoryID int,
Duration time,
CreatorID int,
CreateDate Date
);
CREATE TABLE ExamQuestion(
ExamID int,
foreign key (ExamID) references Exam(ExamID),
QuestionID int,
foreign key (QuestionID) references Question(QuestionID)
);
alter table Examquestion add foreign key (ExamID) references Exam(ExamID); 
alter table Examquestion modify ExamID int primary key;
alter table examquestion add foreign key (QuestionID) references Question(QuestionID);
	drop database Testing_System_Assignment_1;
    
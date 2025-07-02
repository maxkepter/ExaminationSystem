-- Tạo mới database (xóa DB cũ nếu cần)
IF DB_ID('ExamManagement') IS NOT NULL
BEGIN
    ALTER DATABASE ExamManagement SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE ExamManagement;
END

CREATE DATABASE ExamManagement;
GO

USE ExamManagement;
GO

-- Tạo bảng User
CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Role INT NOT NULL
);


-- LogStatus master table
CREATE TABLE LogStatus (
    StatusId INT PRIMARY KEY,
    Status VARCHAR(100) NOT NULL
);

-- LoginInfo lưu thông tin đăng nhập
CREATE TABLE LoginInfo (
    UserID INT PRIMARY KEY,
    UserName VARCHAR(255) UNIQUE NOT NULL,
    PassWord VARCHAR(255) NOT NULL,
    StatusId INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (StatusId) REFERENCES LogStatus(StatusId)
);

-- Nhật ký đăng nhập
CREATE TABLE LoginLog (
    LogId INT IDENTITY(1,1) PRIMARY KEY,
    Time DATETIME NOT NULL,
    UserID INT NOT NULL,
    StatusId INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (StatusId) REFERENCES LogStatus(StatusId)
);

-- Nhật ký cấm tài khoản
CREATE TABLE BanLog (
    LogId INT IDENTITY(1,1) PRIMARY KEY,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    UserID INT NOT NULL,
    StatusId INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID),
    FOREIGN KEY (StatusId) REFERENCES LogStatus(StatusId)
);

-- Subject
CREATE TABLE Subject (
    SubID INT PRIMARY KEY,
    SubjectName NVARCHAR(100) NOT NULL,
    IsDisable BIT NOT NULL DEFAULT 0 CHECK (IsDisable IN (0,1))
);



-- Chapter
CREATE TABLE Chapter (
    ChapterID INT PRIMARY KEY,
    ChapterNo INT NOT NULL,
    SubID INT NOT NULL,
    IsDisable BIT NOT NULL DEFAULT 0 CHECK (IsDisable IN (0,1)),
    FOREIGN KEY (SubID) REFERENCES Subject(SubID)
);

-- Student
CREATE TABLE Student (
    UserID INT PRIMARY KEY,
    StudentCode VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

-- Admin
CREATE TABLE Admin (
    UserID INT PRIMARY KEY,
    AdminCode VARCHAR(50) UNIQUE NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);

-- Major
CREATE TABLE Major (
    MajorId INT PRIMARY KEY,
    MajorName NVARCHAR(100) NOT NULL,
    IsDisable BIT NOT NULL DEFAULT 0 CHECK (IsDisable IN (0,1))
);

-- SubjectMajor
CREATE TABLE SubjectMajor (
    MajorId INT NOT NULL,
    SubID INT NOT NULL,
    PRIMARY KEY (MajorId, SubID),
    FOREIGN KEY (MajorId) REFERENCES Major(MajorId),
    FOREIGN KEY (SubID) REFERENCES Subject(SubID)
);

-- Exam
CREATE TABLE Exam (
    ExamID INT PRIMARY KEY,
    ExamCode VARCHAR(50) UNIQUE NOT NULL,
    ExamName NVARCHAR(100) NOT NULL,
    ExamDate DATETIME NOT NULL,
    Deadline DATETIME NOT NULL,
    Duration INT NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (UserID) REFERENCES [User](UserID)
);



-- Question
CREATE TABLE Question (
    QuestionId INT PRIMARY KEY,
    QuestionContent NVARCHAR(MAX) NOT NULL,
    Difficulty INT NOT NULL,
    ChapterID INT NOT NULL,
    IsDisable BIT NOT NULL DEFAULT 0 CHECK (IsDisable IN (0,1)),
    FOREIGN KEY (ChapterID) REFERENCES Chapter(ChapterID)
);





-- QuestionOption
CREATE TABLE QuestionOption (
    OptionId INT PRIMARY KEY,
    OptionContent NVARCHAR(MAX) NOT NULL,
    IsCorrect BIT NOT NULL DEFAULT 0 CHECK (IsCorrect IN (0,1)),
    QuestionId INT NOT NULL,
    FOREIGN KEY (QuestionId) REFERENCES Question(QuestionId)
);


-- StudentExam
CREATE TABLE StudentExam (
    StudentExamID INT IDENTITY(1,1) PRIMARY KEY,
    ExamID INT NOT NULL,
    UserID INT NOT NULL,
    StartTime DATETIME NOT NULL,
    SubmitTime DATETIME NOT NULL,
    ExamStatus INT NOT NULL DEFAULT 0,
    Score FLOAT NOT NULL,
    ExamDetail NVARCHAR(MAX) NOT NULL CHECK (ISJSON(ExamDetail) = 1),
    StudentChoice NVARCHAR(MAX) NOT NULL CHECK (ISJSON(StudentChoice) = 1),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (UserID) REFERENCES Student(UserID)
);

-- ExamLog
CREATE TABLE ExamLog (
    ExamLogId INT IDENTITY(1,1) PRIMARY KEY,
    StudentExamID INT NOT NULL,
    Time DATETIME NOT NULL,
    Information VARCHAR(255) NOT NULL,
    FOREIGN KEY (StudentExamID) REFERENCES StudentExam(StudentExamID)
);

-- QuestionExam
CREATE TABLE QuestionExam (
    ExamID INT NOT NULL,
    QuestionId INT NOT NULL,
    PRIMARY KEY (ExamID, QuestionId),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY (QuestionId) REFERENCES Question(QuestionId)
);

---------------------------------------------------
-- Dữ liệu mẫu
---------------------------------------------------

INSERT INTO Subject (SubID, SubjectName, IsDisable) VALUES
(1, 'Toán học', 0),
(2, 'Vật lý', 0),
(3, 'Hóa học', 0),
(4, 'Sinh học', 0),
(5, 'Lịch sử', 0);

 INSERT INTO Chapter (ChapterID, ChapterNo, SubID, IsDisable) VALUES
(1, 1, 1, 0),  -- Chương 1 của Toán học
(2, 2, 1, 0),
(3, 1, 2, 0),  -- Chương 1 của Vật lý
(4, 2, 2, 0),
(5, 1, 3, 0);  -- Chương 1 của Hóa học

-- Dữ liệu mẫu Exam (giả định UserID = 1 đã tồn tại)
DECLARE @i INT = 1;

WHILE @i <= 5
BEGIN
    INSERT INTO Exam (
        ExamID, Duration, ExamDate, Deadline,
        ExamCode, ExamName, UserID
    )
    VALUES (
        @i,
        60,
        GETDATE(),
        DATEADD(DAY, 1, GETDATE()),
        CONCAT('EXAM-', FORMAT(@i, '000')),
        CONCAT('Đề thi số ', @i),
        1
    );

    SET @i = @i + 1;
END;

-- Dữ liệu mẫu Question + Option
SET @i = 1;
DECLARE @questionId INT = 1;
DECLARE @optionId INT = 1;

WHILE @i <= 100
BEGIN
    INSERT INTO Question (QuestionId, QuestionContent, IsDisable, Difficulty, ChapterID)
    VALUES (@questionId, CONCAT('Câu hỏi số ', @i, ' - Nội dung giả lập'), 0, (@i % 3) + 1, 1);

    DECLARE @j INT = 1;
    WHILE @j <= 4
    BEGIN
        INSERT INTO QuestionOption (OptionId, OptionContent, IsCorrect, QuestionId)
        VALUES (
            @optionId,
            CONCAT('Lựa chọn ', @j, ' cho câu hỏi ', @i),
            CASE WHEN @j = 1 THEN 1 ELSE 0 END,
            @questionId
        );

        SET @optionId = @optionId + 1;
        SET @j = @j + 1;
    END;

    SET @questionId = @questionId + 1;
    SET @i = @i + 1;
END;

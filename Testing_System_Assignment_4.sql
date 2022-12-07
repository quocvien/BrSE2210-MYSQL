
-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ

SELECT * 
FROM `account` a
INNER JOIN department d ON d.DepartmentID = a.DepartmentID;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010

SELECT * FROM `account` WHERE CreatedDate > '2010-12-20';

-- Question 3: Viết lệnh để lấy ra tất cả các developer

SELECT * FROM `account` WHERE PositionID IN(1, 2);

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên

SELECT d.DepartmentID, d.DepartmentName, COUNT(a.AccountID) as totalMember
FROM `account` a
INNER JOIN department d ON d.DepartmentID = a.DepartmentID
GROUP BY d.DepartmentID
HAVING totalMember > 3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất

SELECT q.Content, COUNT(eq.QuestionID) as socauhoi
FROM `examquestion` eq
JOIN question q ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID
HAVING socauhoi = (SELECT MAX(total) FROM (SELECT COUNT(eq.QuestionID) as total
FROM `examquestion` eq
JOIN question q ON q.QuestionID = eq.QuestionID
GROUP BY q.QuestionID) as bannhap);

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question

SELECT q.CategoryID, COUNT(q.CategoryID) as soquestion
FROM `categoryquestion` ca
INNER JOIN question q ON q.CategoryID = ca.CategoryID
GROUP BY q.CategoryID
;

-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam

SELECT eq.QuestionID, q.Content, COUNT(eq.QuestionID) as soluongexam
FROM `examquestion` eq
INNER JOIN question q ON q.QuestionID = eq.QuestionID
GROUP BY eq.QuestionID
;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất

SELECT q.Content, COUNT(an.QuestionID) as socautraloi
FROM `answer` an
JOIN question q ON q.QuestionID = an.QuestionID
GROUP BY q.QuestionID
HAVING socautraloi = (SELECT MAX(total) FROM (SELECT COUNT(an.QuestionID) as total
FROM `answer` an
JOIN question q ON q.QuestionID = an.QuestionID
GROUP BY q.QuestionID) as bannhap);

-- Question 9: Thống kê số lượng account trong mỗi group

-- Question 10: Tìm chức vụ có ít người nhất

SELECT p.Positionname, COUNT(a.positionid) as totalMember
FROM `account` a
JOIN position p ON p.positionid = a.positionid
GROUP BY p.PositionID
HAVING totalMember = (SELECT MIN(total) FROM (SELECT COUNT(a.positionid) as total
FROM `account` a
JOIN position p ON p.positionid = a.positionid
GROUP BY p.PositionID) as temp_table);

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
-- Question 14:Lấy ra group không có account nào

SELECT g.GroupID, g.GroupName
FROM `groupaccount` ga
RIGHT JOIN `group` g ON g.GroupID = ga.GroupID
WHERE ga.AccountID IS NULL
;

-- Question 15: Lấy ra group không có account nào

SELECT g.GroupID, g.GroupName
FROM `groupaccount` ga
RIGHT JOIN `group` g ON g.GroupID = ga.GroupID
WHERE ga.AccountID IS NULL
;
-- Question 16: Lấy ra question không có answer nào

SELECT q.QuestionID, q.Content
FROM `answer` an
RIGHT JOIN `question` q ON q.QuestionID = an.QuestionID
WHERE an.AnswerID IS NULL
;

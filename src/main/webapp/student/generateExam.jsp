<%-- 
    Document   : generateExam
    Created on : Jun 10, 2025, 1:35:53 AM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate Exam</title>
</head>
<body>
    <h2>Nhập cấu hình đề thi</h2>
    <form action="GenerateExam" method="post">
        <div>
            <label>Chapter No:</label>
            <select name="chapterNo">
                <option value="1">Chapter 1</option>
                <option value="2">Chapter 2</option>
                <option value="3">Chapter 3</option>
                <!-- Thêm chương khác nếu cần -->
            </select>
        </div>

        <div>
            <label>Difficulty:</label>
            <select name="difficulty">
                <option value="1">Dễ</option>
                <option value="2">Trung bình</option>
                <option value="3">Khó</option>
            </select>
        </div>

        <div>
            <label>Amount:</label>
            <select name="amount">
                <option value="1">1 câu</option>
                <option value="2">2 câu</option>
                <option value="5">5 câu</option>
                <option value="10">10 câu</option>
                <option value="15">15 câu</option>
                <option value="20">20 câu</option>
            </select>
        </div>

        <br>
        <button type="submit">Tạo đề</button>
    </form>
</body>
</html>
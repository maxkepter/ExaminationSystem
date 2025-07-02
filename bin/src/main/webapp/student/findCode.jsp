<%-- 
    Document   : findCode
    Created on : May 31, 2025, 7:18:20 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.exam.Exam" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Tìm kiếm đề thi</title>
    </head>
    <body>
        <h2>Tìm kiếm đề thi</h2>

        <form method="post" action="${pageContext.request.contextPath}/ExamServlet">
            <input type="hidden" name="action" value="search"/>
            Mã đề thi: <input type="text" name="examCode" required>
            <input type="submit" value="Tìm kiếm">
        </form>

        <!-- Kiểm tra xem examResult có tồn tại không -->
        <c:if test="${not empty exam}">
            <h3>Thông tin đề thi:</h3>
            <ul>
                <li><strong>Mã đề:</strong> ${exam.examCode}</li>
                <li><strong>Tên đề thi:</strong> ${exam.examName}</li>
                <li><strong>Thời gian làm bài:</strong> ${exam.duration} phút</li>
                <li><strong>Người tạo:</strong> ${exam.user.lastName}</li>
                <a href="DoExam?examId=${exam.examID}">
                    <button>Do Exam</button>
                </a>
            </ul>
        </c:if>




    </body>
</html>

<%-- 
    Document   : view_exam
    Created on : Jun 10, 2025, 10:49:36 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Exam</title>
    </head>
    <body>
        <h1>View Exam</h1>
        <h2>Exam search</h2>
        <c:if test="${not empty error}">
            <strong>${error}</strong>
        </c:if>
        <form method="post" action="${pageContext.request.contextPath}/ExamServlet">
            <input type="hidden" name="action" value="search"/>
            Exam Code: <input type="text" name="examCode" required>
            <input type="submit" value="Tìm kiếm">
        </form> 

        <!-- Kiểm tra xem examResult có tồn tại không -->
        <c:if test="${not empty exam}">
            <h3>Thông tin đề thi:</h3>
            <ul>
                <li><strong>Exam code:</strong> ${exam.examCode}</li>
                <li><strong>Exam name:</strong> ${exam.examName}</li>
                <li><strong>Exam duration:</strong> ${exam.duration} Min</li>
                <li><strong>Deadline:</strong> ${exams.deadline}</li>
                <a href="DoExam?examId=${exam.examID}">
                    <button>Do Exam</button>
                </a>
            </ul>
        </c:if>

    </body>
</html>

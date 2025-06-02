<%-- 
    Document   : findCode
    Created on : May 31, 2025, 7:18:20 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.exam.Exam" %>
<%@ page import="model.exam.ExamInstance" %>
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
    <c:if test="${not empty examResult}">
        <h3>Thông tin đề thi:</h3>
        <ul>
            <li><strong>Mã đề:</strong> ${examResult.examCode}</li>
            <li><strong>Tên đề thi:</strong> ${examResult.exam.examName}</li>
            <li><strong>Thời gian làm bài:</strong> ${examResult.exam.duration} phút</li>
            <li><strong>Người tạo:</strong> ${examResult.exam.user.lastName}</li>
        </ul>
    </c:if>

   


</body>
</html>

<%-- 
    Document   : examcreation1
    Created on : Jun 3, 2025, 2:33:05 AM
    Author     : MasterLong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is where you create the exam</h1>
    <c:choose>
        <c:when test="${not empty user}">
            <p class="welcome-text">
                Welcome, <strong>${user.firstName} ${user.lastName}</strong>!
            </p>
        </c:when>
    </c:choose>
    <form action="${pageContext.request.contextPath}/HandleExamCreation1" method="get">
        Tên đề thi <input type="text" name="examName">
        Thời gian (phút) <input type="number" name="duration" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
        <input type="submit" name="submit" value="Bắt đầu tạo bài kiểm tra">
    </form>
        <a class="btn " href="${pageContext.request.contextPath}/adminhome">Go Back</a>
</body>
</html>

<%-- 
    Document   : viewallexam
    Created on : Jun 3, 2025, 3:37:46 PM
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
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <p class="welcome-text">
                    Welcome, <strong>${user.firstName} ${user.lastName}</strong>!
                </p>
            </c:when>
        </c:choose>
        <h1>This is all exam</h1>
        <ul>
            <c:forEach var="exam" items="${exams}" varStatus="status">
                <li >
                    <form action="${pageContext.request.contextPath}/HandleUpdateAndDeleteExam" method="post" style="display: grid; grid-template-columns: repeat(7, 1fr); gap: 1%;">
                        <span>${status.index + 1}</span> <!-- 1-based count -->
                        <input type ="hidden" name="id" value="${exam.examID}">
                        <input type="text" name="examName" value="${exam.examName}">
                        <input type="number" name="duration" value="${exam.duration}">
                        <input type ="text" value="${exam.user.lastName}" disabled="true">
                        <input type ="text" value="${exam.examCode}" disabled="true">
                        <input type="submit" name="update" value="Update">
                        <input type="submit" name="delete" value="Delete">
                    </form>
                </li>
            </c:forEach>
        </ol>


</body>
</html>

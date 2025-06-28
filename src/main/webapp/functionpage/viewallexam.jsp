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
                    <form action="${pageContext.request.contextPath}/HandleViewAllExam" method="get" style="display: grid; grid-template-columns: repeat(8, 1fr); gap: 1%;">
                        <span>${status.index + 1}</span> <!-- 1-based count -->
                        <input type ="hidden" name="id" value="${exam.examID}">
                        <input type="text" name="examName" value="${exam.examName}">
                        <input type="number" name="duration" value="${exam.duration}">
                        <input type ="text" value="${exam.user.lastName}" readonly="true" disabled="true">
                        <input type ="text" name="examCode" value="${exam.examCode}" readonly="true">
                        <input type="submit" name="update" value="Update">
                        <input type="submit" name="delete" value="Delete">
                        <input type="submit" name="viewDetail" value="View Detail">
                    </form>
                </li>
            </c:forEach>
            <a href="${pageContext.request.contextPath}/adminhome">Go back</a> 
        </ul>


</body>
</html>

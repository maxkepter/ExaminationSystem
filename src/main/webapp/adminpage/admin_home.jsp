<%-- 
    Document   : admin_home
    Created on : Jun 2, 2025, 11:31:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Home</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <h1>Welcome Admin!</h1>

            <div class="card">
                <c:choose>
                    <c:when test="${not empty user}">
                        <p class="welcome-text">
                            Welcome, <strong>${user.firstName} ${user.lastName}</strong>!
                        </p>
                        
                        <a class="btn" href="Logout">Logout</a>
                        <a class="btn " href="UserProfile">UserProfile</a>
                        <a class="btn " href="functionpage/examcreation1.jsp">Create Exam</a>
                        <a class="btn " href="${pageContext.request.contextPath}/toViewAllExam">View Exam</a>
                        <a class="btn " href="functionpage/questioncreation.jsp">Create Question</a>
                        <a class="btn " href="functionpage/examlist.jsp">Major Management</a>
                        <a class="btn " href="functionpage/examlist.jsp">Subject Management</a>
                        <a class="btn " href="${pageContext.request.contextPath}/toSubjectAndChapterCreation">Subject Creation</a>
                        <a class="btn " href="${pageContext.request.contextPath}/toViewAllQuestion">View all Question</a>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </body>
</html>
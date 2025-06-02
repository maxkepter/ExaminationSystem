<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="model.user.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="UTF-8" />
        <title>Welcome Page</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <h1>Hello World!</h1>

            <div class="card">
                <c:choose>
                    <c:when test="${not empty user}">
                        <p class="welcome-text">
                            Welcome, <strong>${user.firstName} ${user.lastName}</strong>!
                        </p>
                        <a class="btn" href="Logout">Logout</a>
                    </c:when>
                    <c:otherwise>
                        <p>Test</p>
                        <a class="btn" href="login.jsp">Login</a>
                        <a class="btn btn-secondary" href="Register">Register</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
</html>

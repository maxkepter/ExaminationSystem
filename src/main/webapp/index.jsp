<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="model.user.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="UTF-8" />
        <title>Welcome Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
            <style>
                /* Override background for dynamic path */
                body {
                    background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
                        url("https://s14.gifyu.com/images/bxI4U.gif") no-repeat center center;
                    background-size: cover;
                    background-attachment: fixed;
                }
            </style>
    </head>
    <body>
        <!-- Navigation Bar -->
        <nav class="navbar">
            <div class="nav-container">
                <div class="nav-brand">
                    🎓 Examination System
                </div>

                <div class="nav-menu">
                    <c:choose>
                        <c:when test="${not empty user}">
                            <p class="welcome-text">
                                Welcome, <strong>${user.firstName} ${user.lastName}</strong>!
                            </p>
                            <a class="btn btn-success" href="UserProfile">My Profile</a>
                            <a class="btn btn-primary" href="student/view_exam">View Exam</a>
                            <a class="btn btn-danger" href="Logout">Logout</a>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-primary" href="login.jsp">Login</a>
                            <a class="btn btn-secondary" href="Register">Register</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <div class="welcome-card">
                <c:choose>
                    <c:when test="${not empty user}">
                        <h1>Dashboard</h1>
                        <p>Welcome back! You can access your profile, view available exams, or logout using the navigation menu above.</p>
                    </c:when>
                    <c:otherwise>
                        <h1>Welcome to EduSystem</h1>
                        <p>Your comprehensive educational platform. Please login to access your account or register if you're new to our system.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            © 2025 Exam Management System. All rights reserved.
        </div>
    </body>
</html>
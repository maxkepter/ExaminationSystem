<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="model.user.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="UTF-8" />
        <title>Welcome Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/chatbot.css">
            <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
                <style>
                    /* Override background for dynamic path */
                    body {
                        background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
                            url("img/background.jpg") no-repeat center center;
                        background-size: cover;
                        background-attachment: fixed;
                    }
                </style>
                <script>
                    const contextPath = "${pageContext.request.contextPath}";
                </script>

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
                            <a class="btn btn-primary" href="Login">Login</a>
                            <a class="btn btn-secondary" href="adminlogin">Admin Login</a>
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

                    <!-- Nút bật chat -->
                    <div id="chat-toggle" ><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="-3 -5 30 30" stroke-width="1" stroke="currentColor" class="size-6">
                            <path stroke-linecap= "round" stroke-linejoin="round" d="M7.5 8.25h9m-9 3H12m-9.75 1.51c0 1.6 1.123 2.994 2.707 3.227 1.129.166 2.27.293 3.423.379.35.026.67.21.865.501L12 21l2.755-4.133a1.14 1.14 0 0 1 .865-.501 48.172 48.172 0 0 0 3.423-.379c1.584-.233 2.707-1.626 2.707-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0 0 12 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018Z" />
                        </svg>

                    </div>

                    <!-- Hộp chat -->
                    <div id="chatbox" >
                        <div id="chat-header">
                            thieunangtakhongthengu
                        </div>
                        <div id="chat-messages">
                            <p><strong>Bot:</strong> Xin chào! Tôi có thể giúp gì?</p>
                        </div>
                        <div id="chat-input-area">
                            <input type="text" id="user-input" placeholder="Nhập tin nhắn..." />
                            <button id="send-btn">Gửi</button>
                        </div>
                    </div>



                    <!-- Footer -->
                    <div class="footer" style="background-color: white;color: black ">
                        © 2025 Exam Management System. All rights reserved.
                    </div>
                    <script src="${pageContext.request.contextPath}/js/chatBot.js" ></script>


                </body>


                </html>
<%-- 
    Document   : user_Info
    Created on : May 30, 2025, 8:06:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User info</title>
    </head>
    <body>
        <div class="content">
            <div class="sidebar">
                <a href="UserProfile">User Profile</a> <a href="ExamHistory">View
                    Exam History</a> <a href="ChangePassword">Change Password</a> <a
                    href="Logout">Logout</a>
            </div>
            <div class="main-content">
                <h1>User info</h1>
                <form action="UserProfile" method="post">
                    <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <input type="text" id="firstName" name="firstName" value="${user.firstName}" required />
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <input type="text" id="lastName" name="lastName" value="${user.lastName}" required />
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="text" id="email" name="email" value="${user.email}" required />
                    </div>
                    

                    <c:if test="${not empty error}">
                        <div style="color: red;">${error}</div>
                    </c:if>


                    <div class="form-group">
                        <button type="submit" id="submitChange">Update</button>
                    </div>
                </form>

            </div>
        </div>
    </body>
</html>

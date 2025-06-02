<%-- 
    Document   : change_password
    Created on : May 30, 2025, 6:14:14 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="content">
            <div class="sidebar">
                <a href="UserProfile">User Profile</a> <a href="OrderHistory">View
                    Exam History</a> <a href="ChangePassword">Change Password</a> <a
                    href="Logout">Logout</a>
            </div>
            <div class="main-content">
                <h1>Change Password</h1>
                <form action="ChangePassword" method="post">
                    <div class="form-group">
                        <label for="currentPassword">Current Password:</label>
                        <input type="password" id="currentPassword" name="currentPassword"  required />
                    </div>
                    <div class="form-group">
                        <label for="newPassword">New Password:</label>
                        <input type="password" id="newPassword" name="newPassword" required />
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm New Password:</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required />
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

<%-- 
    Document   : change_password
    Created on : Jun 3, 2025, 1:00:00 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password - FPT University</title>
        <link rel="stylesheet" type="text/css" href="css/user_info.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <!-- Navbar -->
        <div class="navbar">
            <div class="navbar-left">
                <a href="Home" class="logo">🎓 EXAMINATION SYSTEM</a>
                <span class="school-name"></span>
            </div>
                <div class="navbar-right">
                    <span><i class="fa fa-user"></i> <strong>${user.firstName} ${user.lastName}</strong></span>
                    <img src="https://cmshn.fpt.edu.vn/theme/image.php/trema/core/1697438386/u/f2" 
                         class="userpicture defaultuserpic" 
                         width="35" height="35" 
                         role="presentation" 
                         aria-hidden="true"
                         alt="User Avatar">
                </div>
            </div>

            <!-- Main Content -->
            <div class="content">
                <!-- Sidebar Navigation -->
                <div class="sidebar">
                    <a href="UserProfile"><i class="fa fa-user"></i> User Profile</a>
                    <a href="ExamHistory"><i class="fa fa-history"></i> View Exam History</a>
                    <a href="ChangePassword" class="active"><i class="fa fa-lock"></i> Change Password</a>
                    <a href="Logout"><i class="fa fa-sign-out-alt"></i> Logout</a>
                </div>

                <!-- Main Content Area -->
                <div class="main-content">
                    <div class="form-container">
                        <h1><i class="fa fa-key"></i> Change Password</h1>

                        <!-- Success Message -->
                        <c:if test="${not empty success}">
                            <div class="success">
                                <i class="fa fa-check-circle"></i> ${success}
                            </div>
                        </c:if>

                        <!-- Error Message -->
                        <c:if test="${not empty error}">
                            <div class="error">
                                <i class="fa fa-exclamation-triangle"></i> ${error}
                            </div>
                        </c:if>

                        <form action="ChangePassword" method="post">
                            <div class="form-group">
                                <label for="currentPassword"><i class="fa fa-lock"></i> Current Password:</label>
                                <input type="password" 
                                       id="currentPassword" 
                                       name="currentPassword" 
                                       placeholder="Enter your current password"
                                       required />
                            </div>

                            <div class="form-group">
                                <label for="newPassword"><i class="fa fa-key"></i> New Password:</label>
                                <input type="password" 
                                       id="newPassword" 
                                       name="newPassword" 
                                       placeholder="Enter your new password"
                                       minlength="6"
                                       required />
                            </div>

                            <div class="form-group">
                                <label for="confirmPassword"><i class="fa fa-check"></i> Confirm New Password:</label>
                                <input type="password" 
                                       id="confirmPassword" 
                                       name="confirmPassword" 
                                       placeholder="Confirm your new password"
                                       minlength="6"
                                       required />
                            </div>

                            <div class="form-group">
                                <button type="submit" id="submitChange">
                                    <i class="fa fa-save"></i> Update Password
                                </button>
                            </div>
                        </form>

                        </body>
                        </html>
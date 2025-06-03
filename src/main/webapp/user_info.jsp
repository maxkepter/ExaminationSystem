<%-- 
    Document   : user_info
    Created on : May 30, 2025, 8:06:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Info - FPT University</title>
        <link rel="stylesheet" type="text/css" href="css/style2.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <!-- Navbar -->
        <div class="navbar">
            <div class="navbar-left">
                <img src="img/maxresdefault.jpg" alt="FPT University Logo" class="logo">
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
                <a href="UserProfile" class="active"><i class="fa fa-user"></i> User Profile</a>
                <a href="ExamHistory"><i class="fa fa-history"></i> View Exam History</a>
                <a href="ChangePassword"><i class="fa fa-lock"></i> Change Password</a>
                <a href="Logout"><i class="fa fa-sign-out-alt"></i> Logout</a>
            </div>

            <!-- Main Content Area -->
            <div class="main-content">
                <div class="form-container">
                    <h1><i class="fa fa-user-edit"></i> User Information</h1>

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

                    <form action="UserProfile" method="post">
                        <div class="form-group">
                            <label for="firstName"><i class="fa fa-user"></i> First Name:</label>
                            <input type="text" 
                                   id="firstName" 
                                   name="firstName" 
                                   value="${user.firstName}" 
                                   placeholder="Enter your first name"
                                   required />
                        </div>

                        <div class="form-group">
                            <label for="lastName"><i class="fa fa-user"></i> Last Name:</label>
                            <input type="text" 
                                   id="lastName" 
                                   name="lastName" 
                                   value="${user.lastName}" 
                                   placeholder="Enter your last name"
                                   required />
                        </div>

                        <div class="form-group">
                            <label for="email"><i class="fa fa-envelope"></i> Email:</label>
                            <input type="email" 
                                   id="email" 
                                   name="email" 
                                   value="${user.email}" 
                                   placeholder="Enter your email address"
                                   required />
                        </div>

                        <div class="form-group">
                            <button type="submit" id="submitUpdate">
                                <i class="fa fa-save"></i> Update Information
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
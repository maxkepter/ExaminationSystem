<%-- 
    Document   : admin_login
    Created on : Jun 2, 2025, 11:31:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    <% String error = (String) request.getAttribute("error"); %>
    </head>
    <body>
        <div class="container">
        <div class="login-card">
            <form action="AdminLogin" method="post">
                <h1 class="form-title">Admin Login</h1>

                <label for="username">Username</label>
                <input type="text" id="username" name="username" required />

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required />

                <% if (error != null) { %>
                    <div class="error"><%= error %></div>
                <% } %>

                <input type="submit" value="Login" class="btn" />
            </form>

        </div>
    </div>
    </body>
</html>

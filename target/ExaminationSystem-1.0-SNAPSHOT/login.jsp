<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.lang.String" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <% String error = (String) request.getAttribute("error"); %>
</head>
<body>
    <div class="container">
        <div class="login-card">
            <form action="Login" method="post">
                <h1 class="form-title">Login</h1>

                <label for="username">Username</label>
                <input type="text" id="username" name="username" required />

                <label for="password">Password</label>
                <input type="password" id="password" name="password" required />

                <% if (error != null) { %>
                    <div class="error"><%= error %></div>
                <% } %>

                <input type="submit" value="Login" class="btn" />
            </form>

            <div class="register-link">
                <p>New user? <a href="register.jsp">Register here</a></p>
                <a href="asstrox.html">Forget password?</a>
            </div>
        </div>
    </div>
</body>
</html>

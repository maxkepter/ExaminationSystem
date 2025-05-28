<%-- 
    Document   : login
    Created on : May 28, 2025, 3:27:06 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
         <%  
        String error=(String)request.getAttribute("error");        
        %>
    </head>
    <body>
    <div class="container">    
        <div class="login-container"> <form action="Login" method="post">
        <h1>Login Page</h1>
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required><br><br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>
             <% if (error != null) { %>
                    <div style="color: red;"><%= error %></div>
                    <% } %>
            <input type="submit" value="Login"></form></div>
        <div class="register-container">
            <h2>New User?</h2>
            <p><a href="register.jsp">Register here</a></p>
        </div>
    </div>
        
       
    </body>
</html>

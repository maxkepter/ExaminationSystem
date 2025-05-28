<%-- 
    Document   : register
    Created on : May 28, 2025, 4:26:07 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <%  
        String error=(String)request.getAttribute("error");        
        %>
    </head>
    <body>
        <div class="contaiter"><div class="register-container">
                <h1>Register Page</h1>
                <form action="Resgister" method="post">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="userName" required><br><br>                
                    <label for="First Name">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required><br><br>
                    <label for="Last Name">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required><br><br>
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required><br><br>
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required><br><br>
                    <% if (error != null) { %>
                    <div style="color: red;"><%= error %></div>
                    <% } %>
                    <input type="submit" value="Register">
                    </div></div>
                    </body>
                    </html>

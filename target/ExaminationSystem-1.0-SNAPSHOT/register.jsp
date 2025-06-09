<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Register</title>
        <link rel="stylesheet" type="text/css" href="css/style1.css">

        <%
            String error = (String) request.getAttribute("error");
        %>
    </head>
    <body>
        <div class="container">
            <div class="register-container">
                <h1>Register Page</h1>
                <form action="Register" method="post">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="userName" required><br>

                    <label for="firstName">First Name:</label>
                    <input type="text" id="firstName" name="firstName" required><br>

                    <label for="lastName">Last Name:</label>
                    <input type="text" id="lastName" name="lastName" required><br>

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required><br>

                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required><br>

                    <label for="password">Confirm Password:</label>
                    <input type="password" id="password" name="password" required><br>

                    <% if (error != null) { %>
                    <div class="error"><%= error %></div>
                    <% } %>

                    <input type="submit" value="Register">
                </form>
            </div>
        </div>
    </body>
</html>

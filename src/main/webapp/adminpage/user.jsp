<%-- 
    Document   : user.jsp
    Created on : Jun 26, 2025, 6:30:50 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>
    </head>
    <body>
        <h1>User info</h1>
        <p>UserId : ${user.userID}</p>
        <p>First Name : ${user.firstName}</p>
        <p>Last Name : ${user.lastName}</p>
        <p>Email : ${user.email}</p>
        <p>Role : ${user.role} (1:Student, 3:Admin)</p>

        <h1>Update User info</h1>
        <form action="AdminUpdateUser" method="post">
            <input type="hidden" name="command" value="updateInfo" >
            <input type="hidden"  name="userId" value="${user.userID}" >
            <label> First Name</label>
            <input type="text" name="firstName" value="${user.firstName}" required>
            <label> Last Name</label>
            <input type="text" name="lastName" value="${user.lastName}" required>
            <label> Email</label>
            <input type="text" name="email" value="${user.email}" required>
            <label> Role</label>
            <select name="role" required>
                <option value="1">Student</option>
                <option value="3">Admin</option>
            </select>
            <input type="submit" value="Update">
        </form>

        <h1>Set password</h1>
        <form action="AdminUpdateUser" method="post" >
            <input type="hidden" name="command" value="updatePassword" >
            <input type="hidden"  name="userId" value="${user.userID}" >
            <label>New password</label>
            <input type="text" name="password">
            <input type="submit" value="Update">
        </form>  
        <h1>Exam History</h1>
          <form action="/User/ExamHistory" method="get" >
            <input type="hidden"  name="userId" value="${user.userID}" >
            <input type="submit" value="View">         
        </form>  
    </body>
</html>

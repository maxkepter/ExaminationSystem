<%-- 
    Document   : view_user
    Created on : Jun 25, 2025, 11:05:54 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View User</title>
    </head>
    <body>
        <strong>${errorMessage}</strong>
        
        <table>
            <tr>
                <th>User ID</th>
                <th>Name</th>
                <th>View Info</th>
                <th>Delete</th>
            </tr>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.userID}</td>
                    <td>${user.fullName}</td>

                    <td>
                        <form action="User" method="get">
                            <input type="hidden" name="userId" value="${user.userID}">
                            <input type="submit" value="View" >
                        </form>
                    </td>

                    <td>
                        <form action="User" method="delete">
                            <input type="hidden" name="userId" value="${user.userID}">
                            <input type="submit" value="Delete">
                        </form>
                    </td>

                </tr>
            </c:forEach>          

        </table>

    </body>
</html>

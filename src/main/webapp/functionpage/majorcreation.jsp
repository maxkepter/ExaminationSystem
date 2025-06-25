<%-- 
    Document   : majorcreation
    Created on : Jun 15, 2025, 5:24:55 PM
    Author     : MasterLong
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
        <h1>This is major creation</h1>
        
        <form action="${pageContext.request.getContextPath()}/HandleMajorCreation" method="get">
            Major name:<input type="text" name="majorName">
            <c:if test="${not empty Status}">
                <h4>${Status}</h4>
            </c:if>
            <input type="submit" name="action" value="Create Major">
        </form>
    </body>
</html>

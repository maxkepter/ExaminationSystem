<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="model.user.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>

        <c:choose>
            <c:when test="${not empty user}">
                <p>
                    Welcome,
                    ${user.firstName} ${user.lastName}!
                </p>
                <a href="Logout">Logout</a>
                <a href="UserProfile">Profile</a>
                <a href="ChangePassword">Change Password</a>
            </c:when>
            <c:otherwise>
                <p>Test</p>
                <a href="login.jsp">Login</a>
                <a href="Register">Register</a>
            </c:otherwise>
        </c:choose>

    </body>
</html>

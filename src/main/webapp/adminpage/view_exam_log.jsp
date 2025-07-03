<%-- 
    Document   : view_exam_log.jsp
    Created on : Jul 2, 2025, 3:49:34 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Log</title>
    </head>
    <body>
        <h1>Exam Log</h1>
        <strong>${error}</strong>
        <c:forEach var="log" items="${logs}" >
            <p>
                Time: ${log.formattedTime}
                Infomation: ${log.information}
            </p>            
        </c:forEach>
    </body>
</html>

<%-- 
    Document   : examdetail
    Created on : Jun 20, 2025, 8:08:51 PM
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
        <h1>This is exam detail</h1>
        <c:if test="${not empty allQuestion}">
            <c:forEach var="question" items="${allQuestion}" varStatus="status">
                <div>
                    <p><strong>Question ${status.index + 1} :</strong></p>
                    <p>${question.questionContent}</p>
                    <c:forEach var="option" items="${question.options}">
                        <c:if test="${option.isCorrect}">
                            <p>&#10003 ${option.optionContent}</p>                            
                            </c:if>
                        <c:if test="${!option.isCorrect}">
                            <p>&#10007 ${option.optionContent}</p>                            
                            </c:if>
                    </c:forEach>
                </div>
            </c:forEach>
        </c:if>
    </body>
</html>

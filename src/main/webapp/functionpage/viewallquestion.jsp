<%-- 
    Document   : viewallquestion
    Created on : Jun 20, 2025, 2:34:07 PM
    Author     : MasterLong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is all question</h1>
        <c:if test="${not empty allQuestion}">
            <c:set var="listDifficult" value="${fn:split('Easy,Medium,Hard', ',')}" />
            <c:forEach var="question" items="${allQuestion}">
                <div>
                    <p>Subject: ${question.chapter.subject.subjectName}</p>
                    <p>Chapter: ${question.chapter.chapterNo}</p>
                    <p>Difficulty: ${listDifficult[question.difficulty-1]}</p>
                    <p>Question: ${question.questionContent}</p>
                    <ul>
                        <c:forEach var="option" items="${question.options}">
                            <c:choose>
                                <c:when test="${option.isCorrect}">
                                    <li>${option.optionContent}(true)</li>
                                    </c:when>
                                    <c:otherwise>
                                    <li>${option.optionContent}</li>
                                    </c:otherwise>
                                </c:choose>

                        </c:forEach>
                    </ul>

                </div>
            </c:forEach>
        </c:if>
    </body>
</html>

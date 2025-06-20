<%-- 
    Document   : view_student_exam
    Created on : Jun 14, 2025, 9:19:01 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Student Exam</title>
    </head>
    <body>
        <div class="content">

            <c:forEach var="question" items="${examDetail}" varStatus="questionNo">
                <div class="question" id="question-${question.questionId}">
                    <p><strong>${questionNo.index + 1}. ${question.content}</strong></p>

                    <c:forEach var="opt" items="${question.options}">
                        <div class="option">
                            <c:choose>
                                <c:when test="${studentChoice[question.questionId] != null 
                                                and studentChoice[question.questionId].contains(opt.optionId)}">
                                        <span style="color: green; font-weight: bold;">&#10003;</span> <!-- biểu tượng check -->
                                </c:when>
                                <c:otherwise>
                                    <span style="color: red;">&#10007;</span> <!-- biểu tượng X -->
                                </c:otherwise>
                            </c:choose>
                            ${opt.content}
                        </div>
                    </c:forEach>
                </div>                
            </c:forEach>

        </div>

    </body>
</html>

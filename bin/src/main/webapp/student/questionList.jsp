<%-- 
    Document   : questionList
    Created on : Jun 10, 2025, 1:35:06 AM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><title>Danh sách câu hỏi</title></head>
<body>
<h2>Danh sách câu hỏi lọc</h2>
<c:choose>
    <c:when test="${not empty questions}">
        <ul>
            <c:forEach var="q" items="${questions}">
                <li>${q.questionContent}</li>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        <p>Không có câu hỏi nào phù hợp.</p>
    </c:otherwise>
</c:choose>
</body>
</html>

<%-- 
    Document   : statics
    Created on : Jul 3, 2025, 10:17:02 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statics</title>
    </head>
    <body>
        <h1>Score statics</h1>
        <form action="StatsticScore">
            <label>Exam: </label>
            <select name="examId">
                <option value="">Select exam</option>
                <c:forEach items="${examList}" var="exam">
                    <option value="${exam.examID}" ${examId==exam.examID?"selected":""}>${exam.examName}</option>
                </c:forEach>
            </select>
            <input type="submit" value="View">
        </form>
        
        <div class="content">
            <strong>${error}</strong>

            <c:if test="${not empty examId}">
                <table border="1">
                    <tr><th>Score</th><th>Count</th></tr>
                    <c:forEach var="entry" items="${scoreMap}">
                        <tr>
                            <td>${entry.key}</td>
                            <td>${entry.value}</td>
                        </tr>
                    </c:forEach>
                </table>
                <c:if test="${empty scoreMap}">
                 <p>No data available.</p>
            </c:if>
            </c:if>

        </div>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- BẮT BUỘC -->

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Statstic Score</title>
    </head>
    <body>
        <strong>${error}</strong>
        <p>${scoreMap}</p> <!-- debug map -->

        <c:if test="${not empty scoreMap}">
            <table border="1">
                <tr><th>Score</th><th>Count</th></tr>
                <c:forEach var="entry" items="${scoreMap}">
                    <tr>
                        <td>${entry.key}</td>
                        <td>${entry.value}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>

        <c:if test="${empty scoreMap}">
            <p>No data available.</p>
        </c:if>
    </body>
</html>

<%-- 
    Document   : subjectcreation
    Created on : Jun 15, 2025, 5:25:15 PM
    Author     : MasterLong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is subject and chapter creation</h1>
        <<form action="${pageContext.request.contextPath}/HandleSubjectAndChapterCreation" method="get">
            <c:if test="${not empty listMajor}">
                Major: <select id="id" name="majorId">
                    <c:forEach var="major" items="${listMajor}">
                        <option value="${major.majorId}">${major.majorName}</option>
                    </c:forEach>

                </select>

                Subject Name: <input type="text" name="subjectName">
                Number of Chapter: <input type="number" name="numberOfChapter" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
                <input  type="submit" name="action" value="Create Subject">
            </c:if>
        </form>

    </body>
</html>

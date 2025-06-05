<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Major Management</title>
<%
Integer numPage = (Integer) request.getAttribute("numPage");
Integer maxNumPage = (Integer) request.getAttribute("maxNumPage");
if (numPage == null) {
    numPage = 0;
}
if (maxNumPage == null) {
    maxNumPage = 0;
}
%>
</head>
<body>
    <div class="container">
        <h1>Major Management</h1>

        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <h2>Add Major</h2>
        <form action="MajorManagement" method="post">
            <input type="hidden" name="command" value="create" />
            <input type="text" name="majorName" placeholder="Enter Major Name" required />
            <button type="submit">Add Major</button>
        </form>

        <h2>Major List</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>MajorID</th>
                    <th>MajorName</th>
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="major" items="${majorList}">
                    <tr>
                        <td>${major.majorID}</td>
                        <td>${major.majorName}</td>
                        <td>
                            <form action="MajorManagement" method="post" style="display: inline;">
                                <input type="hidden" name="command" value="delete" />
                                <input type="hidden" name="majorId" value="${major.majorID}" />
                                <button type="submit" onclick="return confirm('Delete this major?')">Delete</button>
                            </form>
                        </td>
                        <td>
                            <form action="MajorManagement" method="post" style="display: inline;">
                                <input type="hidden" name="command" value="update" />
                                <input type="hidden" name="majorId" value="${major.majorID}" />
                                <input type="text" name="majorName" value="${major.majorName}" required />
                                <button type="submit" onclick="return confirm('Update this major?')">Update</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Pagination buttons -->
        <form action="MajorManagement" method="get">
            <c:if test="${numPage > 0}">
                <button type="submit" name="numPage" value="${numPage - 1}">Previous</button>
            </c:if>

            <button type="submit" name="numPage" value="${numPage}">${numPage + 1}</button>

            <c:if test="${numPage < maxNumPage}">
                <button type="submit" name="numPage" value="${numPage + 1}">Next</button>
            </c:if>
        </form>

        <form action="MajorManagement" method="get" onsubmit="return adjustPageNumber()">
            <label for="numPage">Page:</label>
            <input type="number" id="numPage" name="numPage" value="<%=numPage + 1%>" min="1" max="<%=maxNumPage + 1%>" required />
            <button type="submit">Go</button>
        </form>

        <script>
            function adjustPageNumber() {
                const input = document.getElementById('numPage');
                input.value = parseInt(input.value) - 1;
                return true;
            }
        </script>
    </div>
</body>
</html>

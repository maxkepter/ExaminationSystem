<%-- 
    Document   : findCode
    Created on : May 31, 2025, 7:18:20 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.exam.Exam" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Tìm kiếm đề thi</title>
    </head>
    <h2>Tìm kiếm đề thi</h2>

    <form method="post" action="${pageContext.request.contextPath}/ExamServlet">
        <input type="hidden" name="action" value="search"/>
        Mã đề thi: <input type="text" name="examID" pattern="^\d+$" oninput="this.value = this.value.replace(/[^0-9]/g, '')" required>
        <input type="submit" value="Tìm kiếm">
    </form>
    <%
    // Khai báo biến message và exam ở cùng 1 block scriptlet

    Exam exam = (Exam) request.getAttribute("examResult");

    if (exam != null) {
    %>
    <h3>Thông tin đề thi:</h3>
    <ul>
        <li><strong>ID:</strong> <%= exam.getExamID() %></li>
        <li><strong>Tên đề thi:</strong> <%= exam.getExamName() %></li>
        <li><strong>Thời gian làm bài:</strong> <%= exam.getDuration() %> phút</li>
        <li><strong>Người tạo:</strong> <%= exam.getUser().getLastName() %></li>

    </ul>

    <%
        
        }
    %>
    <% String message = (String) request.getAttribute("message");
    if (message != null) { %>
    <li><strong>Thông báo:</strong> <%= message %></li>
        <% } %>

</body>
</html>
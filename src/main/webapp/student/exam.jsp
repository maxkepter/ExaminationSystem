<%-- 
    Document   : exam
    Created on : Jun 1, 2025, 6:08:54 PM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="model.exam.Exam" %>
<%
    Exam exam = (Exam) session.getAttribute("examResult");
    if (exam == null) {
        response.sendRedirect("findCode.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đề thi</title>
</head>
<body>
    <h2>Thông tin đề thi</h2>
    <ul>
        <li>Mã đề: <%= exam.getExamID() %></li>
        <li>Tên đề: <%= exam.getExamName() %></li>
        <li>Thời gian: <%= exam.getDuration() %> phút</li>
    </ul>
</body>
</html>

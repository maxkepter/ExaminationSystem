<%-- 
    Document   : exam_controll
    Created on : Jun 28, 2025, 2:56:22 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controll Student Exam</title>
        <% 
        String studentExamId=request.getParameter("studentExamId");
        %>
    </head>
    <body>
        <h1>Controll Student Exam</h1>
        <form action="ControllStudentExam" method="post">
            <input type="hidden" name="studentExamId" value="<%= studentExamId %>">
            <label>Message <input type="text" name="message" required> </label> 
            <br>
            <label>Redirect Url <input type="text" name="url"></label> 
            <p>(If blank just force submit the exam without redirecting)</p>
            <input type="submit" value="Force Submit">

        </form>
    </body>
</html>

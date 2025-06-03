<%-- 
    Document   : examCreation1
    Created on : Jun 1, 2025, 5:58:34 PM
    Author     : MasterLong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="createExam">
            Tên bài thi: <input type="text" name="examName">
            Thời gian thi <input type="number" name="duration" min="0">
            <input type="submit" name="submit">
        </form>
    </body>
</html>

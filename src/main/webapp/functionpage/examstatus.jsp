<%-- 
    Document   : examstatus
    Created on : Jun 30, 2025, 9:07:44 AM
    Author     : MasterLong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function startCountdown(endTime, elementIndexId) {

                function update() {
                    const now = Date.now();
                    let diff = endTime - now;

                    if (diff <= 0) {
                        document.getElementById("countdown" + elementIndexId).innerText = "00:00:00";
                        document.getElementById("status" + elementIndexId).innerText = "Exam Finished";
                        return;
                    }

                    const hours = Math.floor(diff / 3600000);
                    const minutes = Math.floor((diff % 3600000) / 60000);
                    const seconds = Math.floor((diff % 60000) / 1000);

                    document.getElementById("status" + elementIndexId).innerText = "Exam Ongoing";
                    document.getElementById("countdown" + elementIndexId).innerText =
                            (hours < 10 ? "0" : "") + hours + ":" +
                            (minutes < 10 ? "0" : "") + minutes + ":" +
                            (seconds < 10 ? "0" : "") + seconds;


                }

                update(); // run immediately
                setInterval(update, 1000); // update every second
            }

        </script>
    </head>
    <body>
        <h1>This is exam status</h1>
        <c:if test="${not empty error}">
            <<h1>${error}</h1>
        </c:if>
        <c:if test="${not empty listStudentExam}">
            <c:forEach var="studentExam" items="${listStudentExam}" varStatus="status">
                <div>
                    <%
                        java.time.LocalDateTime endTime = ((model.exam.student.StudentExam) pageContext.getAttribute("studentExam")).getEndTime();
                        long endMillis = endTime.atZone(java.time.ZoneId.systemDefault()).toInstant().toEpochMilli();
                        request.setAttribute("endMillis", endMillis);
                    %>
                    <p><strong>Exam ${status.index+1}</strong></p>
                    <p>${studentExam.student.studentCode}</p>
                    <p>${studentExam.student.user.firstName}${studentExam.student.user.lastName}</p>
                    <p>${studentExam.startTimeFormatted}</p>
                    <p id="countdown${status.index}">Calculating...</p>
                    <p id="status${status.index}">Status: </p>
                    <script>
                        startCountdown(${endMillis}, "${status.index}");
                    </script>
                    <c:if test="${studentExam.examStatus == 2}"> 
                        <form action="../ForceSubmit" method="get">
                            <input type="hidden" name="studentExamId" value="${studentExam.studentExamID}">
                            <input type="submit" value="Force Submit">
                        </form> 
                    </c:if>

                    </div>
            </c:forEach>
        </c:if>      


    </body>
</html>

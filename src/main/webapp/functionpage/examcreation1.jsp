<%-- 
    Document   : examcreation1
    Created on : Jun 3, 2025, 2:33:05 AM
    Author     : MasterLong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is where you create the exam</h1>
        <c:choose>
            <c:when test="${not empty user}">
                <p class="welcome-text">
                    Welcome, <strong>${user.firstName} ${user.lastName}</strong>!
                </p>
            </c:when>
        </c:choose>

        <form action="${pageContext.request.contextPath}/HandleExamCreation1" method="get">
            Major: <select id="majorSelect" name="majorId">
                <option value="">-- Choose a major --</option>
            </select>
            Subject: <select id="subjectSelect" name="subjectId">
                <option value="">-- Choose a subject --</option>
            </select>
            Chapter: <select id="chapterSelect" name="chapterId">
                <option value="">-- Choose a chapter --</option>
            </select>
            Tên đề thi <input type="text" name="examName">
            Thời gian (phút) <input type="number" name="duration" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            Số câu hỏi dễ: <input type="number" name="numberEasy" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            Số câu hỏi vừa: <input type="number" name="numberNormal" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            Số câu hỏi khó:  <input type="number" name="numberHard" oninput="this.value = this.value.replace(/[^0-9]/g, '')">
            <input type="submit" name="submit" value="Bắt đầu tạo bài kiểm tra">
        </form>
        <a class="btn " href="${pageContext.request.contextPath}/adminhome">Go Back</a>
        
        <script>
            //Dynamic generation major
            document.addEventListener("DOMContentLoaded",function(){
                const baseUrl = '<%= request.getContextPath() %>';
                fetch(baseUrl + "/AjaxHandleChooseChapter?action=getMajors")
                        .then(response =>response.json())
                        .then(majors => {
                            const majorSelect = document.getElementById("majorSelect");
                            majorSelect.innerHTML="";
                            const defaultOption = document.createElement("option");
                            defaultOption.value = "";
                            defaultOption.textContent = "-- Choose a major --";
                            chapterSelect.appendChild(defaultOption);
                            majors.forEach(major =>{
                                const option = document.createElement("option");
                                option.value = major.majorId;
                                option.textContent = major.majorName;
                                majorSelect.appendChild(option);
                            });
                    
                        });
            });
            //Dynamic generation subject after choose major
            document.getElementById("majorSelect").addEventListener("change", function () {
                const baseUrl = '<%= request.getContextPath() %>';
                const majorId = this.value;
                fetch(baseUrl + "/AjaxHandleChooseChapter?action=getSubjects&majorId=" + encodeURIComponent(majorId))
                        .then(response => response.json())
                        .then(subjects => {
                            const subjectSelect = document.getElementById("subjectSelect");
                            subjectSelect.innerHTML = "";
                            subjects.forEach(subject => {
                                const option = document.createElement("option");
                                option.value = subject.subID;
                                option.textContent = subject.subjectName;
                                subjectSelect.appendChild(option);

                            });
                        });

            });

            //Dynamic generation chapter adter choose subject
            document.getElementById("subjectSelect").addEventListener("change", function () {
                const baseUrl = '<%= request.getContextPath() %>';
                const subjectId = this.value;
                fetch(baseUrl + "/AjaxHandleChooseChapter?action=getChapters&subjectId=" + encodeURIComponent(subjectId))
                        .then(response => response.json())
                        .then(chapters => {
                            const chapterSelect = document.getElementById("chapterSelect");
                            chapterSelect.innerHTML = "";
                            chapters.forEach(chapter => {
                                const option = document.createElement("option");
                                option.value = chapter.chapterID;
                                option.textContent = chapter.chapterNo;
                                chapterSelect.appendChild(option);

                            });
                        });

            });
        </script>
    </body>

</html>

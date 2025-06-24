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
            <div id="chapterSelect">
                <p>Select all chapter:</p>
            </div>  
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
            function getListMajor() {
                const baseUrl = '<%= request.getContextPath() %>';
                fetch(baseUrl + "/AjaxHandleChooseChapter?action=getMajors")
                        .then(response => response.json())
                        .then(majors => {
                            const majorSelect = document.getElementById("majorSelect");
                            majorSelect.innerHTML = "";
                            const defaultOption = document.createElement("option");
                            defaultOption.value = "";
                            defaultOption.textContent = "-- Choose a major --";
                            majorSelect.appendChild(defaultOption);
                            majors.forEach(major => {
                                const option = document.createElement("option");
                                option.value = major.majorId;
                                option.textContent = major.majorName;
                                majorSelect.appendChild(option);
                            });

                        });
            }
            function getListSubject(majorId) {
                const baseUrl = '<%= request.getContextPath() %>';
                fetch(baseUrl + "/AjaxHandleChooseChapter?action=getSubjects&majorId=" + encodeURIComponent(majorId))
                        .then(response => response.json())
                        .then(subjects => {
                            const subjectSelect = document.getElementById("subjectSelect");
                            subjectSelect.innerHTML = "";
                            const defaultOption = document.createElement("option");
                            defaultOption.value = "";
                            defaultOption.textContent = "-- Choose a subject --";
                            subjectSelect.appendChild(defaultOption);
                            subjects.forEach(subject => {
                                const option = document.createElement("option");
                                option.value = subject.subID;
                                option.textContent = subject.subjectName;
                                subjectSelect.appendChild(option);

                            });
                        });
            }

            function getListChapter(subjectId) {
                const baseUrl = '<%= request.getContextPath() %>';
                fetch(baseUrl + "/AjaxHandleChooseChapter?action=getChapters&subjectId=" + encodeURIComponent(subjectId))
                        .then(response => response.json())
                        .then(chapters => {
                            const chapterSelect = document.getElementById("chapterSelect");
                            chapterSelect.innerHTML = "<p>Select all chapter:</p>";
                            chapters.forEach(chapter => {
                                const div = document.createElement("div");
                                const chapterNo = document.createElement("span");
                                chapterNo.textContent ="Chapter "+ chapter.chapterNo;
                                const input = document.createElement("input");
                                input.value = chapter.chapterID;
                                input.name = "chapterID";
                                input.type= "checkbox";
                                div.appendChild(chapterNo);
                                div.appendChild(input);
                                chapterSelect.appendChild(div);

                            });
                        });
            }

            //Dynamic generation major
//            document.addEventListener("DOMContentLoaded", function () {
//                
//                
//            });
//            
            //
            document.addEventListener("DOMContentLoaded", function () {
                // Load dropdowns
                getListMajor();
                // Event handlers for cascading dropdowns
                document.getElementById("majorSelect").addEventListener("change", function () {
                    getListSubject(this.value);
                    //Reset chapter
                    const chapterSelect = document.getElementById("chapterSelect");
                    chapterSelect.innerHTML = "<p>Select all chapter:</p>";
                });
                document.getElementById("subjectSelect").addEventListener("change", function () {
                    getListChapter(this.value);
                });

            });
        </script>
    </body>

</html>

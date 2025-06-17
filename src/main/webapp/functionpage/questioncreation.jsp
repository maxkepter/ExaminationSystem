<%-- 
    Document   : questioncreation
    Created on : Jun 11, 2025, 2:17:50 PM
    Author     : MasterLong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>This is question creation</h1>
        <form action="${pageContext.request.getContextPath()}/HandleQuestionCreation" method="post">
            <c:if test="${not empty listMajor}">
                Major:<select id="majorSelect" name="majorId">
                    <option value="">-- Choose a major --</option>
                    <c:forEach var="major" items="${listMajor}">
                        <option value="${major.majorId}">${major.majorName}</option>
                    </c:forEach>
                </select>
                Subject:<select id="subjectSelect" name="subjectId">
                    <option value="">--Choose a subject--</option>
                </select>
            </c:if>
            Question: <input type="text" name="question" value="${question}"><br/>
            <div id="answersContainer">
                <div>
                    Answer 1: <input type="text" name="answer1">
                    True: <input type="checkbox" name="isTrue" value="1">
                </div>
                <div>
                    Answer 2: <input type="text" name="answer2">
                    True: <input type="checkbox" name="isTrue" value="2">
                </div>
            </div>

            <button type="button" id="addAnswerBtn">Add more answer</button>
            <button type="button" id="deleteAnswerBtn">Delete an answer</button>
            <input type="submit" id="submitQuestionBtn" name="action" value="Submit Question">
        </form>
        <script>
            //Dynamic generation subject and chapter after choose major
            document.getElementById("majorSelect").addEventListener("change", function () {
                const baseUrl = '<%= request.getContextPath() %>';
                const majorId = this.value;
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

            });

            //
            document.addEventListener("DOMContentLoaded", function () {
                let answerCount = 2; // Start from 2 since 1 and 2 already exist
                const addBtn = document.getElementById("addAnswerBtn");
                const deleteBtn = document.getElementById("deleteAnswerBtn");
                const answersContainer = document.getElementById("answersContainer");

                addBtn.addEventListener("click", function (e) {
                    e.preventDefault();
                    answerCount++;

                    const answerDiv = document.createElement("div");
                    answerDiv.innerHTML =
                            "Answer " + answerCount + ": " +
                            "<input type='text' name='answer" + answerCount + "' /> " +
                            "True: <input type='checkbox' name='isTrue' value='" + answerCount + "' />" +
                            "<br/>";

                    answersContainer.appendChild(answerDiv);
                });
                // Event delegation: handle delete clicks from all current/future .deleteAnswerBtn
                deleteBtn.addEventListener("click", function (e) {
                    e.preventDefault();

                    const answerDivs = answersContainer.querySelectorAll("div");

                    if (answerDivs.length > 2) {
                        answersContainer.removeChild(answerDivs[answerDivs.length - 1]);
                        answerCount--;
                    } else {
                        alert("At least 2 answers are required.");
                    }
                });


            });

        </script>
    </body>
</html>

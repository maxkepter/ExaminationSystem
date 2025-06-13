<%-- 
    Document   : do_exam
    Created on : Jun 10, 2025, 9:59:54 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Do Exam</title>
        <script src="./js/ExamLog.js"></script>
    </head>
    <body>

        <div class="header" >
            <p id="countdown" data-endtime="${endTimeMillis}">Test</p>
            <img
                src="https://s14.gifyu.com/images/bxI4U.gif"
                alt="Di chuột để vào toàn màn hình"
                />
        </div>
        <div class="side-bar">
            <h2>Question </h2>
            <c:forEach var="question" items="${examDetail}" varStatus="qustionNo" >
                <a href="#question-${question.questionId}">${qustionNo.index+1}</a>            
            </c:forEach>       
        </div>
        <div class="content">
            <form action="submitexam" method="post">
                <input type="hidden" name="sizeQuestion" value="${questionSize}">
                <input type="hidden" name="studentExamId" id="studentExamId" value="${studentExam.studentExamID}"> 
                <div class="content">
                    <c:forEach var="question" items="${examDetail}" varStatus="qustionNo">
                        <div class="question" id="question-${question.questionId}">
                            <p><strong>${qustionNo.index+1}. ${question.content}</strong></p>

                            <c:forEach var="opt" items="${question.options}">
                                <div class="option">
                                    <label>
                                        <input type="checkbox" 
                                               name="answers[${question.questionId}]" 
                                               value="${opt.optionId}" 
                                               data-question-id="${question.questionId}" 
                                               data-option-id="${opt.optionId}" 
                                               class="answer-checkbox" 
                                               <c:if test="${studentChoice[question.questionId] != null 
                                                             and studentChoice[question.questionId].contains(opt.optionId)}">checked</c:if>
                                                     />
                                        ${opt.content}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>                
                    </c:forEach>            
                </div>

                <div style="margin-top: 20px;">
                    <button type="submit">Submit</button>
                </div>
            </form>

            <!--làm một hàm lưu những thay đổi khi chọn đáp án, cứ mỗi 5s thì sẽ gửi về servler bằng ajax-->

        </div>
        <script src="./js/ExamTracking.js"></script>
        <script>
            const countdownElement = document.getElementById("countdown");
            const endTimeMillis = parseInt(countdownElement.dataset.endtime);

            function updateCountdown() {
                const now = Date.now();
                const diff = endTimeMillis - now;

                if (diff <= 0) {
                    countdownElement.textContent = "Hết giờ";
                    autoSubmit();
                    clearInterval(timer);
                    return;
                }

                const minutes = Math.floor(diff / 1000 / 60);
                const seconds = Math.floor((diff / 1000) % 60);

                // Chống âm tuyệt đối
                const displayMinutes = Math.max(0, minutes);
                const displaySeconds = Math.max(0, seconds);

                countdownElement.textContent = displayMinutes + ` : ` + displaySeconds;

            }
            updateCountdown();
            const timer = setInterval(updateCountdown, 1000);

            function autoSubmit() {
                // Gọi submit form
                const form = document.querySelector("form");
                if (form) {
                    form.submit();
                }
            }
        </script>
    </body>
</html>

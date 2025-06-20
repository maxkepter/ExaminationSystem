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
        <link rel="stylesheet" href="./css/doExam.css">
        <script src="./js/ExamLog.js"></script>
    </head>
    <body>
        <div class="container">
            <!-- Header -->
            <div class="header">
                <div class="exam-title">🎓 Examination System</div>
                <div class="timer-section">
                    <div id="countdown" data-endtime="${endTimeMillis}">Test</div>
                    <button class="fullscreen-btn" onclick="toggleFullscreen()">📱 Full Size</button>
                </div>
            </div>
            <div class="sidebar">
                <h2>Question </h2>
                <div class="stats">
                    <span>Đã làm: <strong id="answered-count">0</strong></span>
                    <span>Còn lại: <strong id="remaining-count">${questionSize}</strong></span>
                </div>
                <div class="progress-bar">
                    <div class="progress-fill" id="progress-fill"></div>
                </div>
                <div class="question-nav" id="question-nav">
                    <c:forEach var="question" items="${examDetail}" varStatus="qustionNo" >
                        <a href="#question-${question.questionId}">${qustionNo.index+1}</a>            
                    </c:forEach>  
                </div>
            </div>
            <div class="content">
                <form id="exam-form" action="submitexam" method="post">
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

                    <div class="submit-section">
                        <button type="submit" class="submit-btn"> Submit</button>
                    </div>
                </form>

                <!--làm một hàm lưu những thay đổi khi chọn đáp án, cứ mỗi 5s thì sẽ gửi về servler bằng ajax-->

            </div>
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
            // Khởi tạo khi trang load
            document.addEventListener('DOMContentLoaded', function () {
                initializeExam();
                updateProgress();

                // Lắng nghe sự thay đổi của checkbox
                document.querySelectorAll('.answer-checkbox').forEach(checkbox => {
                    checkbox.addEventListener('change', function () {
                        handleAnswerChange(this);
                        updateProgress();
                    });
                });
            });

            // Khởi tạo exam
            function initializeExam() {
                const totalQuestions = document.querySelectorAll('.question').length;
                document.getElementById('remaining-count').textContent = totalQuestions;

                // Đánh dấu câu hỏi hiện tại
                markCurrentQuestion();
            }

            // Xử lý khi thay đổi đáp án
            function handleAnswerChange(checkbox) {
                const questionId = checkbox.getAttribute('data-question-id');
                const option = checkbox.closest('.option');

                // Chỉ cho phép chọn một đáp án cho mỗi câu hỏi
                if (checkbox.checked) {
                    // Bỏ chọn các checkbox khác trong cùng câu hỏi
                    document.querySelectorAll(`input[data-question-id="${questionId}"]`).forEach(cb => {
                        if (cb !== checkbox) {
                            cb.checked = false;
                            cb.closest('.option').classList.remove('selected');
                        }
                    });
                    option.classList.add('selected');
                } else {
                    option.classList.remove('selected');
                }
            }

            // Cập nhật progress
            function updateProgress() {
                const totalQuestions = document.querySelectorAll('.question').length;
                const answeredQuestions = getAnsweredQuestionsCount();

                document.getElementById('answered-count').textContent = answeredQuestions;
                document.getElementById('remaining-count').textContent = totalQuestions - answeredQuestions;

                const progressPercent = (answeredQuestions / totalQuestions) * 100;
                document.getElementById('progress-fill').style.width = progressPercent + '%';

                // Cập nhật navigation
                updateQuestionNavigation();
            }

            // Đếm số câu đã trả lời
            function getAnsweredQuestionsCount() {
                const answeredQuestions = new Set();
                document.querySelectorAll('.answer-checkbox:checked').forEach(checkbox => {
                    answeredQuestions.add(checkbox.getAttribute('data-question-id'));
                });
                return answeredQuestions.size;
            }

            // Cập nhật navigation
            function updateQuestionNavigation() {
                document.querySelectorAll('.question-nav a').forEach(link => {
                    const questionId = link.getAttribute('data-question');
                    const hasAnswer = document.querySelector(`input[data-question-id="${questionId}"]:checked`);

                    link.classList.toggle('answered', !!hasAnswer);
                });
            }

            // Đánh dấu câu hỏi hiện tại
            function markCurrentQuestion() {
                const questions = document.querySelectorAll('.question');
                const navLinks = document.querySelectorAll('.question-nav a');

                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const questionId = entry.target.id.replace('question-', '');

                            // Bỏ đánh dấu tất cả
                            navLinks.forEach(link => link.classList.remove('current'));

                            // Đánh dấu câu hiện tại
                            const currentLink = document.querySelector(`a[data-question="${questionId}"]`);
                            if (currentLink) {
                                currentLink.classList.add('current');
                            }
                        }
                    });
                }, {threshold: 0.5});

                questions.forEach(question => observer.observe(question));
            }

            // Toggle fullscreen
            function toggleFullscreen() {
                if (!document.fullscreenElement) {
                    document.documentElement.requestFullscreen().catch(err => {
                        console.log('Error attempting to enable fullscreen:', err);
                    });
                } else {
                    document.exitFullscreen();
                }
            }

            // Smooth scroll cho navigation
            document.querySelectorAll('.question-nav a').forEach(link => {
                link.addEventListener('click', function (e) {
                    e.preventDefault();
                    const targetId = this.getAttribute('href');
                    const targetElement = document.querySelector(targetId);
                    if (targetElement) {
                        targetElement.scrollIntoView({
                            behavior: 'smooth',
                            block: 'start'
                        });
                    }
                });
            });
        </script>
    </body>
</html>

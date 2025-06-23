<%-- 
    Document   : view_student_exam
    Created on : Jun 14, 2025, 9:19:01 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Student Exam Result - FPT University</title>
        <link href="../css/user_info.css" rel="stylesheet" type="text/css"/>
        <link href="../css/doExam.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            /* Custom styles for exam result view */
            .exam-result-container {
                display: flex;
                gap: 20px;
                margin-top: 20px;
            }

            .exam-sidebar {
                width: 250px;
                background: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                height: fit-content;
                position: sticky;
                top: 20px;
            }

            .exam-content {
                flex: 1;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }

            .exam-header {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: white;
                padding: 20px;
                border-radius: 10px;
                margin-bottom: 20px;
                text-align: center;
            }

            .exam-title {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .exam-info {
                display: flex;
                justify-content: space-around;
                margin-top: 15px;
            }

            .info-item {
                text-align: center;
            }

            .info-label {
                font-size: 12px;
                opacity: 0.8;
            }

            .info-value {
                font-size: 18px;
                font-weight: bold;
            }

            .question-nav {
                display: grid;
                grid-template-columns: repeat(5, 1fr);
                gap: 8px;
                margin-top: 15px;
            }

            .question-nav a {
                display: block;
                padding: 8px;
                text-align: center;
                background: #e9ecef;
                color: #495057;
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
                transition: all 0.3s ease;
            }

            .question-nav a:hover {
                background: #dee2e6;
                transform: translateY(-2px);
            }

            .question-nav a.answered {
                background: #28a745;
                color: white;
            }

            .question-nav a.current {
                background: #007bff;
                color: white;
                box-shadow: 0 0 10px rgba(0,123,255,0.5);
            }

            .question {
                background: white;
                border: 2px solid #e9ecef;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                transition: all 0.3s ease;
            }

            .question:hover {
                border-color: #dee2e6;
                box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            }

            .question p {
                font-size: 16px;
                line-height: 1.6;
                margin-bottom: 15px;
                color: #2c3e50;
            }

            .option {
                display: flex;
                align-items: center;
                padding: 12px 15px;
                margin-bottom: 8px;
                background: #f8f9fa;
                border-radius: 8px;
                transition: all 0.3s ease;
                border-left: 4px solid transparent;
            }

            .option.correct {
                background: #d4edda;
                border-left-color: #28a745;
            }

            .option.incorrect {
                background: #f8d7da;
                border-left-color: #dc3545;
            }

            .option.selected {
                background: #cce5ff;
                border-left-color: #007bff;
            }

            .option-icon {
                margin-right: 10px;
                font-size: 16px;
                width: 20px;
                text-align: center;
            }

            .correct-icon {
                color: #28a745;
            }

            .incorrect-icon {
                color: #dc3545;
            }

            .stats {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
                font-size: 14px;
            }

            .stats span {
                color: #6c757d;
            }

            .stats strong {
                color: #2c3e50;
            }

            .progress-bar {
                width: 100%;
                height: 8px;
                background: #e9ecef;
                border-radius: 4px;
                overflow: hidden;
                margin-bottom: 20px;
            }

            .progress-fill {
                height: 100%;
                background: linear-gradient(90deg, #28a745, #20c997);
                transition: width 0.5s ease;
            }

            .back-button {
                display: inline-block;
                padding: 10px 20px;
                background: #6c757d;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                margin-bottom: 20px;
                transition: background 0.3s ease;
            }

            .back-button:hover {
                background: #5a6268;
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <div class="navbar">
            <div class="navbar-left">
                <a href="Home" class="logo">🎓 EXAMINATION SYSTEM</a>
                <span class="school-name"></span>
            </div>
            <div class="navbar-right">
                <span><i class="fa fa-user"></i> <strong>${user.firstName} ${user.lastName}</strong></span>
                <img src="https://cmshn.fpt.edu.vn/theme/image.php/trema/core/1697438386/u/f2" 
                     class="userpicture defaultuserpic" 
                     width="35" height="35" 
                     role="presentation" 
                     aria-hidden="true"
                     alt="User Avatar">
            </div>
        </div>

        <!-- Main Content -->
        <div class="content">
            <!-- Sidebar Navigation -->
            <div class="sidebar">
                <a href="UserProfile"><i class="fa fa-user"></i> User Profile</a>
                <a href="ExamHistory" class="active"><i class="fa fa-history"></i> View Exam History</a>
                <a href="ChangePassword"><i class="fa fa-lock"></i> Change Password</a>
                <a href="Logout"><i class="fa fa-sign-out-alt"></i> Logout</a>
            </div>

            <!-- Main Content Area -->
            <div class="main-content">
                <a href="ExamHistory" class="back-button">
                    <i class="fa fa-arrow-left"></i> Back to Exam History
                </a>

                <!-- Exam Header -->
                <div class="exam-header">
                    <div class="exam-title">📋 Exam Result Review</div>
                    <div class="exam-info">
                        <div class="info-item">
                            <div class="info-label">Score</div>
                            <div class="info-value">${examResult.score}%</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Correct</div>
                            <div class="info-value">${examResult.correctAnswers}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Total</div>
                            <div class="info-value">${examResult.totalQuestions}</div>
                        </div>
                        <div class="info-item">
                            <div class="info-label">Status</div>
                            <div class="info-value">${examResult.status}</div>
                        </div>
                    </div>
                </div>

                <div class="exam-result-container">
                    <!-- Exam Sidebar -->
                    <div class="exam-sidebar">
                        <h3><i class="fa fa-list"></i> Questions Overview</h3>
                        <div class="stats">
                            <span>Answered: <strong id="answered-count">${examResult.correctAnswers}</strong></span>
                            <span>Total: <strong>${examResult.totalQuestions}</strong></span>
                        </div>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: ${(examResult.correctAnswers * 100) / examResult.totalQuestions}%"></div>
                        </div>
                        <div class="question-nav" id="question-nav">
                            <c:forEach var="question" items="${examDetail}" varStatus="questionNo">
                                <a href="#question-${question.questionId}" 
                                   class="${studentChoice[question.questionId] != null ? 'answered' : ''}"
                                   data-question="${question.questionId}">
                                    ${questionNo.index + 1}
                                </a>            
                            </c:forEach>  
                        </div>
                    </div>

                    <!-- Exam Content -->
                    <div class="exam-content">
                        <c:forEach var="question" items="${examDetail}" varStatus="questionNo">
                            <div class="question" id="question-${question.questionId}">
                                <p><strong>${questionNo.index + 1}. ${question.content}</strong></p>

                                <c:forEach var="opt" items="${question.options}">
                                    <div class="option ${studentChoice[question.questionId] != null 
                                                         and studentChoice[question.questionId].contains(opt.optionId) 
                                                         ? (opt.isCorrect ? 'correct selected' : 'incorrect selected') 
                                                         : (opt.isCorrect ? 'correct' : '')}">
                                        <span class="option-icon">
                                            <c:choose>
                                                <c:when test="${studentChoice[question.questionId] != null 
                                                                and studentChoice[question.questionId].contains(opt.optionId)}">
                                                    <c:choose>
                                                        <c:when test="${opt.isCorrect}">
                                                            <i class="fa fa-check-circle correct-icon"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="fa fa-times-circle incorrect-icon"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:when test="${opt.isCorrect}">
                                                    <i class="fa fa-check-circle correct-icon"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="fa fa-circle" style="color: #dee2e6;"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </span>
                                        <span>${opt.content}</span>
                                    </div>
                                </c:forEach>
                            </div>                
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <script>
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

            // Đánh dấu câu hỏi hiện tại khi scroll
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

            // Khởi tạo khi trang load
            document.addEventListener('DOMContentLoaded', function () {
                markCurrentQuestion();
            });
        </script>
    </body>
</html>
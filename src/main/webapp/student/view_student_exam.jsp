<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Exam Result </title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
        
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f5f7fa;
        }

        .navbar-gradient {
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
            height: 64px;
        }

        .sidebar {
            transition: all 0.3s ease;
        }

        .sidebar-item {
            transition: all 0.3s ease;
        }

        .sidebar-item:hover {
            background-color: #f8fafc;
            border-radius: 8px;
        }

        .sidebar-item.active {
            background-color: #e0e7ff;
            border-radius: 8px;
            color: #6366f1;
        }

        .exam-result-container {
            display: flex;
            gap: 24px;
            margin-top: 24px;
        }

        .exam-sidebar {
            width: 280px;
            background: white;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            height: fit-content;
            position: sticky;
            top: 88px;
        }

        .exam-content {
            flex: 1;
            background: white;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .exam-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 24px;
            border-radius: 12px;
            margin-bottom: 24px;
            text-align: center;
        }

        .exam-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 16px;
        }

        .exam-info {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 16px;
            margin-top: 20px;
        }

        .info-item {
            text-align: center;
            padding: 12px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 8px;
        }

        .info-label {
            font-size: 14px;
            opacity: 0.9;
            margin-bottom: 4px;
        }

        .info-value {
            font-size: 20px;
            font-weight: 700;
        }

        .question-nav {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 8px;
            margin-top: 16px;
        }

        .question-nav a {
            display: block;
            padding: 10px 8px;
            text-align: center;
            background: #f1f5f9;
            color: #64748b;
            text-decoration: none;
            border-radius: 6px;
            font-weight: 600;
            font-size: 14px;
            transition: all 0.2s ease;
        }

        .question-nav a:hover {
            background: #e2e8f0;
            transform: translateY(-1px);
        }

        .question-nav a.answered {
            background: #22c55e;
            color: white;
        }

        .question-nav a.current {
            background: #3b82f6;
            color: white;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.3);
        }

        .question {
            background: white;
            border: 2px solid #f1f5f9;
            border-radius: 12px;
            padding: 24px;
            margin-bottom: 24px;
            transition: all 0.3s ease;
        }

        .question:hover {
            border-color: #e2e8f0;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
        }

        .question p {
            font-size: 18px;
            line-height: 1.6;
            margin-bottom: 20px;
            color: #1e293b;
            font-weight: 500;
        }

        .option {
            display: flex;
            align-items: center;
            padding: 14px 18px;
            margin-bottom: 10px;
            background: #f8fafc;
            border-radius: 10px;
            transition: all 0.3s ease;
            border-left: 4px solid transparent;
            font-size: 16px;
        }

        .option.correct {
            background: #dcfce7;
            border-left-color: #22c55e;
            color: #15803d;
        }

        .option.incorrect {
            background: #fef2f2;
            border-left-color: #ef4444;
            color: #dc2626;
        }

        .option.selected {
            background: #dbeafe;
            border-left-color: #3b82f6;
            color: #1d4ed8;
        }

        .option.correct.selected {
            background: #dcfce7;
            border-left-color: #22c55e;
            color: #15803d;
        }

        .option.incorrect.selected {
            background: #fef2f2;
            border-left-color: #ef4444;
            color: #dc2626;
        }

        .option-icon {
            margin-right: 12px;
            font-size: 18px;
            width: 24px;
            text-align: center;
        }

        .correct-icon {
            color: #22c55e;
        }

        .incorrect-icon {
            color: #ef4444;
        }

        .stats {
            display: flex;
            justify-content: space-between;
            margin-bottom: 16px;
            font-size: 14px;
        }

        .stats span {
            color: #64748b;
        }

        .stats strong {
            color: #1e293b;
        }

        .progress-bar {
            width: 100%;
            height: 10px;
            background: #f1f5f9;
            border-radius: 6px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, #22c55e, #16a34a);
            transition: width 0.5s ease;
        }

        .back-button {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 20px;
            background: #64748b;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            margin-bottom: 24px;
            transition: all 0.2s ease;
            font-weight: 500;
        }

        .back-button:hover {
            background: #475569;
            transform: translateY(-1px);
        }

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            .sidebar.active {
                transform: translateX(0);
            }
            .exam-result-container {
                flex-direction: column;
            }
            .exam-sidebar {
                width: 100%;
                position: static;
            }
            .exam-info {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar-gradient shadow-lg fixed w-full top-0 z-50">
        <div class="w-full px-4 sm:px-6 lg:px-8">
            <div class="flex items-center justify-between h-16">
                <!-- Logo/Brand -->
                <div class="flex items-center">
                    <h1 class="text-2xl font-bold text-white">
                        🎓 Examination System
                    </h1>
                </div>

                <!-- User Menu -->
                <div class="flex items-center space-x-3">
                    <span class="text-white font-medium hidden sm:block">
                        ${user.firstName} ${user.lastName}
                    </span>
                    <div class="h-8 w-8 rounded-full bg-white bg-opacity-20 flex items-center justify-center text-white font-bold text-sm">
                        ${user.firstName.charAt(0)}${user.lastName.charAt(0)}
                    </div>

                    <!-- Mobile menu button -->
                    <button id="mobile-menu-button" class="md:hidden focus:outline-none text-white ml-2">
                        <svg class="h-6 w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                  d="M4 6h16M4 12h16M4 18h16"></path>
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </nav>

    <!-- Layout Container -->
    <div class="flex pt-16 min-h-screen">
        <!-- Sidebar -->
        <aside id="sidebar" class="sidebar bg-white w-64 fixed h-full shadow-lg z-40 border-r border-gray-200">
            <div class="p-4">
                <!-- Navigation Header -->
                <div class="mb-8 mt-2">
                    <h2 class="text-lg font-semibold text-gray-700 mb-4">Navigation</h2>
                </div>

                <nav>
                    <ul class="space-y-2">
                        <li>
                            <a href="Home" class="sidebar-item flex items-center px-4 py-3 text-gray-700 font-medium">
                                <i class="fas fa-home w-5 mr-4 text-lg"></i>
                                Home 
                            </a>
                        </li>
                        <li>
                            <a href="UserProfile" class="sidebar-item flex items-center px-4 py-3 text-gray-700 font-medium">
                                <i class="fas fa-user-edit w-5 mr-4 text-lg"></i>
                                Update Information
                            </a>
                        </li>
                        <li>
                            <a href="ExamHistory" class="sidebar-item active flex items-center px-4 py-3 text-gray-700 font-medium">
                                <i class="fas fa-history w-5 mr-4 text-lg"></i>
                                Exam History
                            </a>
                        </li>
                        <li>
                            <a href="ChangePassword" class="sidebar-item flex items-center px-4 py-3 text-gray-700 font-medium">
                                <i class="fas fa-lock w-5 mr-4 text-lg"></i>
                                Change Password
                            </a>
                        </li>
                    </ul>
                </nav>

                <div class="mt-12 pt-6 border-t border-gray-200">
                    <ul class="space-y-2">
                        <li>
                            <a href="Logout" class="sidebar-item flex items-center px-4 py-3 text-gray-700 font-medium">
                                <i class="fas fa-sign-out-alt w-5 mr-4 text-lg"></i>
                                Logout
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>

        <!-- Main Content -->
        <main class="flex-1 ml-64 p-6 md:p-8 bg-gray-50">
            <a href="ExamHistory" class="back-button">
                <i class="fas fa-arrow-left"></i>
                Back to Exam History
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
                    <h3 class="text-lg font-semibold text-gray-800 mb-4">
                        <i class="fas fa-list mr-2"></i>
                        Questions Overview
                    </h3>
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
                                                        <i class="fas fa-check-circle correct-icon"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fas fa-times-circle incorrect-icon"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:when test="${opt.isCorrect}">
                                                <i class="fas fa-check-circle correct-icon"></i>
                                            </c:when>
                                            <c:otherwise>
                                                <i class="far fa-circle" style="color: #cbd5e1;"></i>
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
        </main>
    </div>

    <script>
        // Mobile menu toggle
        document.getElementById('mobile-menu-button').addEventListener('click', function() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('active');
        });

        // Smooth scroll for navigation
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

        // Mark current question when scrolling
        function markCurrentQuestion() {
            const questions = document.querySelectorAll('.question');
            const navLinks = document.querySelectorAll('.question-nav a');

            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const questionId = entry.target.id.replace('question-', '');

                        // Remove current marking from all
                        navLinks.forEach(link => link.classList.remove('current'));

                        // Mark current question
                        const currentLink = document.querySelector(`a[data-question="${questionId}"]`);
                        if (currentLink) {
                            currentLink.classList.add('current');
                        }
                    }
                });
            }, {threshold: 0.5});

            questions.forEach(question => observer.observe(question));
        }

        // Initialize when page loads
        document.addEventListener('DOMContentLoaded', function () {
            markCurrentQuestion();
        });
    </script>
</body>
</html>
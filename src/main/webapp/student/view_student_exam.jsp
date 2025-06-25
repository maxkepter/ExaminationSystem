<%-- 
    Document   : view_student_exam
    Created on : Jun 14, 2025, 9:19:01 PM
    Author     : Admin
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>View Exam Results - Examination System</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css?family=Inter:wght@300;400;500;600;700&display=swap');
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f5f7fa;
            }
            .sidebar {
                transition: all 0.3s ease;
            }
            .navbar-gradient {
                height: 81px;
            }
            .navbar-gradient h1{
                justify-content: center;
            }
            .p-4{
                margin-top: 17px;
            }
            .flex-1{
                margin-top: 17px;
            }
            @media (max-width: 768px) {
                .sidebar {
                    transform: translateX(-100%);
                }
                .sidebar.active {
                    transform: translateX(0);
                }
            }
            .form-input:focus {
                border-color: #4f46e5;
                box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.2);
            }
            .navbar-gradient {
                background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
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
            .question-card {
                transition: all 0.3s ease;
                border-left: 4px solid #e5e7eb;
            }
            .question-card:hover {
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            }
            .option-item {
                transition: all 0.2s ease;
                padding: 12px 16px;
                border-radius: 8px;
                margin: 8px 0;
                border: 2px solid transparent;
            }
            .option-selected {
                background-color: #dcfce7;
                border-color: #16a34a;
                color: #166534;
            }
            .option-not-selected {
                background-color: #fef2f2;
                border-color: #dc2626;
                color: #991b1b;
            }
            .option-correct {
                background-color: #dcfce7;
                border-color: #16a34a;
            }
            .option-incorrect {
                background-color: #fef2f2;
                border-color: #dc2626;
            }
            .question-number {
                background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
                color: white;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 600;
                font-size: 16px;
            }
            .back-button {
                transition: all 0.3s ease;
            }
            .back-button:hover {
                transform: translateX(-2px);
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
                        <h1 class="text-[28.8px] font-bold text-white" style="margin-top: 8px; font-family: 'Segoe UI';">
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

        <!-- Main Container -->
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
                                <a href="index.jsp" class="sidebar-item flex items-center px-4 py-3 text-gray-700 font-medium">
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
                                <!-- Active vì đang xem chi tiết từ exam history -->
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
                <div class="max-w-6xl mx-auto">
                    <!-- Page Header -->
                    <div class="mb-8">
                        <div class="flex items-center justify-between">
                            <div>
                                <h1 class="text-2xl font-bold text-gray-800 flex items-center">
                                    <i class="fas fa-eye mr-3 text-indigo-600"></i> Exam Results
                                </h1>
                                <p class="text-gray-600 mt-1">Review your answers and exam performance</p>
                            </div>
                            <!-- Back Button -->
                            <a href="ExamHistory" class="back-button bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-md transition flex items-center">
                                <i class="fas fa-arrow-left mr-2"></i>
                                Back to History
                            </a>
                        </div>
                    </div>

                    <!-- Exam Info Card -->
                    <div class="bg-white rounded-lg shadow-sm p-6 border border-gray-200 mb-8">
                        <div class="flex items-center justify-between">
                            <div>
                                <h2 class="text-xl font-semibold text-gray-800 mb-2">${examName}</h2>
                                <div class="flex items-center space-x-6 text-sm text-gray-600">
                                    <span><i class="fas fa-calendar mr-2"></i>Completed on: ${submitDate}</span>
                                    <span><i class="fas fa-clock mr-2"></i>Duration: ${duration}</span>
                                    <span><i class="fas fa-question-circle mr-2"></i>Questions: ${totalQuestions}</span>
                                </div>
                            </div>
                            <div class="text-right">
                                <div class="text-3xl font-bold text-indigo-600">${score}%</div>
                                <div class="text-sm text-gray-500">Final Score</div>
                            </div>
                        </div>
                    </div>

                    <!-- Success Message -->
                    <c:if test="${not empty success}">
                        <div class="bg-green-50 border border-green-200 text-green-800 px-4 py-3 rounded-md mb-6 flex items-center">
                            <i class="fas fa-check-circle mr-2"></i>
                            ${success}
                        </div>
                    </c:if>

                    <!-- Error Message -->
                    <c:if test="${not empty error}">
                        <div class="bg-red-50 border border-red-200 text-red-800 px-4 py-3 rounded-md mb-6 flex items-center">
                            <i class="fas fa-exclamation-triangle mr-2"></i>
                            ${error}
                        </div>
                    </c:if>

                    <!-- Questions and Answers -->
                    <div class="space-y-6">
                        <c:forEach var="question" items="${examDetail}" varStatus="questionNo">
                            <div class="question-card bg-white rounded-lg shadow-sm p-6 border border-gray-200" id="question-${question.questionId}">
                                <!-- Question Header -->
                                <div class="flex items-start mb-6">
                                    <div class="question-number mr-4 flex-shrink-0">
                                        ${questionNo.index + 1}
                                    </div>
                                    <div class="flex-1">
                                        <h3 class="text-lg font-semibold text-gray-800 leading-relaxed">
                                            ${question.content}
                                        </h3>
                                    </div>
                                </div>

                                <!-- Answer Options -->
                                <div class="ml-14 space-y-3">
                                    <c:forEach var="opt" items="${question.options}" varStatus="optionNo">
                                        <div class="option-item ${studentChoice[question.questionId] != null and studentChoice[question.questionId].contains(opt.optionId) ? 'option-selected' : 'option-not-selected'}">
                                            <div class="flex items-center">
                                                <div class="flex-shrink-0 mr-3">
                                                    <c:choose>
                                                        <c:when test="${studentChoice[question.questionId] != null and studentChoice[question.questionId].contains(opt.optionId)}">
                                                            <div class="w-6 h-6 rounded-full bg-green-500 flex items-center justify-center">
                                                                <i class="fas fa-check text-white text-sm"></i>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="w-6 h-6 rounded-full bg-red-500 flex items-center justify-center">
                                                                <i class="fas fa-times text-white text-sm"></i>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                                <div class="flex-1">
                                                    <span class="font-medium text-sm text-gray-600 mr-2">
                                                    </span>
                                                    <span class="text-gray-800">${opt.content}</span>
                                                </div>
                                                <div class="flex-shrink-0">
                                                    <c:choose>
                                                        <c:when test="${studentChoice[question.questionId] != null and studentChoice[question.questionId].contains(opt.optionId)}">
                                                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                                                <i class="fas fa-check-circle mr-1"></i>
                                                                Your Choice
                                                            </span>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                                <!-- Question Status -->
                                <div class="mt-4 ml-14">
                                    <c:choose>
                                        <c:when test="${studentChoice[question.questionId] != null}">
                                            <div class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-100 text-blue-800">
                                                <i class="fas fa-info-circle mr-2"></i>
                                                Answered
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-gray-100 text-gray-800">
                                                <i class="fas fa-minus-circle mr-2"></i>
                                                Not Answered
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- No Questions Message -->
                        <c:if test="${empty examDetail}">
                            <div class="text-center py-12">
                                <i class="fas fa-question-circle text-gray-300 text-6xl mb-4"></i>
                                <h3 class="text-lg font-medium text-gray-500 mb-2">No Questions Found</h3>
                                <p class="text-gray-400">This exam doesn't contain any questions.</p>
                            </div>
                        </c:if>
                    </div>

                    <!-- Bottom Actions -->
                    <div class="mt-8 flex justify-center">
                        <a href="ExamHistory" class="bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-3 px-8 rounded-md transition flex items-center">
                            <i class="fas fa-arrow-left mr-2"></i>
                            Return to Exam History
                        </a>
                    </div>
                </div>
            </main>
        </div>

        <script>
            // Mobile menu toggle
            document.getElementById('mobile-menu-button').addEventListener('click', function () {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('active');
            });

            // Smooth scroll to question
            function scrollToQuestion(questionId) {
                document.getElementById('question-' + questionId).scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }

            // Add question navigation if there are many questions
            window.addEventListener('load', function () {
                const questions = document.querySelectorAll('.question-card');
                if (questions.length > 5) {
                    // Add floating navigation for long exams
                    console.log('Long exam detected, consider adding floating navigation');
                }
            });
        </script>
    </body>
</html>
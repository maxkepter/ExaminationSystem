<%-- 
    Document   : viewallquestion
    Created on : Jun 20, 2025, 2:34:07 PM
    Author     : MasterLong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>All Questions - Examination System</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css?family=Inter:wght@300;400;500;600;700&display=swap');
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f5f7fa;
                font-family: 'Segoe UI', sans-serif;
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
                border: 1px solid #e5e7eb;
                background-color: #ffffff;
            }
            .option-correct {
                background-color: #dcfce7;
                border-color: #16a34a;
                color: #166534;
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
            .difficulty-badge {
                display: inline-flex;
                align-items: center;
                padding: 4px 12px;
                rounded: 9999px;
                font-size: 12px;
                font-weight: 500;
                text-transform: uppercase;
                letter-spacing: 0.025em;
            }
            .difficulty-easy {
                background-color: #dcfce7;
                color: #166534;
                border-color: #16a34a;
            }
            .difficulty-medium {
                background-color: #fef3c7;
                color: #92400e;
                border-color: #f59e0b;
            }
            .difficulty-hard {
                background-color: #fee2e2;
                color: #991b1b;
                border-color: #ef4444;
            }
            .subject-badge {
                background-color: #e0e7ff;
                color: #4338ca;
                padding: 4px 12px;
                border-radius: 9999px;
                font-size: 14px;
                font-weight: 500;
            }
            .chapter-badge {
                background-color: #f3f4f6;
                color: #374151;
                padding: 4px 12px;
                border-radius: 9999px;
                font-size: 14px;
                font-weight: 500;
            }
            .difficulty-badge {
                border-radius: 999px; /* 👈 BO TRÒN */
                padding: 6px 12px;
                font-weight: 500;
            }

            .question-meta {
                display: flex;
                flex-wrap: wrap;
                gap: 8px;
                margin-bottom: 16px;
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

            <!-- Main Content -->
            <main class="flex-1 p-6 md:p-8 bg-gray-50">
                <div class="max-w-4xl mx-auto">
                    <!-- Page Header -->
                    <div class="mb-8">
                        <div class="flex items-center justify-between">
                            <div>
                                <h1 class="text-2xl font-bold text-gray-800 flex items-center">
                                    <i class="fas fa-question-circle mr-3 text-indigo-600"></i> All Questions
                                </h1>
                                <p class="text-gray-600 mt-1">Browse all available questions in the system</p>
                            </div>
                            <!-- Back Button -->
                            <a href="javascript:history.back()" class="back-button bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-md transition flex items-center">
                                <i class="fas fa-arrow-left mr-2"></i>
                                Back
                            </a>
                        </div>
                    </div>

                    <!-- Questions List -->
                    <div class="space-y-6">
                        <c:if test="${not empty allQuestion}">
                            <c:set var="listDifficult" value="${fn:split('Easy,Medium,Hard', ',')}" />
                            <c:forEach var="question" items="${allQuestion}" varStatus="status">
                                <div class="question-card bg-white rounded-lg shadow-sm p-6 border border-gray-200" id="question-${status.index + 1}">

                                    <!-- Question Meta Information -->
                                    <div class="question-meta">
                                        <span class="subject-badge">
                                            <i class="fas fa-book mr-1"></i>
                                            ${question.chapter.subject.subjectName}
                                        </span>
                                        <span class="chapter-badge">
                                            <i class="fas fa-bookmark mr-1"></i>
                                            Chapter ${question.chapter.chapterNo}
                                        </span>
                                        <span class="difficulty-badge difficulty-${fn:toLowerCase(listDifficult[question.difficulty-1])}">
                                            <i class="fas fa-signal mr-1"></i>
                                            ${listDifficult[question.difficulty-1]}
                                        </span>
                                    </div>

                                    <!-- Question Header -->
                                    <div class="mb-6">
                                        <div class="flex items-start">
                                            <div class="question-number mr-4 flex-shrink-0">
                                                ${status.index + 1}
                                            </div>
                                            <h3 class="text-lg font-semibold text-gray-800 leading-relaxed">
                                                ${question.questionContent}
                                            </h3>
                                        </div>
                                    </div>

                                    <!-- Answer Options -->
                                    <div class="ml-14 space-y-3">
                                        <c:forEach var="option" items="${question.options}" varStatus="optionStatus">
                                            <div class="option-item <c:if test='${option.isCorrect}'>option-correct</c:if>">
                                                    <div class="flex items-center justify-between">
                                                        <div class="flex items-center flex-1">
                                                            <div class="flex-shrink-0 mr-3">
                                                            <c:choose>
                                                                <c:when test="${option.isCorrect}">
                                                                    <div class="w-6 h-6 rounded bg-green-500 flex items-center justify-center">
                                                                        <i class="fas fa-check text-white text-sm"></i>
                                                                    </div>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="w-6 h-6 rounded border-2 border-gray-300 bg-white"></div>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="flex-1">
                                                            <span class="text-gray-800">${option.optionContent}</span>
                                                        </div>
                                                    </div>

                                                    <c:if test="${option.isCorrect}">
                                                        <div class="flex-shrink-0 ml-4">
                                                            <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                                                <i class="fas fa-check-circle mr-1"></i>
                                                                Correct Answer
                                                            </span>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:if>

                        <!-- No Questions Message -->
                        <c:if test="${empty allQuestion}">
                            <div class="text-center py-12">
                                <i class="fas fa-question-circle text-gray-300 text-6xl mb-4"></i>
                                <h3 class="text-lg font-medium text-gray-500 mb-2">No Questions Found</h3>
                                <p class="text-gray-400">There are no questions available in the system.</p>
                            </div>
                        </c:if>
                    </div>

                    <!-- Bottom Actions -->
                    <div class="mt-8 flex justify-center">
                        <a href="javascript:history.back()" class="bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-3 px-8 rounded-md transition flex items-center">
                            <i class="fas fa-arrow-left mr-2"></i>
                            Go Back
                        </a>
                    </div>
                </div>
            </main>
        </div>

        <script>
            // Mobile menu toggle
            document.getElementById('mobile-menu-button').addEventListener('click', function () {
                const sidebar = document.getElementById('sidebar');
                if (sidebar) {
                    sidebar.classList.toggle('active');
                }
            });

            // Smooth scroll to question
            function scrollToQuestion(questionId) {
                const element = document.getElementById('question-' + questionId);
                if (element) {
                    element.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            }

            // Add question navigation if there are many questions
            window.addEventListener('load', function () {
                const questions = document.querySelectorAll('.question-card');
                if (questions.length > 5) {
                    // Add floating navigation for long lists
                    console.log('Many questions detected, consider adding floating navigation');
                }
            });

            // Add scroll to top functionality
            window.addEventListener('scroll', function () {
                const scrollToTopBtn = document.getElementById('scroll-to-top');
                if (window.pageYOffset > 300) {
                    if (scrollToTopBtn) {
                        scrollToTopBtn.style.display = 'block';
                    }
                } else {
                    if (scrollToTopBtn) {
                        scrollToTopBtn.style.display = 'none';
                    }
                }
            });

            // Scroll to top function
            function scrollToTop() {
                window.scrollTo({
                    top: 0,
                    behavior: 'smooth'
                });
            }
        </script>

        <!-- Scroll to Top Button -->
        <button id="scroll-to-top" onclick="scrollToTop()" 
                class="fixed bottom-6 right-6 bg-indigo-600 hover:bg-indigo-700 text-white p-3 rounded-full shadow-lg transition-all duration-300 z-40"
                style="display: none;">
            <i class="fas fa-arrow-up"></i>
        </button>
    </body>
</html>

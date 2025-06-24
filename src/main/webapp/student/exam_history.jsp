<%-- 
    Document   : exam_history
    Created on : May 30, 2025, 8:06:45 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Exam History - Examination System</title>
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
            .exam-card {
                transition: all 0.3s ease;
            }
            .exam-card:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            }
            .score-badge {
                background: linear-gradient(135deg, #10b981 0%, #059669 100%);
            }
            .status-badge {
                font-size: 0.75rem;
                padding: 0.25rem 0.75rem;
                border-radius: 9999px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.05em;
            }
            .status-completed {
                background-color: #dcfce7;
                color: #166534;
            }
            .status-in-progress {
                background-color: #fef3c7;
                color: #92400e;
            }
            .status-not-started {
                background-color: #f3f4f6;
                color: #374151;
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
                                <!-- Đây là trang hiện tại nên có class active -->
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
                        <h1 class="text-2xl font-bold text-gray-800 flex items-center">
                            <i class="fas fa-history mr-3 text-indigo-600"></i> Exam History
                        </h1>
                        <p class="text-gray-600 mt-1">View your examination records and performance</p>
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

                    <!-- Exam History Cards -->
                    <div class="space-y-4 mb-8">
                        <c:forEach var="studentExam" items="${studentExams}" varStatus="examNo">
                            <div class="exam-card bg-white rounded-lg shadow-sm p-6 border border-gray-200">
                                <div class="flex items-start justify-between">
                                    <div class="flex-1">
                                        <!-- Exam Title -->
                                        <div class="flex items-center mb-3">
                                            <span class="bg-indigo-100 text-indigo-800 text-sm font-semibold px-3 py-1 rounded-full mr-3">
                                                #${examNo.index + 1}
                                            </span>
                                            <h3 class="text-lg font-semibold text-gray-800">
                                                ${studentExam.exam.examName}
                                            </h3>
                                        </div>

                                        <!-- Exam Details -->
                                        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mb-4">
                                            <!-- Score -->
                                            <div class="flex items-center">
                                                <i class="fas fa-star text-yellow-500 mr-2"></i>
                                                <div>
                                                    <p class="text-sm text-gray-500">Score</p>
                                                    <p class="font-semibold text-gray-800">${studentExam.score}</p>
                                                </div>
                                            </div>

                                            <!-- Start Time -->
                                            <div class="flex items-center">
                                                <i class="fas fa-play-circle text-green-500 mr-2"></i>
                                                <div>
                                                    <p class="text-sm text-gray-500">Start Time</p>
                                                    <p class="font-semibold text-gray-800">${studentExam.startTimeFormatted}</p>
                                                </div>
                                            </div>

                                            <!-- Submit Time -->
                                            <div class="flex items-center">
                                                <i class="fas fa-check-circle text-blue-500 mr-2"></i>
                                                <div>
                                                    <p class="text-sm text-gray-500">Submit Time</p>
                                                    <p class="font-semibold text-gray-800">${studentExam.submitTimeFormatted}</p>
                                                </div>
                                            </div>

                                            <!-- Status -->
                                            <div class="flex items-center">
                                                <i class="fas fa-info-circle text-indigo-500 mr-2"></i>
                                                <div>
                                                    <p class="text-sm text-gray-500">Status</p>
                                                    <span class="status-badge status-completed">
                                                        ${studentExam.statusInfo}
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- View Exam Button -->
                                    <div class="flex flex-col items-end ml-4">
                                        <a href="${pageContext.request.contextPath}/ExamHistory/viewexam?studentExamID=${studentExam.studentExamID}" 
                                           class="bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-2 px-4 rounded-md transition flex items-center">
                                            <i class="fas fa-eye mr-2"></i>
                                            View Exam
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                        <!-- No Exams Message -->
                        <c:if test="${empty studentExams}">
                            <div class="text-center py-12">
                                <i class="fas fa-clipboard-list text-gray-300 text-6xl mb-4"></i>
                                <h3 class="text-lg font-medium text-gray-500 mb-2">No Exam History</h3>
                                <p class="text-gray-400">You haven't taken any exams yet.</p>
                            </div>
                        </c:if>
                    </div>

                    <!-- Pagination Section -->
                    <c:if test="${not empty studentExams}">
                        <div class="bg-white rounded-lg shadow-sm p-6 border border-gray-200">
                            <div class="flex items-center justify-between">
                                <!-- Page Navigation Buttons -->
                                <div class="flex items-center space-x-2">
                                    <form action="ExamHistory" method="get" class="inline">
                                        <c:if test="${numPage > 0}">
                                            <button type="submit" name="numPage" value="${numPage - 1}" 
                                                    class="bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-md transition flex items-center">
                                                <i class="fas fa-chevron-left mr-2"></i>
                                                Previous
                                            </button>
                                        </c:if>
                                    </form>

                                    <form action="ExamHistory" method="get" class="inline">
                                        <button type="submit" name="numPage" value="${numPage}" 
                                                class="bg-indigo-600 text-white font-medium py-2 px-4 rounded-md">
                                            Page ${numPage + 1}
                                        </button>
                                    </form>

                                    <form action="ExamHistory" method="get" class="inline">
                                        <c:if test="${numPage < maxNumPage}">
                                            <button type="submit" name="numPage" value="${numPage + 1}" 
                                                    class="bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-md transition flex items-center">
                                                Next
                                                <i class="fas fa-chevron-right ml-2"></i>
                                            </button>
                                        </c:if>
                                    </form>
                                </div>

                                <!-- Go to Page -->
                                <div class="flex items-center space-x-2">
                                    <form action="ExamHistory" method="get" onsubmit="return adjustPageNumber()" class="flex items-center space-x-2">
                                        <label for="numPage" class="text-sm font-medium text-gray-700">Go to page:</label>
                                        <input type="number" 
                                               id="numPage" 
                                               name="numPage" 
                                               value="${numPage + 1}" 
                                               min="1" 
                                               max="${maxNumPage + 1}" 
                                               class="w-20 px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:border-indigo-500" 
                                               required />
                                        <button type="submit" 
                                                class="bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-2 px-4 rounded-md transition">
                                            Go
                                        </button>
                                    </form>
                                </div>
                            </div>

                            <!-- Page Info -->
                            <div class="mt-4 text-center">
                                <p class="text-sm text-gray-500">
                                    Showing page ${numPage + 1} of ${maxNumPage + 1}
                                </p>
                            </div>
                        </div>
                    </c:if>
                </div>
            </main>
        </div>

        <script>
            function adjustPageNumber() {
                const input = document.getElementById('numPage');
                input.value = parseInt(input.value) - 1;
                return true;
            }

            // Mobile menu toggle
            document.getElementById('mobile-menu-button').addEventListener('click', function() {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('active');
            });
        </script>
    </body>
</html>
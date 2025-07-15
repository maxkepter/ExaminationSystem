<%-- 
    Document   : admin_home
    Created on : Jun 2, 2025, 11:31:26 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Exam Management System</title>

        <!-- Tailwind CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>

        <style>
            .card-hover {
                transition: all 0.3s ease;
            }
            .card-hover:hover {
                transform: translateY(-5px);
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            }

            .fade-in {
                animation: fadeIn 0.6s ease-in-out;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .navbar-gradient {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                height: 81px;
            }
            .navbar-gradient h1{
                justify-content: center;
            }
            .p-4{
                margin-top: 17px;
            }

            /* Custom Orange Colors */
            .bg-orange-50 {
                background-color: #fff7ed !important;
            }
            .bg-orange-100 {
                background-color: #fed7aa !important;
            }
            .bg-orange-600 {
                background-color: #ea580c !important;
            }
            .text-orange-600 {
                color: #ea580c !important;
            }
            .text-orange-800 {
                color: #9a3412 !important;
            }
            h1{
                font-size: 28.8px;
            }

            /* Custom button styles */
            .btn-primary {
                background: linear-gradient(135deg, #3b82f6 0%, #1d4ed8 100%);
                transition: all 0.3s ease;
            }
            .btn-primary:hover {
                background: linear-gradient(135deg, #1d4ed8 0%, #1e40af 100%);
                transform: translateY(-1px);
            }

            .btn-success {
                background: linear-gradient(135deg, #10b981 0%, #059669 100%);
                transition: all 0.3s ease;
            }
            .btn-success:hover {
                background: linear-gradient(135deg, #059669 0%, #047857 100%);
                transform: translateY(-1px);
            }

            .btn-purple {
                background: linear-gradient(135deg, #8b5cf6 0%, #7c3aed 100%);
                transition: all 0.3s ease;
            }
            .btn-purple:hover {
                background: linear-gradient(135deg, #7c3aed 0%, #6d28d9 100%);
                transform: translateY(-1px);
            }

            .btn-orange {
                background: linear-gradient(135deg, #f97316 0%, #ea580c 100%);
                transition: all 0.3s ease;
            }
            .btn-orange:hover {
                background: linear-gradient(135deg, #ea580c 0%, #c2410c 100%);
                transform: translateY(-1px);
            }

            .btn-light {
                background: linear-gradient(135deg, #e5e7eb 0%, #d1d5db 100%);
                transition: all 0.3s ease;
            }
            .btn-light:hover {
                background: linear-gradient(135deg, #d1d5db 0%, #9ca3af 100%);
                transform: translateY(-1px);
            }
        </style>
    </head>
    <body class="bg-gray-50">
        <!-- Navigation Header -->
        <nav class="navbar-gradient shadow-lg w-full top-0 z-50">
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
                        <c:if test="${not empty user}">
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
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
            <c:choose>
                <c:when test="${not empty user}">
                    <!-- Welcome Card -->
                    <div class="bg-white rounded-xl shadow-lg p-8 mb-8 border-l-4 border-primary">
                        <div class="flex items-center justify-between">
                            <div>
                                <h2 class="text-2xl font-bold text-gray-900 mb-2">Welcome to Admin Panel</h2>
                                <p class="text-gray-600">Manage your educational platform efficiently</p>
                            </div>
                            <div class="flex space-x-3">
                                <button class="btn-light text-gray-700 px-4 py-2 rounded-lg font-medium">
                                    <a href="UserProfile" class="text-gray-700 no-underline">User Profile</a>
                                </button>
                                <button class="bg-red-500 hover:bg-red-600 text-white px-4 py-2 rounded-lg font-medium transition-colors duration-200">
                                    <a href="Logout" class="text-white no-underline">Logout</a>
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- First Row: 3 Cards -->
                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
                        <!-- Exam Management -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 card-hover">
                            <div class="flex items-center justify-between mb-4">
                                <h3 class="text-xl font-bold text-gray-900">Exam Management</h3>
                                <div class="bg-blue-100 p-3 rounded-full">
                                    <i class="fas fa-file-alt text-blue-600 text-xl"></i>
                                </div>
                            </div>
                            <p class="text-gray-600 text-sm mb-6">Create and manage exams for your students</p>

                            <div class="space-y-3">
                                <a href="${pageContext.request.contextPath}/adminhome/exam_creation" class="btn-primary block text-center py-3 px-4 rounded-lg text-white font-medium no-underline">
                                    <i class="fas fa-plus mr-2"></i>Create Exam
                                </a>
                                <a href="${pageContext.request.contextPath}/adminhome/all_exam" class="btn-light block text-center py-3 px-4 rounded-lg text-gray-700 font-medium no-underline">
                                    <i class="fas fa-eye mr-2"></i>View All Exams
                                </a>
                            </div>
                        </div>

                        <!-- Question Bank -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 card-hover">
                            <div class="flex items-center justify-between mb-4">
                                <h3 class="text-xl font-bold text-gray-900">Question Bank</h3>
                                <div class="bg-green-100 p-3 rounded-full">
                                    <i class="fas fa-question-circle text-green-600 text-xl"></i>
                                </div>
                            </div>
                            <p class="text-gray-600 text-sm mb-6">Manage your question database</p>

                            <div class="space-y-3">
                                <a href="${pageContext.request.contextPath}/adminhome/question_creation" class="btn-success block text-center py-3 px-4 rounded-lg text-white font-medium no-underline">
                                    <i class="fas fa-plus mr-2"></i>Create Question
                                </a>
                                <a href="${pageContext.request.contextPath}/adminhome/all_question" class="btn-light block text-center py-3 px-4 rounded-lg text-gray-700 font-medium no-underline">
                                    <i class="fas fa-list mr-2"></i>View All Questions
                                </a>
                            </div>
                        </div>

                        <!-- Academic Setup -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 card-hover">
                            <div class="flex items-center justify-between mb-4">
                                <h3 class="text-xl font-bold text-gray-900">Academic Setup</h3>
                                <div class="bg-purple-100 p-3 rounded-full">
                                    <i class="fas fa-graduation-cap text-purple-600 text-xl"></i>
                                </div>
                            </div>
                            <p class="text-gray-600 text-sm mb-6">Configure majors and subjects</p>

                            <div class="space-y-3">
                                <a href="${pageContext.request.contextPath}/adminhome/major_creation" class="btn-purple block text-center py-3 px-4 rounded-lg text-white font-medium no-underline">
                                    <i class="fas fa-university mr-2"></i>Major Creation
                                </a>
                                <a href="${pageContext.request.contextPath}/adminhome/subject_creation" class="btn-light block text-center py-3 px-4 rounded-lg text-gray-700 font-medium no-underline">
                                    <i class="fas fa-book mr-2"></i>Subject Creation
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Second Row: User Management + Quick Overview -->
                    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
                        <!-- User Management -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6 card-hover">
                            <div class="flex items-center justify-between mb-4">
                                <h3 class="text-xl font-bold text-gray-900">User Management</h3>
                                <div class="bg-orange-100 p-3 rounded-full">
                                    <i class="fas fa-users text-orange-600 text-xl"></i>
                                </div>
                            </div>
                            <p class="text-gray-600 text-sm mb-6">Manage system users and permissions</p>

                            <div class="space-y-3">
                                <a href="UserManagement" class="btn-orange block text-center py-3 px-4 rounded-lg text-white font-medium no-underline">
                                    <i class="fas fa-users mr-2"></i>Manage Users
                                </a>
                                <a href="statics" class="btn-light block text-center py-3 px-4 rounded-lg text-gray-700 font-medium no-underline">
                                    <i class="fas fa-chart-bar mr-2"></i>Statistics
                                </a>
                            </div>
                        </div>

                        <!-- Quick Overview (spans 2 columns) -->
                        <div class="lg:col-span-2 bg-white rounded-xl shadow-sm border border-gray-200 p-6">
                            <h3 class="text-xl font-bold text-gray-900 mb-6">Quick Overview</h3>

                            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                                <div class="text-center p-4 bg-blue-50 rounded-lg">
                                    <div class="bg-blue-100 w-12 h-12 rounded-full flex items-center justify-center mx-auto mb-3">
                                        <i class="fas fa-file-alt text-blue-600"></i>
                                    </div>
                                    <h4 class="text-2xl font-bold text-blue-600">${countExam}</h4>
                                    <p class="text-gray-600 text-sm">Exams</p>
                                </div>

                                <div class="text-center p-4 bg-green-50 rounded-lg">
                                    <div class="bg-green-100 w-12 h-12 rounded-full flex items-center justify-center mx-auto mb-3">
                                        <i class="fas fa-question-circle text-green-600"></i>
                                    </div>
                                    <h4 class="text-2xl font-bold text-green-600">${countQuestion}</h4>
                                    <p class="text-gray-600 text-sm">Questions</p>
                                </div>

                                <div class="text-center p-4 bg-purple-50 rounded-lg">
                                    <div class="bg-purple-100 w-12 h-12 rounded-full flex items-center justify-center mx-auto mb-3">
                                        <i class="fas fa-graduation-cap text-purple-600"></i>
                                    </div>
                                    <h4 class="text-2xl font-bold text-purple-600">${countSubject}</h4>
                                    <p class="text-gray-600 text-sm">Subjects</p>
                                </div>

                                <div class="text-center p-4 bg-orange-50 rounded-lg">
                                    <div class="bg-orange-100 w-12 h-12 rounded-full flex items-center justify-center mx-auto mb-3">
                                        <i class="fas fa-users text-orange-600"></i>
                                    </div>
                                    <h4 class="text-2xl font-bold text-orange-600">${countUser}</h4>
                                    <p class="text-gray-600 text-sm">Users</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- Not logged in state -->
                    <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-8 text-center">
                        <div class="bg-red-100 w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">
                            <i class="fas fa-exclamation-triangle text-red-600 text-2xl"></i>
                        </div>
                        <h2 class="text-2xl font-bold text-gray-900 mb-2">Access Denied</h2>
                        <p class="text-gray-600 mb-6">You need to log in as an administrator to access this page.</p>
                        <a href="login.jsp" class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg font-medium transition-colors">
                            <i class="fas fa-sign-in-alt mr-2"></i>Go to Login
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
        </main>

        <!-- Footer -->
        <footer class="bg-white border-t border-gray-200 mt-12">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
                <div class="text-center text-gray-600">
                    <p>&copy; 2025 Exam Management System. All rights reserved.</p>
                </div>
            </div>
        </footer>

        <script>
            // Add smooth hover effects and interactions
            document.addEventListener('DOMContentLoaded', function () {
                // Add visual feedback for all links
                const allLinks = document.querySelectorAll('a');
                allLinks.forEach(link => {
                    link.addEventListener('click', function () {
                        // Add visual feedback
                        this.style.transform = 'scale(0.95)';
                        setTimeout(() => {
                            this.style.transform = 'scale(1)';
                        }, 150);
                    });
                });

                // Add welcome animation
                const welcomeCard = document.querySelector('main > div:first-child');
                if (welcomeCard) {
                    welcomeCard.style.opacity = '0';
                    welcomeCard.style.transform = 'translateY(20px)';
                    setTimeout(() => {
                        welcomeCard.style.transition = 'all 0.6s ease';
                        welcomeCard.style.opacity = '1';
                        welcomeCard.style.transform = 'translateY(0)';
                    }, 100);
                }
            });
        </script>
    </body>
</html>
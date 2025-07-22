<%-- 
    Document   : view_exam_log.jsp
    Created on : Jul 2, 2025, 3:49:34 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Exam Log</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/js/all.min.js"></script>
        <style>
            .card-hover {
                transition: all 0.3s ease;
            }
            .card-hover:hover {
                background-color: #f8fafc;
                transform: translateY(-1px);
            }
            .btn-hover {
                transition: all 0.2s ease;
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
        </style>
    </head>
    <body class="bg-gray-50 min-h-screen">
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
        <main class="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="mb-6 bg-red-50 border-l-4 border-red-500 p-4 rounded-r-lg shadow-sm">
                    <div class="flex items-center">
                        <i class="fas fa-exclamation-triangle text-red-500 mr-3"></i>
                        <p class="text-red-700 font-medium">${error}</p>
                    </div>
                </div>
            </c:if>

            <!-- Exam Log Dashboard -->

            <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                <div class="bg-gradient-to-r from-blue-600 to-indigo-600 px-8 py-6">
                    <div class="flex items-center justify-between">
                        <div>
                            <h2 class="text-2xl font-bold text-white flex items-center">
                                <i class="fas fa-clipboard-list mr-3"></i>
                                Exam Activity Log
                            </h2>
                            <p class="text-blue-100 mt-2">Monitor and track detailed exam activities</p>
                        </div>
                        <div class="text-right">
                            <div class="text-3xl font-bold text-white">
                                <c:choose>
                                    <c:when test="${not empty logs}">
                                        ${logs.size()}
                                    </c:when>
                                    <c:otherwise>0</c:otherwise>
                                </c:choose>
                            </div>
                            <div class="text-blue-100 text-sm">Total Log Entries</div>
                        </div>
                    </div>
                </div>


                <!-- Log Entries -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden">
                    <div class="divide-y divide-gray-200">
                        <c:choose>
                            <c:when test="${not empty logs}">
                                <c:forEach var="log" items="${logs}" varStatus="status">
                                    <div class="p-6 hover:bg-gray-50 transition-colors duration-150">
                                        <div class="flex items-start space-x-4">
                                            <!-- Dynamic icon based on log content -->
                                            <div class="bg-blue-100 p-2 rounded-full flex-shrink-0">
                                                <c:choose>
                                                    <c:when test="${log.information.contains('login') or log.information.contains('Login')}">
                                                        <i class="fas fa-sign-in-alt text-green-600"></i>
                                                    </c:when>
                                                    <c:when test="${log.information.contains('started') or log.information.contains('Start')}">
                                                        <i class="fas fa-play text-blue-600"></i>
                                                    </c:when>
                                                    <c:when test="${log.information.contains('submitted') or log.information.contains('Submit')}">
                                                        <i class="fas fa-check-circle text-purple-600"></i>
                                                    </c:when>
                                                    <c:when test="${log.information.contains('error') or log.information.contains('Error')}">
                                                        <i class="fas fa-exclamation-triangle text-red-600"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fas fa-info-circle text-blue-600"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="flex-1 min-w-0">
                                                <div class="flex items-center justify-between mb-2">
                                                    <p class="text-sm font-medium text-gray-900">Log Entry #${status.count}</p>
                                                    <span class="text-xs text-gray-500 bg-gray-100 px-2 py-1 rounded-full">
                                                        ${log.formattedTime}
                                                    </span>
                                                </div>
                                                <p class="text-sm text-gray-600">${log.information}</p>
                                                <div class="mt-2 flex items-center text-xs text-gray-500">
                                                    <i class="fas fa-clock mr-1"></i>
                                                    <span>${log.formattedTime}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div class="p-12 text-center">
                                    <div class="bg-gray-100 p-4 rounded-full w-16 h-16 mx-auto mb-4 flex items-center justify-center">
                                        <i class="fas fa-inbox text-gray-400 text-xl"></i>
                                    </div>
                                    <h3 class="text-lg font-medium text-gray-900 mb-2">No logs available</h3>
                                    <p class="text-gray-500">There are no exam log entries to display at this time.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <!-- Action Bar -->
            <div class="mt-8 flex flex-col sm:flex-row gap-4 justify-between items-center">
                <a href="javascript:history.back()" 
                   class="btn-hover inline-flex items-center px-6 py-3 border border-gray-300 rounded-lg text-gray-700 bg-white hover:bg-gray-50 font-medium shadow-sm">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Go Back 
                </a>
            </div>
        </main>
    </body>
</html>
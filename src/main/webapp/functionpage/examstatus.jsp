<%-- 
    Document   : examstatus
    Created on : Jun 30, 2025, 9:07:44 AM
    Author     : MasterLong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Exam Status Dashboard</title>
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
            .countdown-text {
                font-family: 'Courier New', monospace;
                font-weight: bold;
            }
        </style>
        <script>
            function startCountdown(endTime, elementIndexId) {
                function update() {
                    const now = Date.now();
                    let diff = endTime - now;

                    if (diff <= 0) {
                        document.getElementById("countdown" + elementIndexId).innerText = "00:00:00";
                        document.getElementById("status" + elementIndexId).innerText = "Exam Finished";
                        document.getElementById("status" + elementIndexId).className = "px-3 py-1 rounded-full text-sm bg-red-100 text-red-700";
                        return;
                    }

                    const hours = Math.floor(diff / 3600000);
                    const minutes = Math.floor((diff % 3600000) / 60000);
                    const seconds = Math.floor((diff % 60000) / 1000);

                    document.getElementById("status" + elementIndexId).innerText = "Exam Ongoing";
                    document.getElementById("status" + elementIndexId).className = "px-3 py-1 rounded-full text-sm bg-green-100 text-green-700";
                    document.getElementById("countdown" + elementIndexId).innerText =
                            (hours < 10 ? "0" : "") + hours + ":" +
                            (minutes < 10 ? "0" : "") + minutes + ":" +
                            (seconds < 10 ? "0" : "") + seconds;
                }

                update();
                setInterval(update, 1000);
            }
        </script>
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
            <!-- Exam Status Dashboard -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                <div class="bg-gradient-to-r from-blue-600 to-indigo-600 px-8 py-6">
                    <h2 class="text-2xl font-bold text-white flex items-center">
                        <i class="fas fa-chart-bar mr-3"></i>
                        Exam Status Dashboard
                    </h2>
                    <p class="text-blue-100 mt-2">Monitor ongoing and completed exams in real-time</p>
                </div>

                <!-- Summary Stats -->
                <div class="bg-gray-50 px-8 py-6 border-b border-gray-200">
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                        <div class="text-center">
                            <div class="text-2xl font-bold text-green-600">${doing}</div>
                            <div class="text-sm text-gray-600">Active Exams</div>
                        </div>
                        <div class="text-center">
                            <div class="text-2xl font-bold text-blue-600">${done}</div>
                            <div class="text-sm text-gray-600">Completed</div>
                        </div>
                        <div class="text-center">
                            <div class="text-2xl font-bold text-red-600">${suspend}</div>
                            <div class="text-sm text-gray-600">Suspended</div>
                        </div>
                        <div class="text-center">
                            <div class="text-2xl font-bold text-purple-600">${total}</div>
                            <div class="text-sm text-gray-600">Total Students</div>
                        </div>
                    </div>
                </div>

                <!-- Check if student exams exist -->
                <c:choose>
                    <c:when test="${not empty listStudentExam}">
                        <!-- Table Header -->
                        <div class="bg-gray-50 px-8 py-4 border-b border-gray-200">
                            <div class="grid grid-cols-6 gap-6 text-sm font-medium text-gray-700">
                                <div class="text-left">Student ID</div>
                                <div class="text-left">Student Name</div>
                                <div class="text-left">Start Time</div>
                                <div class="text-center">Time Remaining</div>
                                <div class="text-center">Status</div>
                                <div class="text-center">Actions</div>
                            </div>
                        </div>

                        <!-- Student Exam Items -->
                        <div class="divide-y divide-gray-200">
                            <c:forEach var="studentExam" items="${listStudentExam}" varStatus="status">
                                <!-- Gán vào pageContext để scriptlet có thể truy cập -->
                                <c:set var="studentExam" value="${studentExam}" scope="page" />

                                <div class="p-6 card-hover">
                                    <%
                                        java.time.LocalDateTime endTime = ((model.exam.student.StudentExam) pageContext.getAttribute("studentExam")).getEndTime();
                                        long endMillis = endTime.atZone(java.time.ZoneId.systemDefault()).toInstant().toEpochMilli();
                                        request.setAttribute("endMillis", endMillis);
                                    %>

                                    <div class="grid grid-cols-6 gap-6 items-center">
                                        <!-- Student Code -->
                                        <div class="text-left">
                                            <span class="inline-flex items-center justify-center w-8 h-8 bg-blue-100 text-blue-800 rounded-full text-xs font-medium">
                                                ${studentExam.student.studentCode}
                                            </span>
                                        </div>

                                        <!-- Full Name -->
                                        <div class="text-left">
                                            <div class="text-sm font-medium text-gray-900">
                                                ${studentExam.student.user.firstName} ${studentExam.student.user.lastName}
                                            </div>
                                        </div>

                                        <!-- Start Time -->
                                        <div class="text-left">
                                            <div class="text-sm text-gray-600">
                                                ${studentExam.startTimeFormatted}
                                            </div>
                                        </div>

                                        <!-- Countdown -->
                                        <div class="text-center">
                                            <div class="bg-blue-50 px-3 py-1 rounded-lg inline-block">
                                                <span id="countdown${status.index}" class="text-blue-600 countdown-text text-sm">Calculating...</span>
                                            </div>
                                        </div>

                                        <!-- Status -->
                                        <div class="text-center">
                                            <c:choose>
                                                <c:when test="${studentExam.examStatus == 3}">
                                                    <span class="px-3 py-1 rounded-full text-sm bg-red-100 text-red-700">Suspended</span>

                                                </c:when>
                                                <c:otherwise>
                                                    <span id="status${status.index}" class="px-3 py-1 rounded-full text-xs bg-green-100 text-green-700">Status...</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <!-- Actions -->
                                        <div class="text-center">
                                            <div class="flex justify-center gap-2">
                                                <!-- Force Submit -->
                                                <c:if test="${studentExam.examStatus == 2}">
                                                    <form action="../ForceSubmit" method="get" class="inline">
                                                        <input type="hidden" name="studentExamId" value="${studentExam.studentExamID}" />
                                                        <button type="submit"
                                                                class="btn-hover bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md text-xs font-medium">
                                                            <i class="fas fa-stop mr-1"></i>Force Submit
                                                        </button>
                                                    </form>
                                                </c:if>

                                                <!-- Exam Log -->
                                                <form action="../ViewExamLog" method="get" class="inline">
                                                    <input type="hidden" name="studentExamId" value="${studentExam.studentExamID}" />
                                                    <button type="submit"
                                                            class="btn-hover bg-purple-600 hover:bg-purple-700 text-white px-3 py-1 rounded-md text-xs font-medium">
                                                        <i class="fas fa-eye mr-1"></i>View Log
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Countdown Script -->
                                <script>
                                    startCountdown(${endMillis}, "${status.index}");
                                </script>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Empty State -->
                        <div class="p-12 text-center">
                            <div class="bg-gray-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                                <i class="fas fa-chart-bar text-gray-400 text-2xl"></i>
                            </div>
                            <h3 class="text-lg font-medium text-gray-900 mb-2">No exam sessions found</h3>
                            <p class="text-gray-600 mb-6">There are currently no active or completed exam sessions to display</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Action Bar -->
            <div class="mt-8 flex flex-col sm:flex-row gap-4 justify-between items-center">
                <a href="${pageContext.request.contextPath}/adminhome" 
                   class="btn-hover inline-flex items-center px-6 py-3 border border-gray-300 rounded-lg text-gray-700 bg-white hover:bg-gray-50 font-medium shadow-sm">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Go Back 
                </a>
            </div>
        </main>
    </body>
</html>
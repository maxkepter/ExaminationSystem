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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
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
    <script>
        function startCountdown(endTime, elementIndexId) {
            function update() {
                const now = Date.now();
                let diff = endTime - now;

                if (diff <= 0) {
                    document.getElementById("countdown" + elementIndexId).innerText = "00:00:00";
                    document.getElementById("status" + elementIndexId).innerText = "Exam Finished";
                    document.getElementById("status" + elementIndexId).className = "inline-flex items-center px-3 py-1 rounded-full text-sm bg-red-100 text-red-700";
                    // Update countdown background to gray
                    document.getElementById("countdown" + elementIndexId).parentElement.className = "bg-gray-100 px-3 py-2 rounded-lg inline-block";
                    document.getElementById("countdown" + elementIndexId).className = "text-gray-500 font-mono text-sm";
                    // Hide force submit button
                    const button = document.getElementById("button" + elementIndexId);
                    if (button) {
                        button.style.display = "none";
                        button.parentElement.innerHTML = '<div class="bg-gray-200 text-gray-600 py-2 px-4 rounded-lg text-sm">Completed</div>';
                    }
                    return;
                }

                const hours = Math.floor(diff / 3600000);
                const minutes = Math.floor((diff % 3600000) / 60000);
                const seconds = Math.floor((diff % 60000) / 1000);

                // Update status based on time remaining
                if (diff <= 900000) { // Less than 15 minutes
                    document.getElementById("status" + elementIndexId).innerText = "Almost Done";
                    document.getElementById("status" + elementIndexId).className = "inline-flex items-center px-3 py-1 rounded-full text-sm bg-yellow-100 text-yellow-700";
                    document.getElementById("countdown" + elementIndexId).parentElement.className = "bg-yellow-50 px-3 py-2 rounded-lg inline-block";
                    document.getElementById("countdown" + elementIndexId).className = "text-yellow-600 font-mono text-sm";
                } else if (diff <= 3600000) { // Less than 1 hour
                    document.getElementById("status" + elementIndexId).innerText = "Exam Ongoing";
                    document.getElementById("status" + elementIndexId).className = "inline-flex items-center px-3 py-1 rounded-full text-sm bg-green-100 text-green-700";
                    document.getElementById("countdown" + elementIndexId).parentElement.className = "bg-green-50 px-3 py-2 rounded-lg inline-block";
                    document.getElementById("countdown" + elementIndexId).className = "text-green-600 font-mono text-sm";
                } else {
                    document.getElementById("status" + elementIndexId).innerText = "Exam Ongoing";
                    document.getElementById("status" + elementIndexId).className = "inline-flex items-center px-3 py-1 rounded-full text-sm bg-green-100 text-green-700";
                    document.getElementById("countdown" + elementIndexId).parentElement.className = "bg-blue-50 px-3 py-2 rounded-lg inline-block";
                    document.getElementById("countdown" + elementIndexId).className = "text-blue-600 font-mono text-sm";
                }

                document.getElementById("countdown" + elementIndexId).innerText =
                        (hours < 10 ? "0" : "") + hours + ":" +
                        (minutes < 10 ? "0" : "") + minutes + ":" +
                        (seconds < 10 ? "0" : "") + seconds;
            }

            update();
            setInterval(update, 1000);
        }

        function forceSubmit(studentExamId, elementId) {
            currentForceSubmitId = studentExamId;
            document.getElementById('forceSubmitModal').classList.remove('hidden');
            document.getElementById('forceSubmitModal').classList.add('flex');
        }

        let currentForceSubmitId = null;

        function confirmForceSubmit() {
            if (currentForceSubmitId) {
                // Add your force submit logic here
                console.log('Force submitting exam for student:', currentForceSubmitId);
                // You can make an AJAX call to your servlet here
                
                // Close modal after submission
                closeForceSubmitModal();
            }
        }

        function closeForceSubmitModal() {
            document.getElementById('forceSubmitModal').classList.add('hidden');
            document.getElementById('forceSubmitModal').classList.remove('flex');
            currentForceSubmitId = null;
        }

        // Close modal when clicking outside
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('forceSubmitModal').addEventListener('click', function (e) {
                if (e.target === this) {
                    closeForceSubmitModal();
                }
            });

            // Close modal with Escape key
            document.addEventListener('keydown', function (e) {
                if (e.key === 'Escape') {
                    closeForceSubmitModal();
                }
            });
        });
    </script>
</head>

<body class="bg-grey from-blue-50 to-indigo-100 min-h-screen">
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

    <div class="container mx-auto px-4 py-8" style="margin-top: 100px;">
        <!-- Header -->
        <div class="mb-8">
            <div class="flex items-center justify-between flex-wrap gap-4">
                <h1 class="text-3xl font-bold text-gray-800">
                    <i class="fas fa-clock text-indigo-600 mr-3"></i>
                    Exam Status Dashboard
                </h1>
                <a href="all_exam"
                   class="back-button bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-md transition flex items-center">
                    <i class="fas fa-arrow-left mr-2"></i>
                    Go Back
                </a>
            </div>
            <p class="text-gray-600 mt-2">Monitor ongoing and completed exams in real-time</p>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="mb-6 p-4 bg-red-100 border border-red-400 text-red-700 rounded-lg shadow-sm">
                <i class="fas fa-exclamation-triangle mr-2"></i>
                <span>${error}</span>
            </div>
        </c:if>

        <!-- Exam Status Table Card -->
        <div class="bg-white rounded-xl shadow-lg overflow-hidden">
            <!-- Table Header -->
            <div class="bg-gradient-to-r from-indigo-600 to-purple-600 px-6 py-4">
                <h2 class="text-xl font-semibold text-white">
                    <i class="fas fa-table mr-2"></i>
                    Active Exams
                </h2>
            </div>

            <!-- Table Content -->
            <c:choose>
                <c:when test="${not empty listStudentExam}">
                    <div class="overflow-x-auto">
                        <table class="w-full">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        <i class="fas fa-hashtag mr-2"></i>Exam #
                                    </th>
                                    <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        <i class="fas fa-id-card mr-2"></i>Student ID
                                    </th>
                                    <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        <i class="fas fa-user mr-2"></i>Student Name
                                    </th>
                                    <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        <i class="fas fa-play mr-2"></i>Start Time
                                    </th>
                                    <th class="px-6 py-4 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        <i class="fas fa-hourglass-half mr-2"></i>Time Remaining
                                    </th>
                                    <th class="px-6 py-4 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        <i class="fas fa-info-circle mr-2"></i>Status
                                    </th>
                                    <th class="px-6 py-4 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                        <i class="fas fa-cog mr-2"></i>Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200">
                                <c:forEach var="studentExam" items="${listStudentExam}" varStatus="status">
                                    <%
                                        java.time.LocalDateTime endTime = ((model.exam.student.StudentExam) pageContext.getAttribute("studentExam")).getEndTime();
                                        long endMillis = endTime.atZone(java.time.ZoneId.systemDefault()).toInstant().toEpochMilli();
                                        request.setAttribute("endMillis", endMillis);
                                    %>
                                    <tr class="hover:bg-gray-50 transition-colors duration-200">
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div class="w-8 h-8 bg-indigo-100 rounded-full flex items-center justify-center mr-3">
                                                    <span class="text-indigo-600 font-semibold text-sm">${status.index + 1}</span>
                                                </div>
                                                <span class="text-sm font-medium text-gray-900">${status.index + 1}</span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm font-medium text-gray-900">${studentExam.student.studentCode}</div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="flex items-center">
                                                <div>
                                                    <div class="text-sm font-semibold text-gray-900">${studentExam.student.user.firstName} ${studentExam.student.user.lastName}</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap">
                                            <div class="text-sm text-gray-600">
                                                <c:set var="startTime" value="${studentExam.startTime}" />
                                                <i class="fas fa-clock mr-1"></i>
                                                ${startTime.toString().substring(11, 16)}
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-center">
                                            <div class="bg-blue-50 px-3 py-2 rounded-lg inline-block">
                                                <span id="countdown${status.index}" class="text-blue-600 font-mono text-sm">
                                                    <i class="fas fa-spinner fa-spin mr-1"></i>Calculating...
                                                </span>
                                            </div>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-center">
                                            <span id="status${status.index}" class="inline-flex items-center px-3 py-1 rounded-full text-sm bg-green-100 text-green-700">
                                                <i class="fas fa-play-circle mr-1"></i>Exam Ongoing
                                            </span>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-center">
                                            <button id="button${status.index}" 
                                                    onclick="forceSubmit('${studentExam.studentExamID}', '${status.index}')"
                                                    class="inline-flex items-center px-4 py-2 bg-red-600 hover:bg-red-700 text-white text-sm font-medium rounded-lg transition-colors duration-200 shadow-sm hover:shadow-md">
                                                <i class="fas fa-stop mr-2"></i>
                                                Force Submit
                                            </button>
                                        </td>
                                    </tr>
                                    <script>
                                        startCountdown(${endMillis}, "${status.index}");
                                    </script>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <!-- Empty State -->
                    <div class="text-center py-12">
                        <i class="fas fa-clipboard-list text-gray-300 text-6xl mb-4"></i>
                        <h3 class="text-lg font-medium text-gray-900 mb-2">No Active Exams</h3>
                        <p class="text-gray-500">There are currently no exams being taken.</p>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Force Submit Confirmation Modal -->
        <div id="forceSubmitModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
            <div class="bg-white rounded-xl shadow-2xl max-w-md w-full mx-4 transform transition-all">
                <div class="p-6">
                    <div class="flex items-center mb-4">
                        <div class="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center mr-4">
                            <i class="fas fa-exclamation-triangle text-red-600 text-xl"></i>
                        </div>
                        <h3 class="text-lg font-semibold text-gray-900">Confirm Force Submit</h3>
                    </div>
                    <p class="text-gray-600 mb-6">
                        Are you sure you want to force submit this exam? This action will immediately end the student's exam session and cannot be undone.
                    </p>
                    <div class="flex space-x-3">
                        <button onclick="closeForceSubmitModal()" class="flex-1 px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-800 font-medium rounded-lg transition-colors duration-200">
                            Cancel
                        </button>
                        <button onclick="confirmForceSubmit()" class="flex-1 px-4 py-2 bg-red-600 hover:bg-red-700 text-white font-medium rounded-lg transition-colors duration-200">
                            <i class="fas fa-stop mr-2"></i>Force Submit
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Update summary stats
        function updateStats() {
            let active = 0;
            let completed = 0;
            let almostDone = 0;
            
            <c:forEach var="studentExam" items="${listStudentExam}" varStatus="status">
                const status${status.index} = document.getElementById("status${status.index}").innerText;
                if (status${status.index}.includes("Exam Ongoing")) {
                    active++;
                } else if (status${status.index}.includes("Exam Finished")) {
                    completed++;
                } else if (status${status.index}.includes("Almost Done")) {
                    almostDone++;
                }
            </c:forEach>
            
            // Update any summary display if needed
            console.log('Active:', active, 'Completed:', completed, 'Almost Done:', almostDone);
        }
        
        // Update stats every 5 seconds
        setInterval(updateStats, 5000);
        setTimeout(updateStats, 1000); // Initial update after 1 second
    </script>
</body>
</html>
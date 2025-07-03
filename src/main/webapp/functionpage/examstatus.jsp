<%-- 
    Document   : examstatus
    Created on : Jun 30, 2025, 9:07:44 AM
    Author     : MasterLong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Status Dashboard</title>
        <script src="https://cdn.tailwindcss.com"></script>
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
    <body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen">
        <div class="container mx-auto px-6 py-8">
            <!-- Header -->
            <div class="mb-8 text-center">
                <h1 class="text-3xl text-gray-800 mb-3">Exam Status Dashboard</h1>
                <p class="text-gray-600">Monitor ongoing and completed exams in real-time</p>
                <div class="w-32 h-1 bg-gradient-to-r from-blue-500 to-indigo-500 mx-auto mt-4 rounded-full"></div>
            </div>

            <!-- Error Message (if any) -->
            <div id="error-message" class="hidden mb-6 p-4 bg-red-50 border border-red-200 rounded-lg">
                <div class="flex items-center">
                    <svg class="w-5 h-5 text-red-400 mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path>
                    </svg>
                    <span class="text-red-800">Error occurred while loading exam data</span>
                </div>
            </div>

            <!-- Exam Table -->
            <div class="bg-white rounded-2xl shadow-xl overflow-hidden border border-gray-200">
                <table class="w-full">
                    <thead class="bg-gradient-to-r from-blue-600 to-indigo-600 text-white">
                        <tr>
                            <th class="px-6 py-4 text-left text-sm">Student ID</th>
                            <th class="px-6 py-4 text-left text-sm">Student Name</th>
                            <th class="px-6 py-4 text-left text-sm">Start Time</th>
                            <th class="px-6 py-4 text-center text-sm">Time Remaining</th>
                            <th class="px-6 py-4 text-center text-sm">Status</th>
                            <th class="px-6 py-4 text-center text-sm">Action</th>
                            <th class="px-6 py-4 text-center text-sm">Exam Log</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">


                        <c:if test="${not empty listStudentExam}">
                            <c:forEach var="studentExam" items="${listStudentExam}" varStatus="status">
                                <!-- Gán vào pageContext để scriptlet có thể truy cập -->
                                <c:set var="studentExam" value="${studentExam}" scope="page" />

                                <tr class="bg-white hover:bg-blue-50 transition-colors duration-200">
                                    <%
                                        java.time.LocalDateTime endTime = ((model.exam.student.StudentExam) pageContext.getAttribute("studentExam")).getEndTime();
                                        long endMillis = endTime.atZone(java.time.ZoneId.systemDefault()).toInstant().toEpochMilli();
                                        request.setAttribute("endMillis", endMillis);
                                    %>

                                    <!-- Student Code -->
                                    <td class="px-6 py-4 text-gray-700">
                                        ${studentExam.student.studentCode}
                                    </td>

                                    <!-- Full Name -->
                                    <td class="px-6 py-4 text-gray-700">
                                        ${studentExam.student.user.firstName} ${studentExam.student.user.lastName}
                                    </td>

                                    <!-- Start Time -->
                                    <td class="px-6 py-4 text-gray-600">
                                        ${studentExam.startTimeFormatted}
                                    </td>

                                    <!-- Countdown -->
                                    <td class="px-6 py-4 text-center">
                                        <div class="bg-blue-50 px-3 py-2 rounded-lg inline-block">
                                            <span id="countdown${status.index}" class="text-blue-600 font-mono text-sm">Calculating...</span>
                                        </div>
                                    </td>

                                    <!-- Status -->
                                    <td class="px-6 py-4 text-center">
                                        <c:choose>
                                            <c:when test="${studentExam.examStatus == 3}">
                                                <span class="px-3 py-1 rounded-full text-sm bg-red-100 text-red-700">Suspended</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span id="status${status.index}" class="px-3 py-1 rounded-full text-sm bg-green-100 text-green-700">Status...</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>


                                    <!-- Force Submit -->
                                    <td class="px-6 py-4 text-center">
                                        <c:if test="${studentExam.examStatus == 2}">
                                            <form action="../ForceSubmit" method="get">
                                                <input type="hidden" name="studentExamId" value="${studentExam.studentExamID}" />
                                                <button type="submit"
                                                        class="bg-red-500 hover:bg-red-600 text-white py-2 px-4 rounded-lg transition-colors text-sm shadow-sm hover:shadow-md">
                                                    Force Submit
                                                </button>
                                            </form>
                                        </c:if>
                                    </td>

                                    <!-- Exam Log -->
                                    <td class="px-6 py-4 text-center">
                                        <form action="../ViewExamLog" method="get">
                                            <input type="hidden" name="studentExamId" value="${studentExam.studentExamID}" />
                                            <button type="submit"
                                                    class="bg-red-500 hover:bg-red-600 text-white py-2 px-4 rounded-lg transition-colors text-sm shadow-sm hover:shadow-md">
                                                View
                                            </button>
                                        </form>

                                    </td>
                                </tr>

                                <!-- Countdown Script -->
                            <script>
                                startCountdown(${endMillis}, "${status.index}");
                            </script>
                        </c:forEach>
                    </c:if>




                    </tbody>
                </table>
            </div>

            <!-- Summary Stats -->
            <div class="mt-10 grid grid-cols-1 md:grid-cols-4 gap-6">
                <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 text-center hover:shadow-xl transition-shadow">
                    <div class="text-2xl text-green-600 mb-2">${doing}</div>
                    <div class="text-gray-600 text-sm">Active Exams</div>
                </div>

                <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 text-center hover:shadow-xl transition-shadow">
                    <div class="text-2xl text-red-600 mb-2">${done}</div>
                    <div class="text-gray-600 text-sm">Completed Exams</div>
                </div>

                <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 text-center hover:shadow-xl transition-shadow">
                    <div class="text-2xl text-yellow-600 mb-2">${suspend}</div>
                    <div class="text-gray-600 text-sm">Suspended</div>
                </div>

                <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 text-center hover:shadow-xl transition-shadow">
                    <div class="text-2xl text-blue-600 mb-2">${total}</div>
                    <div class="text-gray-600 text-sm">Total Students</div>
                </div>
            </div>

        </div>      

    </body>
</html>
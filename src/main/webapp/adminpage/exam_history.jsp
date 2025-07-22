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
        <!-- (Giữ nguyên phần <style> cũ) -->
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
    </head>
    <body>
        <!-- Main Container -->
        <div class="flex pt-16 min-h-screen">
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

            <!-- Main Content -->
            <main class="flex-1 p-6 md:p-8 bg-gray-50">
                <div class="max-w-6xl mx-auto">
                    <!-- Page Header -->
                    <div class="mb-8">
                        <div class="flex items-center justify-between">
                            <div>
                                <h1 class="text-2xl font-bold text-gray-800 flex items-center">
                                    <i class="fas fa-eye mr-3 text-indigo-600"></i> Exam History
                                </h1>
                                <p class="text-gray-600 mt-1">View student's examination records and performance</p>
                            </div>
                            <!-- Back Button -->
                            <a href="adminhome" class="back-button bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-md transition flex items-center">
                                <i class="fas fa-arrow-left mr-2"></i>
                                Back to Home
                            </a>
                        </div>
                    </div>

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
                                        <!-- Giả sử URL này vẫn đúng. Nếu back‑end cũng đổi, bạn tự điều chỉnh thêm -->
                                        <a href="${pageContext.request.contextPath}/ViewStudentExam?studentExamID=${studentExam.studentExamID}&id=${userId}" 
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
                                <p class="text-gray-400">Student haven't taken any exams yet.</p>
                            </div>
                        </c:if>
                    </div>

                    <!-- Pagination Section -->
                    <c:if test="${not empty studentExams}">
                        <div class="bg-white rounded-lg shadow-sm p-6 border border-gray-200">
                            <div class="flex items-center justify-between">
                                <!-- Page Navigation Buttons -->
                                <div class="flex items-center space-x-2">
                                    <!-- Previous -->
                                    <form action="UserExamHistory" method="get" class="inline">
                                        <input type="hidden" name="id" value="${userId}">
                                        <c:if test="${numPage > 0}">
                                            <button type="submit" name="numPage" value="${numPage - 1}" 
                                                    class="bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-md transition flex items-center">
                                                <i class="fas fa-chevron-left mr-2"></i>
                                                Previous
                                            </button>
                                        </c:if>
                                    </form>

                                    <!-- Current Page (disabled) -->
                                    <form action="UserExamHistory" method="get" class="inline">
                                        <input type="hidden" name="id" value="${userId}">
                                        <button type="submit" name="numPage" value="${numPage}" 
                                                class="bg-indigo-600 text-white font-medium py-2 px-4 rounded-md">
                                            Page ${numPage + 1}
                                        </button>
                                    </form>

                                    <!-- Next -->
                                    <form action="UserExamHistory" method="get" class="inline">
                                        <input type="hidden" name="id" value="${userId}">
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
                                    <form action="UserExamHistory" method="get" onsubmit="return adjustPageNumber()" class="flex items-center space-x-2">
                                        <label for="numPage" class="text-sm font-medium text-gray-700">Go to page:</label>
                                        <input type="hidden" name="id" value="${userId}">
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
            document.getElementById('mobile-menu-button').addEventListener('click', function () {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('active');
            });
        </script>
    </body>
</html>

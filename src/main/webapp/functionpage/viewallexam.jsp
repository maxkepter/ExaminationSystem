<%-- 
    Document   : viewallexam
    Created on : Jun 3, 2025, 3:37:46 PM
    Author     : MasterLong
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Exam Management - View All Exams</title>
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
            .input-field {
                transition: all 0.2s ease;
            }
            .input-field:hover {
                border-color: #3b82f6;
            }
            .input-field:focus {
                border-color: #2563eb;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.1);
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
            <!-- Exams List -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                <div class="bg-gradient-to-r from-blue-600 to-indigo-600 px-8 py-6">
                    <h2 class="text-2xl font-bold text-white flex items-center">
                        <i class="fas fa-list-alt mr-3"></i>
                        All Examinations
                    </h2>
                    <p class="text-blue-100 mt-2">View, edit, and manage your exams</p>
                </div>

                <!-- Check if exams exist -->
                <c:choose>
                    <c:when test="${not empty exams}">
                        <!-- Table Header -->
                        <div class="bg-gray-50 px-8 py-4 border-b border-gray-200">
                            <div class="grid grid-cols-12 gap-4 text-sm font-medium text-gray-700">
                                <div class="col-span-1">#</div>
                                <div class="col-span-3">Exam Name</div>
                                <div class="col-span-2">Duration (min)</div>
                                <div class="col-span-2">Exam Code</div>
                                <div class="col-span-4">Actions</div>
                            </div>
                        </div>

                        <!-- Exam Items -->
                        <div class="divide-y divide-gray-200">
                            <c:forEach var="exam" items="${exams}" varStatus="status">
                                <div class="p-6 card-hover">
                                    <form action="${pageContext.request.contextPath}/HandleViewAllExam" method="get">
                                        <div class="grid grid-cols-12 gap-4 items-center">
                                            <div class="col-span-1">
                                                <span class="inline-flex items-center justify-center w-8 h-8 bg-blue-100 text-blue-800 rounded-full text-sm font-medium">
                                                    ${status.index + 1}
                                                </span>
                                            </div>
                                            <div class="col-span-3">
                                                <input type="hidden" name="id" value="${exam.examID}">
                                                <input type="text" name="examName" value="${exam.examName}" 
                                                       class="input-field w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none text-sm">
                                            </div>
                                            <div class="col-span-2">
                                                <input type="number" name="duration" value="${exam.duration}" 
                                                       class="input-field w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none text-sm">
                                            </div>
                                            <div class="col-span-2">
                                                <input type="text" name="examCode" value="${exam.examCode}" readonly 
                                                       class="w-full px-3 py-2 bg-gray-100 border border-gray-300 rounded-lg text-sm text-gray-600">
                                            </div>
                                            <div class="col-span-4">
                                                <div class="flex flex-wrap gap-2">
                                                    <button type="submit" name="update" value="Update" 
                                                            class="btn-hover bg-green-600 hover:bg-green-700 text-white px-3 py-1 rounded-md text-xs font-medium">
                                                        <i class="fas fa-edit mr-1"></i>Update
                                                    </button>
                                                    <button type="submit" name="delete" value="Delete" 
                                                            class="btn-hover bg-red-600 hover:bg-red-700 text-white px-3 py-1 rounded-md text-xs font-medium delete-btn">
                                                        <i class="fas fa-trash mr-1"></i>Delete
                                                    </button>
                                                    <button type="submit" name="viewDetail" value="View Detail" 
                                                            class="btn-hover bg-blue-600 hover:bg-blue-700 text-white px-3 py-1 rounded-md text-xs font-medium">
                                                        <i class="fas fa-eye mr-1"></i>Detail
                                                    </button>
                                                    <button type="submit" name="viewStatus" value="View Status" 
                                                            class="btn-hover bg-purple-600 hover:bg-purple-700 text-white px-3 py-1 rounded-md text-xs font-medium">
                                                        <i class="fas fa-chart-bar mr-1"></i>Status
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Empty State -->
                        <div class="p-12 text-center">
                            <div class="bg-gray-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                                <i class="fas fa-clipboard-list text-gray-400 text-2xl"></i>
                            </div>
                            <h3 class="text-lg font-medium text-gray-900 mb-2">No exams found</h3>
                            <p class="text-gray-600 mb-6">Get started by creating your first exam</p>
                            <a href="${pageContext.request.contextPath}/adminhome/exam_creation" 
                               class="inline-flex items-center px-6 py-3 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium btn-hover">
                                <i class="fas fa-plus mr-2"></i>
                                Create New Exam
                            </a>
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

                <div class="flex gap-4">
                    <a href="${pageContext.request.contextPath}/adminhome/exam_creation" 
                       class="btn-hover inline-flex items-center px-6 py-3 bg-gradient-to-r from-blue-600 to-indigo-600 text-white rounded-lg font-medium hover:from-blue-700 hover:to-indigo-700 shadow-sm">
                        <i class="fas fa-plus mr-2"></i>
                        Create New Exam
                    </a>
                </div>
            </div>
        </main>

        <script>
            // Add confirmation for delete actions
            document.addEventListener('DOMContentLoaded', function () {
                const deleteButtons = document.querySelectorAll('.delete-btn');
                deleteButtons.forEach(button => {
                    button.addEventListener('click', function (e) {
                        if (!confirm('Are you sure you want to delete this exam? This action cannot be undone.')) {
                            e.preventDefault();
                        }
                    });
                });
            });

            // Export function placeholder
            function exportExams() {
                alert('Export functionality would be implemented here');
            }
        </script>
    </body>
</html>
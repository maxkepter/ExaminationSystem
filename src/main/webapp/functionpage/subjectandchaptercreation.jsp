<%-- 
    Document   : subjectcreation
    Created on : Jun 15, 2025, 5:25:15 PM
    Author     : MasterLong
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Create Subject & Chapters Academic Management</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Inter:wght@300;400;500;600;700&display=swap');
            body {
                font-family: 'Inter', sans-serif;
            }

            .form-container {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                min-height: 100vh;
            }

            .glass-effect {
                background: rgba(255, 255, 255, 0.95);
                backdrop-filter: blur(10px);
                border: 1px solid rgba(255, 255, 255, 0.2);
            }

            .input-focus:focus, .select-focus:focus {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
            }

            .btn-hover:hover {
                transform: translateY(-2px);
                box-shadow: 0 10px 25px rgba(102, 126, 234, 0.4);
            }

            .success-animation {
                animation: slideInFromTop 0.5s ease-out;
            }

            .error-animation {
                animation: shake 0.5s ease-in-out;
            }

            @keyframes slideInFromTop {
                0% {
                    opacity: 0;
                    transform: translateY(-20px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes shake {
                0%, 100% {
                    transform: translateX(0);
                }
                25% {
                    transform: translateX(-5px);
                }
                75% {
                    transform: translateX(5px);
                }
            }

            .floating-shapes {
                position: absolute;
                width: 100%;
                height: 100%;
                overflow: hidden;
                z-index: 0;
            }

            .shape {
                position: absolute;
                background: rgba(255, 255, 255, 0.1);
                border-radius: 50%;
                animation: float 6s ease-in-out infinite;
            }

            .shape:nth-child(1) {
                width: 80px;
                height: 80px;
                top: 20%;
                left: 10%;
                animation-delay: 0s;
            }

            .shape:nth-child(2) {
                width: 120px;
                height: 120px;
                top: 60%;
                right: 10%;
                animation-delay: 2s;
            }

            .shape:nth-child(3) {
                width: 60px;
                height: 60px;
                bottom: 20%;
                left: 20%;
                animation-delay: 4s;
            }

            @keyframes float {
                0%, 100% {
                    transform: translateY(0px) rotate(0deg);
                }
                50% {
                    transform: translateY(-20px) rotate(180deg);
                }
            }

            .chapter-preview {
                background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
                border-radius: 12px;
                padding: 16px;
                margin-top: 16px;
                color: white;
                opacity: 0;
                transform: translateY(20px);
                transition: all 0.3s ease;
            }

            .chapter-preview.show {
                opacity: 1;
                transform: translateY(0);
            }
        </style>
    </head>
    <body class="form-container">
        <div class="min-h-screen flex items-center justify-center p-6 relative z-10">
            <div class="glass-effect rounded-2xl shadow-2xl p-8 w-full max-w-lg">
                <!-- Back Button at top -->
                <div class="mb-4">
                    <a href="${pageContext.request.contextPath}/adminhome" 
                       class="btn-secondary-hover inline-flex items-center text-gray-600 hover:text-gray-800 transition-all duration-300 group">
                        <svg class="w-4 h-4 mr-2 group-hover:-translate-x-1 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                        </svg>
                        <span class="text-sm font-medium">Back to Majors</span>
                    </a>
                </div>
                <!-- Header -->
                <div class="text-center mb-8">
                    <div class="w-16 h-16 bg-gradient-to-r from-purple-500 to-pink-500 rounded-full flex items-center justify-center mx-auto mb-4">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.746 0 3.332.477 4.5 1.253v13C19.832 18.477 18.246 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"></path>
                        </svg>
                    </div>
                    <h1 class="text-3xl font-bold text-gray-800 mb-2">Create Subject & Chapters</h1>
                    <p class="text-gray-600">Add a new subject with chapters to your system</p>
                </div>

                <!-- Form -->
                <form id="subjectForm" action="${pageContext.request.contextPath}/HandleSubjectAndChapterCreation" method="get" class="space-y-6">
                    <!-- Major Selection -->
                    <c:if test="${not empty listMajor}">
                        <div>
                            <label for="majorId" class="block text-sm font-semibold text-gray-700 mb-2">
                                Select Major
                            </label>
                            <div class="relative">
                                <select 
                                    id="majorId" 
                                    name="majorId" 
                                    required
                                    class="select-focus w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:outline-none transition-all duration-300 text-gray-800 bg-white appearance-none"
                                    >
                                    <option value="">Choose a major...</option>
                                    <c:forEach var="major" items="${listMajor}">
                                        <option value="${major.majorId}">${major.majorName}</option>
                                    </c:forEach>
                                </select>
                                <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                                    <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>

                        <!-- Subject Name -->
                        <div>
                            <label for="subjectName" class="block text-sm font-semibold text-gray-700 mb-2">
                                Subject Name
                            </label>
                            <div class="relative">
                                <input 
                                    type="text" 
                                    id="subjectName" 
                                    name="subjectName" 
                                    required
                                    class="input-focus w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:outline-none transition-all duration-300 text-gray-800 placeholder-gray-400"
                                    placeholder="Enter subject name "
                                    >
                                <div class="absolute inset-y-0 right-0 flex items-center pr-3">
                                    <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>

                        <!-- Number of Chapters -->
                        <div>
                            <label for="numberOfChapter" class="block text-sm font-semibold text-gray-700 mb-2">
                                Number of Chapters
                            </label>
                            <div class="relative">
                                <input 
                                    type="number" 
                                    id="numberOfChapter" 
                                    name="numberOfChapter" 
                                    min="1" 
                                    required
                                    class="input-focus w-full px-4 py-3 border-2 border-gray-200 rounded-xl focus:border-purple-500 focus:outline-none transition-all duration-300 text-gray-800 placeholder-gray-400"
                                    placeholder="Enter number of chapters"
                                    >
                                <div class="absolute inset-y-0 right-0 flex items-center pr-3">
                                    <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 20l4-16m2 16l4-16M6 9h14M4 15h14"></path>
                                    </svg>
                                </div>
                            </div>
                        </div>
                        <!-- Status Message -->
                        <div id="statusMessage" class="hidden">
                            <!-- Success message template -->
                            <div id="successMessage" class="success-animation bg-green-50 border border-green-200 rounded-xl p-4 hidden">
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-green-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                    <p class="text-green-800 font-medium" id="successText"></p>
                                </div>
                            </div>

                            <!-- Error message template -->
                            <div id="errorMessage" class="error-animation bg-red-50 border border-red-200 rounded-xl p-4 hidden">
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-red-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4m0 4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                    </svg>
                                    <p class="text-red-800 font-medium" id="errorText"></p>
                                </div>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <input type="hidden" name="action" value="Create Subject">
                        <button 
                            type="submit" 
                            class="btn-hover w-full bg-gradient-to-r from-purple-600 to-pink-600 text-white font-semibold py-3 px-6 rounded-xl transition-all duration-300 focus:outline-none focus:ring-4 focus:ring-purple-300"
                            >
                            <span class="flex items-center justify-center">
                                <svg class="w-5 h-5 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                                </svg>
                                Create Subject
                            </span>
                        </button>
                    </c:if>

                    <!-- No Major Available Message -->
                    <c:if test="${empty listMajor}">
                        <div class="bg-yellow-50 border border-yellow-200 rounded-xl p-4">
                            <div class="flex items-center">
                                <svg class="w-5 h-5 text-yellow-500 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.964-.833-2.732 0L3.732 16.5c-.77.833.192 2.5 1.732 2.5z"></path>
                                </svg>
                                <p class="text-yellow-800 font-medium">No majors available. Please contact your administrator to add majors first.</p>
                            </div>
                        </div>
                    </c:if>
                </form>
            </div>
        </div>
    </body>
</html>

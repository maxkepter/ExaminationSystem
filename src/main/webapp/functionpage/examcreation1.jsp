<%-- 
    Document   : examcreation1
    Created on : Jun 3, 2025, 2:33:05 AM
    Author     : MasterLong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Exam - Modern Interface</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <style>
            .input-field {
                transition: all 0.3s ease;
            }
            .input-field:focus {
                border-color: #4f46e5;
                box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
            }
            .btn-hover {
                transition: all 0.3s ease;
            }
            .btn-hover:hover {
                transform: translateY(-1px);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
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
        <main class="max-w-4xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
            <!-- Exam Creation Form -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                <div class="bg-gradient-to-r from-indigo-600 to-purple-600 px-8 py-6">
                    <h2 class="text-2xl font-bold text-white flex items-center">
                        <i class="fas fa-plus-circle mr-3"></i>
                        Exam Configuration
                    </h2>
                    <p class="text-indigo-100 mt-2">Fill in the details to create your exam</p>
                </div>

                <form action="${pageContext.request.contextPath}/HandleExamCreation1" method="get" class="p-8">
                    <!-- Academic Selection -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                        <div class="form-group">
                            <label for="majorSelect" class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-university text-indigo-600 mr-2"></i>
                                Major
                            </label>
                            <select id="majorSelect" name="majorId" class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none bg-white">
                                <option value="">-- Choose a major --</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="subjectSelect" class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-book text-indigo-600 mr-2"></i>
                                Subject
                            </label>
                            <select id="subjectSelect" name="subjectId" class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none bg-white">
                                <option value="">-- Choose a subject --</option>
                            </select>
                        </div>
                    </div>

                    <!-- Chapter Selection -->
                    <div class="form-group mb-8">
                        <label class="block text-sm font-medium text-gray-700 mb-4">
                            <i class="fas fa-list text-indigo-600 mr-2"></i>
                            Select Chapters
                        </label>
                        <div id="chapterSelect" class="bg-gray-50 rounded-lg p-6">
                            <p class="text-gray-500 text-center">Please select a subject first to see available chapters</p>
                        </div>
                    </div>

                    <!-- Exam Details -->
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-8">
                        <div class="form-group">
                            <label for="examName" class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-file-alt text-indigo-600 mr-2"></i>
                                Exam Name
                            </label>
                            <input type="text" id="examName" name="examName" placeholder="Enter exam name" 
                                   class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none">
                        </div>

                        <div class="form-group">
                            <label for="duration" class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-clock text-indigo-600 mr-2"></i>
                                Duration (minutes)
                            </label>
                            <input type="number" id="duration" name="duration" placeholder="90" min="1"
                                   oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                                   class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none">
                        </div>
                    </div>

                    <!-- Question Distribution -->
                    <div class="mb-8">
                        <h3 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
                            <i class="fas fa-chart-pie text-indigo-600 mr-2"></i>
                            Question Distribution
                        </h3>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                            <div class="form-group">
                                <label for="numberEasy" class="block text-sm font-medium text-gray-700 mb-2">
                                    <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-green-100 text-green-800 mr-2">
                                        Easy
                                    </span>
                                    Number of Questions
                                </label>
                                <input type="number" id="numberEasy" name="numberEasy" placeholder="10" min="0"
                                       oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                                       class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none">
                            </div>

                            <div class="form-group">
                                <label for="numberNormal" class="block text-sm font-medium text-gray-700 mb-2">
                                    <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-yellow-100 text-yellow-800 mr-2">
                                        Medium
                                    </span>
                                    Number of Questions
                                </label>
                                <input type="number" id="numberNormal" name="numberNormal" placeholder="15" min="0"
                                       oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                                       class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none">
                            </div>

                            <div class="form-group">
                                <label for="numberHard" class="block text-sm font-medium text-gray-700 mb-2">
                                    <span class="inline-flex items-center px-2 py-1 rounded-full text-xs font-medium bg-red-100 text-red-800 mr-2">
                                        Hard
                                    </span>
                                    Number of Questions
                                </label>
                                <input type="number" id="numberHard" name="numberHard" placeholder="5" min="0"
                                       oninput="this.value = this.value.replace(/[^0-9]/g, '')"
                                       class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none">
                            </div>
                        </div>
                        <!-- Total Questions Display -->
                        <div class="mt-4 p-4 bg-blue-50 rounded-lg">
                            <div class="flex items-center">
                                <i class="fas fa-calculator text-blue-600 mr-2"></i>
                                <span class="text-sm font-medium text-blue-900">Total Questions: </span>
                                <span id="totalQuestions" class="text-sm font-bold text-blue-900 ml-1">0</span>
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex flex-col sm:flex-row gap-4 justify-between items-center pt-6 border-t border-gray-200">
                        <a href="${pageContext.request.contextPath}/adminhome" 
                           class="btn-hover inline-flex items-center px-6 py-3 border border-gray-300 rounded-lg text-gray-700 bg-white hover:bg-gray-50 font-medium">
                            <i class="fas fa-arrow-left mr-2"></i>
                            Go Back
                        </a>

                        <input type="submit" name="submit" value="Create Exam"
                               class="btn-hover inline-flex items-center px-8 py-3 bg-gradient-to-r from-indigo-600 to-purple-600 text-white rounded-lg font-medium hover:from-indigo-700 hover:to-purple-700 cursor-pointer border-0">
                    </div>
                </form>
            </div>
        </main>

        <script>
            //Dynamic generation major
            function getListMajor() {
                const baseUrl = '<%= request.getContextPath() %>';
                fetch(baseUrl + "/AjaxHandleChooseChapter?action=getMajors")
                        .then(response => response.json())
                        .then(majors => {
                            const majorSelect = document.getElementById("majorSelect");
                            majorSelect.innerHTML = "";
                            const defaultOption = document.createElement("option");
                            defaultOption.value = "";
                            defaultOption.textContent = "-- Choose a major --";
                            majorSelect.appendChild(defaultOption);
                            majors.forEach(major => {
                                const option = document.createElement("option");
                                option.value = major.majorId;
                                option.textContent = major.majorName;
                                majorSelect.appendChild(option);
                            });

                        });
            }
            function getListSubject(majorId) {
                const baseUrl = '<%= request.getContextPath() %>';
                fetch(baseUrl + "/AjaxHandleChooseChapter?action=getSubjects&majorId=" + encodeURIComponent(majorId))
                        .then(response => response.json())
                        .then(subjects => {
                            const subjectSelect = document.getElementById("subjectSelect");
                            subjectSelect.innerHTML = "";
                            const defaultOption = document.createElement("option");
                            defaultOption.value = "";
                            defaultOption.textContent = "-- Choose a subject --";
                            subjectSelect.appendChild(defaultOption);
                            subjects.forEach(subject => {
                                const option = document.createElement("option");
                                option.value = subject.subID;
                                option.textContent = subject.subjectName;
                                subjectSelect.appendChild(option);

                            });
                        });
            }

            function getListChapter(subjectId) {
                const baseUrl = '<%= request.getContextPath() %>';
                fetch(baseUrl + "/AjaxHandleChooseChapter?action=getChapters&subjectId=" + encodeURIComponent(subjectId))
                        .then(response => response.json())
                        .then(chapters => {
                            const chapterSelect = document.getElementById("chapterSelect");
                            chapterSelect.innerHTML = "<p class='text-sm font-medium text-gray-700 mb-3'>Select all chapter:</p>";
                            const gridDiv = document.createElement("div");
                            gridDiv.className = "grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4";

                            chapters.forEach(chapter => {
                                const label = document.createElement("label");
                                label.className = "flex items-center p-3 bg-white rounded-lg shadow-sm hover:shadow-md transition-shadow cursor-pointer";

                                const input = document.createElement("input");
                                input.value = chapter.chapterID;
                                input.name = "chapterID";
                                input.type = "checkbox";
                                input.className = "text-indigo-600 rounded mr-3";

                                const span = document.createElement("span");
                                span.textContent = "Chapter " + chapter.chapterNo;
                                span.className = "text-gray-700";

                                label.appendChild(input);
                                label.appendChild(span);
                                gridDiv.appendChild(label);
                            });

                            chapterSelect.appendChild(gridDiv);
                        });
            }

            document.addEventListener("DOMContentLoaded", function () {
                // Load dropdowns
                getListMajor();
                // Event handlers for cascading dropdowns
                document.getElementById("majorSelect").addEventListener("change", function () {
                    getListSubject(this.value);
                    //Reset chapter
                    const chapterSelect = document.getElementById("chapterSelect");
                    chapterSelect.innerHTML = "<p class='text-gray-500 text-center'>Please select a subject first to see available chapters</p>";
                });
                document.getElementById("subjectSelect").addEventListener("change", function () {
                    getListChapter(this.value);
                });

            });
            // Hàm tính tổng số câu hỏi
            function calculateTotalQuestions() {
                const easyQuestions = parseInt(document.getElementById("numberEasy").value) || 0;
                const normalQuestions = parseInt(document.getElementById("numberNormal").value) || 0;
                const hardQuestions = parseInt(document.getElementById("numberHard").value) || 0;

                const total = easyQuestions + normalQuestions + hardQuestions;
                document.getElementById("totalQuestions").textContent = total;
            }

// Thêm event listeners cho các input fields trong phần DOMContentLoaded
            document.addEventListener("DOMContentLoaded", function () {
                // Load dropdowns
                getListMajor();

                // Event handlers for cascading dropdowns
                document.getElementById("majorSelect").addEventListener("change", function () {
                    getListSubject(this.value);
                    //Reset chapter
                    const chapterSelect = document.getElementById("chapterSelect");
                    chapterSelect.innerHTML = "<p class='text-gray-500 text-center'>Please select a subject first to see available chapters</p>";
                });

                document.getElementById("subjectSelect").addEventListener("change", function () {
                    getListChapter(this.value);
                });

                // Event listeners cho việc tính tổng câu hỏi
                document.getElementById("numberEasy").addEventListener("input", calculateTotalQuestions);
                document.getElementById("numberNormal").addEventListener("input", calculateTotalQuestions);
                document.getElementById("numberHard").addEventListener("input", calculateTotalQuestions);

                // Tính tổng ban đầu (nếu có giá trị mặc định)
                calculateTotalQuestions();
            });
        </script>
    </body>
</html>
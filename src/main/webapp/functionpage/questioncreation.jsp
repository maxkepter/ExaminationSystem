<%-- 
    Document   : questioncreation
    Created on : Jun 11, 2025, 2:17:50 PM
    Author     : MasterLong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Question - Modern Interface</title>
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
            <!-- Welcome Card -->
            <div class="bg-white rounded-xl shadow-lg p-6 mb-8">
                <div class="flex items-center">
                    <div class="bg-indigo-100 p-3 rounded-full mr-4">
                        <i class="fas fa-user-check text-indigo-600 text-xl"></i>
                    </div>
                    <div>
                        <h2 class="text-xl font-semibold text-gray-900">Welcome, ${user.firstName} ${user.lastName}</h2>
                        <p class="text-gray-600">${questionCreationError}</p
                    </div>
                </div>
            </div>

            <!-- Question Creation Form -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                <div class="bg-gradient-to-r from-indigo-600 to-purple-600 px-8 py-6">
                    <h2 class="text-2xl font-bold text-white flex items-center">
                        <i class="fas fa-plus-circle mr-3"></i>
                        Question Configuration
                    </h2>
                    <p class="text-indigo-100 mt-2">Fill in the details to create your question</p>
                </div>

                <form action="${pageContext.request.contextPath}/HandleQuestionCreation" method="post" class="p-8">
                    <!-- Academic Selection -->
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
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

                        <div class="form-group">
                            <label for="chapterSelect" class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-bookmark text-indigo-600 mr-2"></i>
                                Chapter
                            </label>
                            <select id="chapterSelect" name="chapterId" class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none bg-white">
                                <option value="">-- Choose a chapter --</option>
                            </select>
                        </div>
                    </div>

                    <!-- Question Details -->
                    <div class="mb-8">
                        <h3 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
                            <i class="fas fa-edit text-indigo-600 mr-2"></i>
                            Question Details
                        </h3>

                        <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-6">
                            <div class="form-group md:col-span-3">
                                <label for="question" class="block text-sm font-medium text-gray-700 mb-2">
                                    Question Text
                                </label>
                                <textarea id="question" name="question" rows="3" placeholder="Enter your question here..." value="${question}"
                                          class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none resize-none"></textarea>
                            </div>

                            <div class="form-group">
                                <label for="difficulty" class="block text-sm font-medium text-gray-700 mb-2">
                                    <i class="fas fa-signal text-indigo-600 mr-2"></i>
                                    Difficulty Level
                                </label>
                                <select id="difficulty" name="difficulty" class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none bg-white">
                                    <option value="1">Easy</option>
                                    <option value="2">Normal</option>
                                    <option value="3">Hard</option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <!-- Answer Options -->
                    <div class="mb-8">
                        <h3 class="text-lg font-semibold text-gray-900 mb-4 flex items-center">
                            <i class="fas fa-list-ol text-indigo-600 mr-2"></i>
                            Answer Options
                            <span class="ml-2 text-sm text-gray-500 font-normal">(Select the correct answer)</span>
                        </h3>

                        <div id="answersContainer" class="space-y-4">
                            <!-- Answer 1 -->
                            <div class="answer-item bg-gray-50 rounded-lg p-4 border border-gray-200">
                                <div class="flex items-center space-x-4">
                                    <div class="flex-grow">
                                        <input type="text" name="answer1" placeholder="Enter answer option 1" 
                                               class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none">
                                    </div>
                                    <div class="flex-shrink-0">
                                        <label class="inline-flex items-center">
                                            <input type="checkbox" name="isTrue" value="2" class="form-checkbox h-5 w-5 text-indigo-600 rounded">
                                            <span class="ml-2 text-sm text-gray-700 font-medium">Correct</span>
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <!-- Answer 2 -->
                            <div class="answer-item bg-gray-50 rounded-lg p-4 border border-gray-200">
                                <div class="flex items-center space-x-4">
                                    <div class="flex-grow">
                                        <input type="text" name="answer2" placeholder="Enter answer option 2" 
                                               class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none">
                                    </div>
                                    <div class="flex-shrink-0">
                                        <label class="inline-flex items-center">
                                            <input type="checkbox" name="isTrue" class="form-checkbox h-5 w-5 text-indigo-600 rounded">
                                            <span class="ml-2 text-sm text-gray-700 font-medium">Correct</span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Add/Remove Answer Buttons -->
                        <div class="flex space-x-4 mt-6">
                            <button type="button" id="addAnswerBtn" 
                                    class="btn-hover inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded-lg font-medium">
                                <i class="fas fa-plus mr-2"></i>
                                Add Answer Option
                            </button>
                            <button type="button" id="deleteAnswerBtn" 
                                    class="btn-hover inline-flex items-center px-4 py-2 bg-red-600 hover:bg-red-700 text-white rounded-lg font-medium">
                                <i class="fas fa-minus mr-2"></i>
                                Remove Last Option
                            </button>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex flex-col sm:flex-row gap-4 justify-between items-center pt-6 border-t border-gray-200">
                        <a href="${pageContext.request.contextPath}/adminhome" 
                           class="btn-hover inline-flex items-center px-6 py-3 border border-gray-300 rounded-lg text-gray-700 bg-white hover:bg-gray-50 font-medium">
                            <i class="fas fa-arrow-left mr-2"></i>
                            Go Back
                        </a>

                        <div class="flex space-x-4">
                            <button type="submit" id="submitQuestionBtn" name="action" value="Submit Question"
                                    class="btn-hover inline-flex items-center px-8 py-3 bg-gradient-to-r from-indigo-600 to-purple-600 text-white rounded-lg font-medium hover:from-indigo-700 hover:to-purple-700">
                                <i class="fas fa-check mr-2"></i>
                                Create Question
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </main>

        <!-- Fixed Script -->
        <script>
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
                            chapterSelect.innerHTML = "";
                            const defaultOption = document.createElement("option");
                            defaultOption.value = "";
                            defaultOption.textContent = "-- Choose a chapter --";
                            chapterSelect.appendChild(defaultOption);
                            chapters.forEach(chapter => {
                                const option = document.createElement("option");
                                option.value = chapter.chapterID;
                                option.textContent = chapter.chapterNo;
                                chapterSelect.appendChild(option);
                            });
                        });
            }

            // Fixed JavaScript code for the dynamic answer options

// Function to get answer label (1, 2, 3, 4, etc.)
            function getAnswerLabel(index) {
                return index; // Return the actual number
            }

// Function to get color class for answer options (single color for all)
            function getAnswerColorClass(index) {
                return 'bg-indigo-100 text-indigo-800'; // Same color for all options
            }

// Function to create a styled answer option
            function createAnswerOption() {
                const answersContainer = document.getElementById("answersContainer");
                const currentIndex = answersContainer.querySelectorAll(".answer-item").length + 1;

                const answerDiv = document.createElement("div");
                answerDiv.className = "answer-item bg-gray-50 rounded-lg p-4 border border-gray-200";

                answerDiv.innerHTML = ""
    + "<div class=\"flex items-center space-x-4\">"
    + "    <div class=\"flex-grow\">"
    + "        <input type=\"text\" name=\"answer" + currentIndex + "\" placeholder=\"Enter answer option\" "
    + "               class=\"input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none\">"
    + "    </div>"
    + "    <div class=\"flex-shrink-0\">"
    + "        <label class=\"inline-flex items-center\">"
    + "            <input type=\"checkbox\" name=\"isTrue\" value=\"" + currentIndex + "\" class=\"form-checkbox h-5 w-5 text-indigo-600 rounded\">"
    + "            <span class=\"ml-2 text-sm text-gray-700 font-medium\">Correct</span>"
    + "        </label>"
    + "    </div>"
    + "</div>";
                return answerDiv;
            }




// Updated DOMContentLoaded event handler
            document.addEventListener("DOMContentLoaded", function () {
                // Load dropdowns
                getListMajor();

                // Event handlers for cascading dropdowns
                document.getElementById("majorSelect").addEventListener("change", function () {
                    getListSubject(this.value);

                    // Reset chapter
                    const chapterSelect = document.getElementById("chapterSelect");
                    chapterSelect.innerHTML = "";
                    const defaultOption = document.createElement("option");
                    defaultOption.value = "";
                    defaultOption.textContent = "-- Choose a chapter --";
                    chapterSelect.appendChild(defaultOption);
                });

                document.getElementById("subjectSelect").addEventListener("change", function () {
                    getListChapter(this.value);
                });

                // Dynamic answer management
                let answerCount = 2; // Start from 2 since options 1 and 2 already exist
                const addBtn = document.getElementById("addAnswerBtn");
                const deleteBtn = document.getElementById("deleteAnswerBtn");
                const answersContainer = document.getElementById("answersContainer");

                addBtn.addEventListener("click", function (e) {
                    e.preventDefault();
                    answerCount++;

                    // Create new styled answer option
                    const newAnswerDiv = createAnswerOption();
                    answersContainer.appendChild(newAnswerDiv);
                });

                deleteBtn.addEventListener("click", function (e) {
                    e.preventDefault();

                    const answerDivs = answersContainer.querySelectorAll(".answer-item");

                    if (answerDivs.length > 2) {
                        answersContainer.removeChild(answerDivs[answerDivs.length - 1]);
                        answerCount--;
                    } else {
                        alert("At least 2 answers are required.");
                    }
                });
            });
        </script>
    </body>
</html>
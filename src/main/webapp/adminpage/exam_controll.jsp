<%-- 
    Document   : exam_controll
    Created on : Jun 28, 2025, 2:56:22 PM
    Author     : Admin
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Control Student Exam</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <% 
    String studentExamId = request.getParameter("studentExamId");
    %>
</head>
<body class="bg-gradient-to-br from-blue-50 to-indigo-100 min-h-screen">
    <div class="container mx-auto px-4 py-8">
        <!-- Header -->
        <div class="text-center mb-8">
            <div class="inline-flex items-center justify-center w-16 h-16 bg-indigo-600 rounded-full mb-4">
                <i class="fas fa-user-graduate text-white text-2xl"></i>
            </div>
            <h1 class="text-3xl font-bold text-gray-800 mb-2">Control Student Exam</h1>
            <p class="text-gray-600">Manage and control student examination sessions</p>
        </div>

        <!-- Main Form Card -->
        <div class="max-w-2xl mx-auto">
            <div class="bg-white rounded-xl shadow-lg border border-gray-200 overflow-hidden">
                <!-- Card Header -->
                <div class="bg-gradient-to-r from-indigo-600 to-purple-600 px-6 py-4">
                    <h2 class="text-xl font-semibold text-white flex items-center">
                        <i class="fas fa-clipboard-check mr-3"></i>
                        Exam Control Panel
                    </h2>
                </div>

                <!-- Form Content -->
                <div class="p-6">
                    <form action="ControllStudentExam" method="post" class="space-y-6">
                        <!-- Hidden Student Exam ID -->
                        <input type="hidden" name="studentExamId" value="<%= studentExamId %>">
                        
                        <!-- Student Info Display -->
                        <div class="bg-gray-50 rounded-lg p-4 border-l-4 border-indigo-500">
                            <div class="flex items-center">
                                <i class="fas fa-info-circle text-indigo-600 mr-2"></i>
                                <span class="text-sm font-medium text-gray-700">Student Exam ID:</span>
                                <span class="ml-2 text-sm font-mono bg-white px-2 py-1 rounded border"><%= studentExamId %></span>
                            </div>
                        </div>

                        <!-- Message Field -->
                        <div class="space-y-2">
                            <label class="flex items-center text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-comment-alt text-indigo-600 mr-2"></i>
                                Control Message
                                <span class="text-red-500 ml-1">*</span>
                            </label>
                            <textarea 
                                name="message" 
                                required 
                                rows="3"
                                placeholder="Enter a message to display to the student (e.g., 'Time extended by 15 minutes' or 'Please submit your exam now')"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors resize-none"
                            ></textarea>
                            <p class="text-xs text-gray-500">This message will be displayed to the student during the exam.</p>
                        </div>

                        <!-- Redirect URL Field -->
                        <div class="space-y-2">
                            <label class="flex items-center text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-link text-indigo-600 mr-2"></i>
                                Redirect URL
                                <span class="text-gray-400 ml-1 text-xs">(Optional)</span>
                            </label>
                            <input 
                                type="url" 
                                name="url" 
                                placeholder="https://example.com/exam-results"
                                class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors"
                            >
                            <div class="bg-amber-50 border border-amber-200 rounded-lg p-3">
                                <div class="flex items-start">
                                    <i class="fas fa-exclamation-triangle text-amber-600 mr-2 mt-0.5"></i>
                                    <div class="text-sm text-amber-800">
                                        <strong>Note:</strong> If left blank, the exam will be force-submitted without redirecting the student to another page.
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="flex flex-col sm:flex-row gap-3 pt-4">
                            <button 
                                type="submit" 
                                class="flex-1 bg-gradient-to-r from-red-600 to-red-700 hover:from-red-700 hover:to-red-800 text-white font-semibold py-3 px-6 rounded-lg transition-all duration-200 transform hover:scale-105 shadow-lg hover:shadow-xl flex items-center justify-center"
                            >
                                <i class="fas fa-paper-plane mr-2"></i>
                                Force Submit Exam
                            </button>
                            
                            <button 
                                type="button" 
                                onclick="window.history.back()" 
                                class="flex-1 sm:flex-none bg-gray-500 hover:bg-gray-600 text-white font-semibold py-3 px-6 rounded-lg transition-all duration-200 flex items-center justify-center"
                            >
                                <i class="fas fa-arrow-left mr-2"></i>
                                Cancel
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Form validation and user experience enhancements
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            const messageField = document.querySelector('textarea[name="message"]');
            const urlField = document.querySelector('input[name="url"]');
            
            // Auto-resize textarea
            messageField.addEventListener('input', function() {
                this.style.height = 'auto';
                this.style.height = this.scrollHeight + 'px';
            });
            
            // Form submission confirmation
            form.addEventListener('submit', function(e) {
                const message = messageField.value.trim();
                const url = urlField.value.trim();
                
                let confirmText = Are you sure you want to force submit this exam?\n\nMessage: "${message}";
                if (url) {
                    confirmText += \nStudent will be redirected to: ${url};
                } else {
                    confirmText += \nStudent will NOT be redirected (exam will just be submitted).;
                }
                
                if (!confirm(confirmText)) {
                    e.preventDefault();
                }
            });
            
            // URL validation
            urlField.addEventListener('blur', function() {
                if (this.value && !this.value.startsWith('http')) {
                    this.value = 'https://' + this.value;
                }
            });
        });
    </script>
</body>
</html>

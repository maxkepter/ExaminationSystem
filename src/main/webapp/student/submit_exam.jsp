<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Submit Exam</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');
            body {
                font-family: 'Inter', sans-serif;
                background-color: #ffffff;
                min-height: 100vh;
            }

            .result-card {
                animation: fadeIn 0.8s ease-in-out;
            }

            .confetti {
                position: fixed;
                width: 10px;
                height: 10px;
                z-index: 1000;
                pointer-events: none;
            }

            @keyframes fadeIn {
                0% {
                    opacity: 0;
                    transform: translateY(20px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @keyframes confettiFall {
                0% {
                    transform: translateY(-100vh) rotate(0deg);
                    opacity: 1;
                }
                100% {
                    transform: translateY(100vh) rotate(360deg);
                    opacity: 0;
                }
            }

            .score-circle {
                position: relative;
                width: 128px;
                height: 128px;
                border-radius: 50%;
                background: linear-gradient(135deg, #eef2ff 0%, #e0e7ff 100%);
                display: flex;
                align-items: center;
                justify-content: center;
                box-shadow: 0 8px 32px rgba(99, 102, 241, 0.3);
            }

            .score-text {
                font-size: 2.5rem;
                font-weight: bold;
                color: #4338ca;
            }

            .floating-shapes {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
                z-index: -1;
                pointer-events: none;
            }

            .shape {
                position: absolute;
                opacity: 0.1;
            }

            .shape-1 {
                width: 20px;
                height: 20px;
                background: #6366f1;
                top: 20%;
                left: 10%;
                animation: float 6s ease-in-out infinite;
            }

            .shape-2 {
                width: 15px;
                height: 15px;
                background: #8b5cf6;
                top: 60%;
                right: 15%;
                animation: float 4s ease-in-out infinite reverse;
            }

            .shape-3 {
                width: 25px;
                height: 25px;
                background: #ec4899;
                bottom: 20%;
                left: 20%;
                animation: float 5s ease-in-out infinite;
            }

            .shape-4 {
                width: 18px;
                height: 18px;
                background: #f43f5e;
                top: 30%;
                right: 30%;
                animation: float 7s ease-in-out infinite reverse;
            }

            .shape-5 {
                width: 22px;
                height: 22px;
                background: #6366f1;
                bottom: 40%;
                right: 10%;
                animation: float 3s ease-in-out infinite;
            }

            @keyframes float {
                0%, 100% {
                    transform: translateY(0px) rotate(0deg);
                }
                50% {
                    transform: translateY(-20px) rotate(180deg);
                }
            }
        </style>
    </head>

    <body>
        <!-- Floating background shapes -->
        <div class="floating-shapes">
            <div class="shape shape-1"></div>
            <div class="shape shape-2"></div>
            <div class="shape shape-3"></div>
            <div class="shape shape-4"></div>
            <div class="shape shape-5"></div>
        </div>

        <!-- Header -->
        <nav class="bg-gradient-to-r from-indigo-500 to-purple-600 shadow-lg fixed w-full top-0 z-50" style="height: 81px;">
            <div class="w-full px-4 sm:px-6 lg:px-8">
                <div class="flex items-center justify-between h-16" style="margin-top: 17px;">
                    <!-- Logo/Brand -->
                    <div class="flex items-center">
                        <h1 class="text-[28.8px] font-bold text-white" style="margin-top: -23px; font-family: 'Segoe UI';">
                            🎓 Examination System
                        </h1>
                    </div>

                    <!-- User Menu -->
                    <div class="flex items-center space-x-3" style="margin-top: -23px;">
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
        <div class="content container mx-auto py-12 px-4" style="padding-top: 120px; background-color: #f5f7fa; min-height: 100vh;">
            <div class="max-w-2xl mx-auto">
                <div class="result-card bg-white rounded-xl shadow-2xl overflow-hidden">
                    <!-- Header Section -->
                    <div class="bg-gradient-to-r from-indigo-500 to-purple-600 py-6 px-8 text-white">
                        <h2 class="text-2xl font-semibold">Exam Completed</h2>
                        <p class="opacity-90 mt-1">Your assessment has been submitted successfully</p>
                    </div>

                    <!-- Content Section -->
                    <div class="p-8">
                        <!-- Score Display -->
                        <div class="flex flex-col items-center justify-center mb-8">
                            <div class="score-circle mb-4">
                                <!-- Giả sử bạn dùng JSP và có biến score -->
                                <div class="score-text" id="score-display" data-score="${score}">
                                    ${score}
                                </div>

                            </div>
                            <h3 class="text-xl font-semibold text-gray-800">Your Result</h3>
                            <p class="text-gray-500 mt-1" id="result-message">Great effort!</p>
                        </div>

                        <!-- Performance Summary -->
                        <div class="bg-indigo-50 rounded-lg p-6 mb-8">
                            <div class="flex items-start">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-indigo-500 mr-3 mt-0.5 flex-shrink-0" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                                <div>
                                    <h4 class="font-medium text-gray-800">Performance Summary</h4>
                                    <p class="text-gray-600 text-sm mt-1">Your score has been recorded. You can view detailed feedback in your student dashboard.</p>
                                </div>
                            </div>
                        </div>

                        <!-- Return Button -->
                        <div class="flex justify-center">
                            <a href="./Home" class="inline-flex items-center px-6 py-3 bg-indigo-600 text-white font-medium rounded-lg hover:bg-indigo-700 transition-all duration-200 focus:outline-none focus:ring-4 focus:ring-indigo-300 transform hover:scale-105">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
                                </svg>
                                Return to Home
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Create confetti effect
            document.addEventListener('DOMContentLoaded', function () {
                // Get score from URL parameter or set default
                const urlParams = new URLSearchParams(window.location.search);
                const score = urlParams.get('score') || 85; // Default score if not provided

                // Set the target score for animation
                window.targetScore = parseInt(score);

                // Update result message based on score
                updateResultMessage(window.targetScore);

                // Animate score counting up
                animateScore();

                // Create confetti after a delay
                setTimeout(() => {
                    createConfetti();
                }, 1000);
            });

            function updateResultMessage(score) {
                const messageElement = document.getElementById('result-message');
                if (score >= 90) {
                    messageElement.textContent = 'Excellent work!';
                    messageElement.className = 'text-green-500 mt-1 font-medium';
                } else if (score >= 80) {
                    messageElement.textContent = 'Great effort!';
                    messageElement.className = 'text-blue-500 mt-1 font-medium';
                } else if (score >= 70) {
                    messageElement.textContent = 'Good job!';
                    messageElement.className = 'text-yellow-500 mt-1 font-medium';
                } else if (score >= 60) {
                    messageElement.textContent = 'Keep practicing!';
                    messageElement.className = 'text-orange-500 mt-1 font-medium';
                } else {
                    messageElement.textContent = 'Don\'t give up!';
                    messageElement.className = 'text-red-500 mt-1 font-medium';
                }
            }

            function animateScore() {
                const scoreElement = document.getElementById('score-display');
                const targetScore = parseInt(scoreElement.dataset.score); // Lấy điểm từ attribute
                let currentScore = 0;
                const increment = targetScore / 50;

                const timer = setInterval(() => {
                    currentScore += increment;
                    if (currentScore >= targetScore) {
                        currentScore = targetScore;
                        clearInterval(timer);
                    }
                    scoreElement.textContent = Math.floor(currentScore);
                }, 30);
            }

            document.addEventListener("DOMContentLoaded", function () {
                animateScore();
            });


            function createConfetti() {
                const colors = ['#3B82F6', '#6366F1', '#8B5CF6', '#EC4899', '#F43F5E', '#10B981', '#F59E0B'];
                const confettiCount = 150;

                for (let i = 0; i < confettiCount; i++) {
                    setTimeout(() => {
                        const confetti = document.createElement('div');
                        confetti.className = 'confetti';

                        const color = colors[Math.floor(Math.random() * colors.length)];
                        confetti.style.backgroundColor = color;
                        confetti.style.left = Math.random() * 100 + 'vw';
                        confetti.style.animationDuration = (Math.random() * 3 + 2) + 's';
                        confetti.style.animationName = 'confettiFall';
                        confetti.style.animationTimingFunction = 'linear';
                        confetti.style.animationFillMode = 'forwards';

                        document.body.appendChild(confetti);

                        // Remove confetti after animation
                        setTimeout(() => {
                            if (confetti.parentNode) {
                                confetti.parentNode.removeChild(confetti);
                            }
                        }, 5000);
                    }, i * 50);
                }
            }
        </script>
    </body>
</html>

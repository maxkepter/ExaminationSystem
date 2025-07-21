<%-- 
    Document   : statics
    Created on : Jul 3, 2025, 10:17:02 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Score Statistics Dashboard</title>

        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com"></script>

        <!-- Chart.js -->
        <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

            body {
                font-family: 'Inter', sans-serif;
            }

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

            .navbar-gradient h1 {
                justify-content: center;
            }

            .card-shadow {
                box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            }

            .hover-lift {
                transition: transform 0.2s ease;
            }

            .hover-lift:hover {
                transform: translateY(-2px);
            }

            .p-4 {
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
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
                                </svg>
                            </button>
                        </c:if>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="max-w-7xl mx-auto py-12 px-4 sm:px-6 lg:px-8">
            <!-- Exam Selection Card -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden mb-8">
                <div class="bg-gradient-to-r from-indigo-600 to-purple-600 px-8 py-6">
                    <div class="flex justify-between items-center">
                        <h2 class="text-2xl font-bold text-white flex items-center">
                            <i class="fas fa-chart-bar mr-3"></i>
                            Exam Selection
                        </h2>
                        <a href="adminhome"
                           class="back-button text-white font-medium py-2 px-4 rounded-md transition flex items-center">
                            <i class="fas fa-arrow-left mr-2"></i>
                            Back to Home
                        </a>
                    </div>
                    <p class="text-indigo-100 mt-2">Choose an exam to view detailed score statistics</p>
                </div>


                <form action="StatsticScore" class="p-8">
                    <div class="flex flex-col md:flex-row gap-4 items-end">
                        <div class="flex-1">
                            <label for="examSelect" class="block text-sm font-medium text-gray-700 mb-2">
                                <i class="fas fa-file-alt text-indigo-600 mr-2"></i>
                                Choose Exam
                            </label>
                            <select name="examId" id="examSelect" class="input-field w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none bg-white">
                                <option value="">-- Select an exam to view statistics --</option>
                                <c:forEach items="${examList}" var="exam">
                                    <option value="${exam.examID}" ${examId==exam.examID?"selected":""}>${exam.examName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="btn-hover inline-flex items-center px-8 py-3 bg-gradient-to-r from-indigo-600 to-purple-600 text-white rounded-lg font-medium hover:from-indigo-700 hover:to-purple-700">
                            <i class="fas fa-search mr-2"></i>
                            View Statistics
                        </button>
                    </div>
                </form>
            </div>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="bg-red-50 border border-red-200 rounded-xl p-6 mb-8">
                    <div class="flex items-center">
                        <div class="flex-shrink-0">
                            <i class="fas fa-exclamation-triangle text-red-500 text-2xl"></i>
                        </div>
                        <div class="ml-3">
                            <h3 class="text-lg font-medium text-red-800">Error</h3>
                            <p class="text-red-700">${error}</p>
                        </div>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty examId}">
                <!-- Statistics Content -->
                <div class="grid grid-cols-1 xl:grid-cols-3 gap-8">
                    <!-- Statistical Indicators -->
                    <div class="bg-white rounded-xl shadow-lg overflow-hidden hover-lift">
                        <div class="bg-gradient-to-r from-blue-600 to-indigo-600 px-6 py-4">
                            <h3 class="text-xl font-bold text-white flex items-center">
                                <i class="fas fa-calculator mr-2"></i>
                                Key Statistics
                            </h3>
                        </div>

                        <c:choose>
                            <c:when test="${not empty scoreMap}">
                                <div class="p-6">
                                    <div class="space-y-4">
                                        <div class="flex justify-between items-center py-3 border-b border-gray-100">
                                            <span class="font-medium text-gray-700 flex items-center">
                                                Số thí sinh:
                                            </span>
                                            <span class="text-xl font-bold text-blue-600" id="totalStudentsIndicator">0</span>
                                        </div>
                                        <div class="flex justify-between items-center py-3 border-b border-gray-100">
                                            <span class="font-medium text-gray-700 flex items-center">
                                                Điểm trung bình:
                                            </span>
                                            <span class="text-xl font-bold text-blue-600" id="averageScoreIndicator">0</span>
                                        </div>
                                        <div class="flex justify-between items-center py-3 border-b border-gray-100">
                                            <span class="font-medium text-gray-700 flex items-center">
                                                Trung vị:
                                            </span>
                                            <span class="text-xl font-bold text-blue-600" id="medianScore">0</span>
                                        </div>
                                        <div class="flex justify-between items-center py-3 border-b border-gray-100">
                                            <span class="font-medium text-gray-700 flex items-center">
                                                Độ lệch chuẩn:
                                            </span>
                                            <span class="text-xl font-bold text-blue-600" id="standardDeviation">0</span>
                                        </div>
                                        <div class="flex justify-between items-center py-3 border-b border-gray-100">
                                            <span class="font-medium text-gray-700 flex items-center">
                                                Số điểm 10:
                                            </span>
                                            <span class="text-xl font-bold text-blue-600" id="perfectScores">0</span>
                                        </div>
                                        <div class="flex justify-between items-center py-3">
                                            <span class="font-medium text-gray-700 flex items-center">
                                                Số điểm 0:
                                            </span>
                                            <span class="text-xl font-bold text-blue-600" id="zeroScores">0</span>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <!-- No Data Message -->
                                <div class="p-8 text-center">
                                    <div class="text-gray-400 text-6xl mb-4">
                                        <i class="fas fa-chart-bar"></i>
                                    </div>
                                    <h3 class="text-lg font-medium text-gray-900 mb-2">No Data Available</h3>
                                    <p class="text-gray-500">No score data found for the selected exam.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Chart Visualization - Now spans 2 columns -->
                    <c:if test="${not empty scoreMap}">
                        <div class="xl:col-span-2 bg-white rounded-xl shadow-lg overflow-hidden hover-lift">
                            <div class="bg-gradient-to-r from-purple-600 to-pink-600 px-6 py-4">
                                <h3 class="text-xl font-bold text-white flex items-center">
                                    <i class="fas fa-chart-column mr-2"></i>
                                    Score Distribution
                                </h3>
                            </div>

                            <div class="p-6">
                                <div class="mb-6" style="height: 400px;">
                                    <canvas id="scoreChart"></canvas>
                                </div>

                                <!-- Summary Stats -->
                                <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mt-6">
                                    <div class="bg-blue-50 rounded-lg p-4 text-center border border-blue-200">
                                        <div class="text-2xl font-bold text-blue-600 mb-1" id="totalStudents">0</div>
                                        <div class="text-sm text-blue-800 font-medium">Tổng thí sinh</div>
                                    </div>
                                    <div class="bg-green-50 rounded-lg p-4 text-center border border-green-200">
                                        <div class="text-2xl font-bold text-green-600 mb-1" id="averageScore">0</div>
                                        <div class="text-sm text-green-800 font-medium">Điểm TB</div>
                                    </div>
                                    <div class="bg-purple-50 rounded-lg p-4 text-center border border-purple-200">
                                        <div class="text-2xl font-bold text-purple-600 mb-1" id="highestScore">0</div>
                                        <div class="text-sm text-purple-800 font-medium">Điểm cao nhất</div>
                                    </div>
                                    <div class="bg-orange-50 rounded-lg p-4 text-center border border-orange-200">
                                        <div class="text-2xl font-bold text-orange-600 mb-1" id="lowestScore">0</div>
                                        <div class="text-sm text-orange-800 font-medium">Điểm thấp nhất</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
                <!-- Action Buttons -->
                <div class="flex flex-col sm:flex-row gap-4 justify-between items-center pt-8">
                    <a href="${pageContext.request.contextPath}/adminhome" 
                       class="btn-hover inline-flex items-center px-6 py-3 border border-gray-300 rounded-lg text-gray-700 bg-white hover:bg-gray-50 font-medium">
                        <i class="fas fa-arrow-left mr-2"></i>
                        Go Back to Dashboard
                    </a>
                </div>
            </c:if>
        </main>

        <!-- JavaScript for Chart and Analysis -->
        <c:if test="${not empty scoreMap}">
            <script>
                // Prepare data from JSP
                const scoreData = {
                <c:forEach var="entry" items="${scoreMap}" varStatus="status">
                    "${entry.key}": ${entry.value}<c:if test="${!status.last}">,</c:if>
                </c:forEach>
                };

                // Create histogram data with 10 columns (1-point intervals)
                const createHistogramData = (scoreData) => {
                    const labels = ['[0-1]', '[1-2]', '[2-3]', '[3-4]', '[4-5]', '[5-6]', '[6-7]', '[7-8]', '[8-9]', '[9-10]'];
                    const intervalCounts = Array(10).fill(0);

                    Object.keys(scoreData).forEach(scoreStr => {
                        const score = parseFloat(scoreStr);
                        const count = scoreData[scoreStr];
                        let index = Math.floor(score);
                        if (index >= 10)
                            index = 9;
                        intervalCounts[index] += count;
                    });

                    return {labels, data: intervalCounts};
                };

                const histogramResult = createHistogramData(scoreData);
                const labels = histogramResult.labels;
                const data = histogramResult.data;

                // Enhanced color scheme
                const getColor = (intervalIndex) => {
                    const midPoint = (intervalIndex + 0.5) * 0.5; // Middle point of interval

                    return {bg: '#0077be'}; // Red for 0-5
                };

                const backgroundColors = data.map((_, index) => getColor(index).bg);
                const borderColors = data.map((_, index) => getColor(index).border);

                // Initialize Chart
                const ctx = document.getElementById('scoreChart').getContext('2d');
                const scoreChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                                label: 'Số lượng thí sinh',
                                data: data,
                                backgroundColor: backgroundColors,
                                borderColor: borderColors,
                                borderWidth: 2,
                                borderRadius: 0,
                                borderSkipped: false,
                            }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: {
                                display: true,
                                position: 'top',
                                labels: {
                                    usePointStyle: true,
                                    padding: 20,
                                    font: {
                                        size: 14,
                                        weight: '500'
                                    }
                                }
                            },
                            title: {
                                display: true,
                                text: 'Score Distribution Analysis (10 intervals, 1 point each)',
                                font: {
                                    size: 16,
                                    weight: 'bold'
                                },
                                padding: 20
                            },
                            tooltip: {
                                enabled: false
                            }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Number of Students',
                                    font: {
                                        size: 14,
                                        weight: '600'
                                    }
                                },
                                grid: {
                                    color: 'rgba(156, 163, 175, 0.3)'
                                },
                                ticks: {
                                    color: '#6B7280',
                                    stepSize: 1,
                                    font: {
                                        size: 12
                                    }
                                }
                            },
                            x: {
                                title: {
                                    display: true,
                                    text: 'Score Range',
                                    font: {
                                        size: 14,
                                        weight: '600'
                                    }, padding: {
                                        top: 30  // 👈 Tăng khoảng cách phía trên => đẩy chữ xuống dưới
                                    }
                                },
                                grid: {
                                    display: false
                                },
                                ticks: {
                                    color: '#6B7280',
                                    maxRotation: 0,
                                    minRotation: 0,
                                    autoSkip: false,
                                    font: {
                                        size: 12
                                    }
                                }
                            }
                        },
                        interaction: {
                            intersect: false,
                            mode: 'index'
                        }
                    }
                });

                // Calculate detailed statistics
                const calculateStatistics = (scoreData) => {
                    let totalStudents = 0;
                    let weightedSum = 0;
                    let allScores = [];
                    let perfectScores = 0;
                    let zeroScores = 0;
                    let highestScore = 0;
                    let lowestScore = 10;

                    Object.keys(scoreData).forEach(scoreStr => {
                        const score = parseFloat(scoreStr);
                        const count = scoreData[scoreStr];

                        totalStudents += count;
                        weightedSum += score * count;

                        // Add individual scores for median calculation
                        for (let i = 0; i < count; i++) {
                            allScores.push(score);
                        }

                        // Count perfect and zero scores
                        if (score === 10)
                            perfectScores += count;
                        if (score === 0)
                            zeroScores += count;

                        // Track highest and lowest
                        if (score > highestScore)
                            highestScore = score;
                        if (score < lowestScore)
                            lowestScore = score;
                    });

                    // Calculate average
                    const average = weightedSum / totalStudents;

                    // Calculate median
                    allScores.sort((a, b) => a - b);
                    const median = totalStudents % 2 === 0
                            ? (allScores[totalStudents / 2 - 1] + allScores[totalStudents / 2]) / 2
                            : allScores[Math.floor(totalStudents / 2)];

                    // Calculate standard deviation
                    let varianceSum = 0;
                    Object.keys(scoreData).forEach(scoreStr => {
                        const score = parseFloat(scoreStr);
                        const count = scoreData[scoreStr];
                        varianceSum += count * Math.pow(score - average, 2);
                    });
                    const standardDeviation = Math.sqrt(varianceSum / totalStudents);

                    return {
                        totalStudents,
                        average,
                        median,
                        standardDeviation,
                        perfectScores,
                        zeroScores,
                        highestScore,
                        lowestScore
                    };
                };

                const stats = calculateStatistics(scoreData);

                // Update all statistics displays with animations
                const animateNumber = (elementId, targetValue, suffix = '') => {
                    const element = document.getElementById(elementId);
                    const startValue = 0;
                    const duration = 1000;
                    const startTime = performance.now();

                    const animate = (currentTime) => {
                        const elapsed = currentTime - startTime;
                        const progress = Math.min(elapsed / duration, 1);
                        const currentValue = startValue + (targetValue - startValue) * progress;

                        element.textContent = Math.round(currentValue * 100) / 100 + suffix;

                        if (progress < 1) {
                            requestAnimationFrame(animate);
                        }
                    };

                    requestAnimationFrame(animate);
                };

                // Animate all statistics
                setTimeout(() => {
                    animateNumber('totalStudents', stats.totalStudents);
                    animateNumber('totalStudentsIndicator', stats.totalStudents);
                    animateNumber('averageScore', stats.average);
                    animateNumber('averageScoreIndicator', stats.average);
                    animateNumber('medianScore', stats.median);
                    animateNumber('standardDeviation', stats.standardDeviation);
                    animateNumber('perfectScores', stats.perfectScores);
                    animateNumber('zeroScores', stats.zeroScores);
                    animateNumber('highestScore', stats.highestScore);
                    animateNumber('lowestScore', stats.lowestScore);
                }, 500);

                // Calculate insights
                const excellentCount = Object.keys(scoreData).reduce((count, scoreStr) => {
                    const score = parseFloat(scoreStr);
                    return score >= 8 ? count + scoreData[scoreStr] : count;
                }, 0);

                const needsImprovementCount = Object.keys(scoreData).reduce((count, scoreStr) => {
                    const score = parseFloat(scoreStr);
                    return score < 5 ? count + scoreData[scoreStr] : count;
                }, 0);

                const excellentPercentage = ((excellentCount / stats.totalStudents) * 100).toFixed(0);
                const needsImprovementPercentage = ((needsImprovementCount / stats.totalStudents) * 100).toFixed(0);

                // Update insights with delay for better UX
                setTimeout(() => {
                    document.getElementById('excellentPerformance').textContent =
                            `${excellentPercentage}% of students scored 8.0 or above`;
                    document.getElementById('needsImprovement').textContent =
                            `${needsImprovementPercentage}% of students scored below 5.0`;
                    document.getElementById('gradeDistribution').textContent =
                            'Well-distributed across score intervals with clear performance patterns';
                }, 1000);
            </script>
        </c:if>
        <script>
            // Form validation
            document.querySelector('form').addEventListener('submit', function (e) {
                const examSelect = document.querySelector('select[name="examId"]');

                if (!examSelect.value) {
                    e.preventDefault();
                    examSelect.focus();
                    examSelect.classList.add('border-red-500');

                    // Show error message if not already shown
                    if (!document.querySelector('.bg-red-50')) {
                        const errorDiv = document.createElement('div');
                        errorDiv.className = 'bg-red-50 border border-red-200 rounded-lg p-4 mb-6';
                        errorDiv.innerHTML = `
                            <div class="flex items-center">
                                <span class="text-red-500 text-xl mr-2">⚠️</span>
                                <strong class="text-red-800">Please select an exam to view statistics</strong>
                            </div>
                        `;
                        examSelect.closest('.bg-white').after(errorDiv);
                    }
                } else {
                    examSelect.classList.remove('border-red-500');
                }
            });

            // Smooth animations on load
            window.addEventListener('load', function () {
                const cards = document.querySelectorAll('.hover-lift');
                cards.forEach((card, index) => {
                    setTimeout(() => {
                        card.style.opacity = '0';
                        card.style.transform = 'translateY(20px)';
                        card.style.transition = 'opacity 0.6s ease, transform 0.6s ease';

                        setTimeout(() => {
                            card.style.opacity = '1';
                            card.style.transform = 'translateY(0)';
                        }, 100);
                    }, index * 150);
                });
            });
        </script>
    </body>
</html>
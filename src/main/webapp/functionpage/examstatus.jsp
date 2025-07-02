<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                        <th class="px-6 py-4 text-left text-sm">Exam</th>
                        <th class="px-6 py-4 text-left text-sm">Student ID</th>
                        <th class="px-6 py-4 text-left text-sm">Student Name</th>
                        <th class="px-6 py-4 text-left text-sm">Start Time</th>
                        <th class="px-6 py-4 text-center text-sm">Time Remaining</th>
                        <th class="px-6 py-4 text-center text-sm">Status</th>
                        <th class="px-6 py-4 text-center text-sm">Action</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-100">
                    <!-- Sample Exam Row 1 -->
                    <tr class="bg-white hover:bg-blue-50 transition-colors duration-200">
                        <td class="px-6 py-4">
                            <div class="bg-blue-100 text-blue-700 px-3 py-1 rounded-lg text-center text-sm w-16">
                                Exam 1
                            </div>
                        </td>
                        <td class="px-6 py-4 text-gray-700">ST001</td>
                        <td class="px-6 py-4 text-gray-700">John Smith</td>
                        <td class="px-6 py-4 text-gray-600">10:30 AM</td>
                        <td class="px-6 py-4 text-center">
                            <div class="bg-blue-50 px-3 py-2 rounded-lg inline-block">
                                <span id="countdown0" class="text-blue-600 font-mono text-sm">01:45:30</span>
                            </div>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <span id="status0" class="px-3 py-1 rounded-full text-sm bg-green-100 text-green-700">Exam Ongoing</span>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <button class="bg-red-500 hover:bg-red-600 text-white py-2 px-4 rounded-lg transition-colors text-sm shadow-sm hover:shadow-md">
                                Force Submit
                            </button>
                        </td>
                    </tr>

                    <!-- Sample Exam Row 2 -->
                    <tr class="bg-gray-50 hover:bg-blue-50 transition-colors duration-200">
                        <td class="px-6 py-4">
                            <div class="bg-gray-200 text-gray-700 px-3 py-1 rounded-lg text-center text-sm w-16">
                                Exam 2
                            </div>
                        </td>
                        <td class="px-6 py-4 text-gray-700">ST002</td>
                        <td class="px-6 py-4 text-gray-700">Sarah Johnson</td>
                        <td class="px-6 py-4 text-gray-600">09:15 AM</td>
                        <td class="px-6 py-4 text-center">
                            <div class="bg-gray-100 px-3 py-2 rounded-lg inline-block">
                                <span id="countdown1" class="text-gray-500 font-mono text-sm">00:00:00</span>
                            </div>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <span id="status1" class="px-3 py-1 rounded-full text-sm bg-red-100 text-red-700">Exam Finished</span>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <div class="bg-gray-200 text-gray-600 py-2 px-4 rounded-lg text-sm">
                                Completed
                            </div>
                        </td>
                    </tr>

                    <!-- Sample Exam Row 3 -->
                    <tr class="bg-white hover:bg-blue-50 transition-colors duration-200">
                        <td class="px-6 py-4">
                            <div class="bg-blue-100 text-blue-700 px-3 py-1 rounded-lg text-center text-sm w-16">
                                Exam 3
                            </div>
                        </td>
                        <td class="px-6 py-4 text-gray-700">ST003</td>
                        <td class="px-6 py-4 text-gray-700">Mike Davis</td>
                        <td class="px-6 py-4 text-gray-600">11:00 AM</td>
                        <td class="px-6 py-4 text-center">
                            <div class="bg-green-50 px-3 py-2 rounded-lg inline-block">
                                <span id="countdown2" class="text-green-600 font-mono text-sm">02:00:00</span>
                            </div>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <span id="status2" class="px-3 py-1 rounded-full text-sm bg-green-100 text-green-700">Exam Ongoing</span>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <button class="bg-red-500 hover:bg-red-600 text-white py-2 px-4 rounded-lg transition-colors text-sm shadow-sm hover:shadow-md">
                                Force Submit
                            </button>
                        </td>
                    </tr>

                    <!-- Sample Exam Row 4 -->
                    <tr class="bg-gray-50 hover:bg-blue-50 transition-colors duration-200">
                        <td class="px-6 py-4">
                            <div class="bg-blue-100 text-blue-700 px-3 py-1 rounded-lg text-center text-sm w-16">
                                Exam 4
                            </div>
                        </td>
                        <td class="px-6 py-4 text-gray-700">ST004</td>
                        <td class="px-6 py-4 text-gray-700">Emily Chen</td>
                        <td class="px-6 py-4 text-gray-600">10:45 AM</td>
                        <td class="px-6 py-4 text-center">
                            <div class="bg-yellow-50 px-3 py-2 rounded-lg inline-block">
                                <span id="countdown3" class="text-yellow-600 font-mono text-sm">00:15:45</span>
                            </div>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <span id="status3" class="px-3 py-1 rounded-full text-sm bg-yellow-100 text-yellow-700">Almost Done</span>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <button class="bg-red-500 hover:bg-red-600 text-white py-2 px-4 rounded-lg transition-colors text-sm shadow-sm hover:shadow-md">
                                Force Submit
                            </button>
                        </td>
                    </tr>

                    <!-- Sample Exam Row 5 -->
                    <tr class="bg-white hover:bg-blue-50 transition-colors duration-200">
                        <td class="px-6 py-4">
                            <div class="bg-blue-100 text-blue-700 px-3 py-1 rounded-lg text-center text-sm w-16">
                                Exam 5
                            </div>
                        </td>
                        <td class="px-6 py-4 text-gray-700">ST005</td>
                        <td class="px-6 py-4 text-gray-700">David Wilson</td>
                        <td class="px-6 py-4 text-gray-600">11:30 AM</td>
                        <td class="px-6 py-4 text-center">
                            <div class="bg-blue-50 px-3 py-2 rounded-lg inline-block">
                                <span id="countdown4" class="text-blue-600 font-mono text-sm">01:30:15</span>
                            </div>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <span id="status4" class="px-3 py-1 rounded-full text-sm bg-green-100 text-green-700">Exam Ongoing</span>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <button class="bg-red-500 hover:bg-red-600 text-white py-2 px-4 rounded-lg transition-colors text-sm shadow-sm hover:shadow-md">
                                Force Submit
                            </button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- Summary Stats -->
        <div class="mt-10 grid grid-cols-1 md:grid-cols-4 gap-6">
            <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 text-center hover:shadow-xl transition-shadow">
                <div class="text-2xl text-green-600 mb-2">4</div>
                <div class="text-gray-600 text-sm">Active Exams</div>
            </div>
            
            <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 text-center hover:shadow-xl transition-shadow">
                <div class="text-2xl text-red-600 mb-2">1</div>
                <div class="text-gray-600 text-sm">Completed Exams</div>
            </div>
            
            <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 text-center hover:shadow-xl transition-shadow">
                <div class="text-2xl text-yellow-600 mb-2">1</div>
                <div class="text-gray-600 text-sm">Almost Done</div>
            </div>
            
            <div class="bg-white rounded-xl shadow-lg border border-gray-100 p-6 text-center hover:shadow-xl transition-shadow">
                <div class="text-2xl text-blue-600 mb-2">5</div>
                <div class="text-gray-600 text-sm">Total Students</div>
            </div>
        </div>
    </div>

    <script>
        // Initialize countdowns for demo
        startCountdown(Date.now() + 6330000, "0"); // 1h 45m 30s remaining
        startCountdown(Date.now() + 7200000, "2"); // 2h remaining
        startCountdown(Date.now() + 945000, "3");  // 15m 45s remaining
        startCountdown(Date.now() + 5415000, "4"); // 1h 30m 15s remaining
    </script>
</body>
</html>
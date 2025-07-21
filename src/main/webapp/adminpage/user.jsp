<!DOCTYPE html>
<html lang="en">
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Management</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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

    <body class="bg-grey from-blue-50 to-indigo-100 min-h-screen">
        <!-- Navbar -->
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

        <div class="container mx-auto px-4 py-8" style="margin-top: 100px;">
            <!-- Header -->
            <div class="mb-8">
                <div class="flex items-center justify-between flex-wrap gap-4">
                    <h1 class="text-3xl font-bold text-gray-800">
                        <i class="fas fa-user-circle text-indigo-600 mr-3"></i>
                        User Management
                    </h1>
                    <a href="UserManagement"
                       class="back-button bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-md transition flex items-center">
                        <i class="fas fa-arrow-left mr-2"></i>
                        Back to Users
                    </a>
                </div>
                <p class="text-gray-600 mt-2">View and update user information</p>
            </div>

            <!-- User Information Card -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden mb-6">
                <!-- Card Header -->
                <div class="bg-gradient-to-r from-indigo-600 to-purple-600 px-6 py-4">
                    <h2 class="text-xl font-semibold text-white">
                        <i class="fas fa-id-card mr-2"></i>
                        User Information
                    </h2>
                </div>

                <!-- Card Content -->
                <div class="p-6">
                    <div class="space-y-4">
                        <div class="flex items-center py-3 border-b border-gray-200">
                            <div class="w-1/4">
                                <span class="text-sm font-medium text-gray-600">User ID:</span>
                            </div>
                            <div class="w-3/4">
                                <span class="text-gray-900">${user.userID}</span>
                            </div>
                        </div>

                        <div class="flex items-center py-3 border-b border-gray-200">
                            <div class="w-1/4">
                                <span class="text-sm font-medium text-gray-600">First Name:</span>
                            </div>
                            <div class="w-3/4">
                                <span class="text-gray-900">${user.firstName}</span>
                            </div>
                        </div>

                        <div class="flex items-center py-3 border-b border-gray-200">
                            <div class="w-1/4">
                                <span class="text-sm font-medium text-gray-600">Last Name:</span>
                            </div>
                            <div class="w-3/4">
                                <span class="text-gray-900">${user.lastName}</span>
                            </div>
                        </div>

                        <div class="flex items-center py-3 border-b border-gray-200">
                            <div class="w-1/4">
                                <span class="text-sm font-medium text-gray-600">Email:</span>
                            </div>
                            <div class="w-3/4">
                                <span class="text-gray-900">${user.email}</span>
                            </div>
                        </div>

                        <div class="flex items-center py-3">
                            <div class="w-1/4">
                                <span class="text-sm font-medium text-gray-600">Role:</span>
                            </div>
                            <div class="w-3/4">
                                <div class="flex items-center space-x-2">
                                    ${user.role == 1 ? 
                                      '<span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-blue-100 text-blue-800">Student</span>' : 
                                      '<span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-red-100 text-red-800">Admin</span>'}
                                    <span class="text-sm text-gray-500">(1: Student, 3: Admin)</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Update User Info Card -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden mb-6">
                <!-- Card Header -->
                <div class="bg-gradient-to-r from-indigo-600 to-purple-600 px-6 py-4">
                    <h2 class="text-xl font-semibold text-white">
                        <i class="fas fa-user-edit mr-2"></i>
                        Update User Information
                    </h2>
                </div>

                <!-- Card Content -->
                <div class="p-6">
                    <form action="AdminUpdateUser" method="post" class="space-y-6">
                        <input type="hidden" name="command" value="updateInfo">
                        <input type="hidden" name="userId" value="${user.userID}">

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label for="firstName" class="block text-sm font-medium text-gray-700 mb-2">
                                    <i class="fas fa-user mr-2 text-indigo-600"></i>First Name
                                </label>
                                <input type="text" 
                                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors" 
                                       id="firstName" 
                                       name="firstName" 
                                       value="${user.firstName}" 
                                       required>
                            </div>
                            <div>
                                <label for="lastName" class="block text-sm font-medium text-gray-700 mb-2">
                                    <i class="fas fa-user mr-2 text-indigo-600"></i>Last Name
                                </label>
                                <input type="text" 
                                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors" 
                                       id="lastName" 
                                       name="lastName" 
                                       value="${user.lastName}" 
                                       required>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <label for="email" class="block text-sm font-medium text-gray-700 mb-2">
                                    <i class="fas fa-envelope mr-2 text-indigo-600"></i>Email
                                </label>
                                <input type="email" 
                                       class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors" 
                                       id="email" 
                                       name="email" 
                                       value="${user.email}" 
                                       required>
                            </div>
                            <div>
                                <label for="role" class="block text-sm font-medium text-gray-700 mb-2">
                                    <i class="fas fa-user-tag mr-2 text-indigo-600"></i>Role
                                </label>
                                <select class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 transition-colors" 
                                        id="role" 
                                        name="role" 
                                        required>
                                    <option value="1" ${user.role == 1 ? 'selected' : ''}>Student</option>
                                    <option value="3" ${user.role == 3 ? 'selected' : ''}>Admin</option>
                                </select>
                            </div>
                        </div>

                        <div class="flex justify-end">
                            <button type="submit" 
                                    class="inline-flex items-center px-6 py-3 bg-indigo-600 hover:bg-indigo-700 text-white font-medium rounded-lg transition-colors duration-200 shadow-sm hover:shadow-md">
                                <i class="fas fa-save mr-2"></i>
                                Update Information
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Password Reset Card - REDESIGNED -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden mb-6">
                <!-- Card Header -->
                <div class="bg-gradient-to-r from-red-500 to-pink-600 px-6 py-4">
                    <h2 class="text-xl font-semibold text-white">
                        <i class="fas fa-shield-alt mr-2"></i>
                        Password Management
                    </h2>
                </div>

                <!-- Card Content -->
                <div class="p-8">
                    <div class="mb-6">
                        <div class="flex items-center mb-4">
                            <div class="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center mr-4">
                                <i class="fas fa-lock text-red-600 text-lg"></i>
                            </div>
                            <div>
                                <h3 class="text-lg font-semibold text-gray-800">Set New Password</h3>
                                <p class="text-sm text-gray-600">Create a strong password for enhanced security</p>
                            </div>
                        </div>
                    </div>

                    <form action="AdminUpdateUser" method="post" class="space-y-6">
                        <input type="hidden" name="command" value="updatePassword">
                        <input type="hidden" name="userId" value="${user.userID}">

                        <!-- Password Input Section -->
                        <div class="bg-gray-50 rounded-lg p-6">
                            <div class="max-w-md">
                                <label for="password" class="block text-sm font-semibold text-gray-700 mb-3">
                                    <i class="fas fa-key mr-2 text-red-500"></i>New Password
                                </label>
                                <div class="relative">
                                    <input type="password" 
                                           class="w-full px-4 py-3 border-2 border-gray-200 rounded-lg focus:ring-2 focus:ring-red-500 focus:border-red-500 transition-all duration-200 pr-12" 
                                           id="password" 
                                           name="password" 
                                           placeholder="Enter new password"
                                           required>
                                    <button type="button" 
                                            id="togglePassword" 
                                            class="absolute inset-y-0 right-0 flex items-center px-3 text-gray-500 hover:text-red-600 transition-colors">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                                <div class="mt-2 text-xs text-gray-500">
                                    <i class="fas fa-info-circle mr-1"></i>
                                    Password should be at least 8 characters long
                                </div>
                            </div>
                        </div>

                        <!-- Action Buttons -->
                        <div class="flex items-center justify-between pt-4 border-t border-gray-200">
                            <div class="text-sm text-gray-500">
                                <i class="fas fa-exclamation-triangle text-yellow-500 mr-1"></i>
                                This action will update the user's password immediately
                            </div>
                            <button type="submit" 
                                    class="inline-flex items-center px-8 py-3 bg-red-600 hover:bg-red-700 text-white font-semibold rounded-lg transition-all duration-200 shadow-lg hover:shadow-xl transform hover:-translate-y-0.5">
                                <i class="fas fa-save mr-2"></i>
                                Update Password
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Exam History Card - REDESIGNED -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                <!-- Card Header -->
                <div class="bg-gradient-to-r from-emerald-500 to-teal-600 px-6 py-4">
                    <h2 class="text-xl font-semibold text-white">
                        <i class="fas fa-chart-line mr-2"></i>
                        Academic Records
                    </h2>
                </div>

                <!-- Card Content -->
                <div class="p-8">
                    <div class="flex items-center justify-between">
                        <!-- Left Side - Info -->
                        <div class="flex items-center">
                            <div class="w-16 h-16 bg-emerald-100 rounded-full flex items-center justify-center mr-6">
                                <i class="fas fa-graduation-cap text-emerald-600 text-2xl"></i>
                            </div>
                            <div>
                                <h3 class="text-xl font-bold text-gray-800 mb-2">Exam History & Performance</h3>
                                <p class="text-gray-600 mb-1">View detailed exam records and performance analytics</p>
                                <div class="flex items-center text-sm text-gray-500">
                                    <i class="fas fa-user mr-2"></i>
                                    <span>User ID: ${user.userID}</span>
                                    <span class="mx-2">•</span>
                                    <i class="fas fa-clock mr-1"></i>
                                    <span>Real-time data</span>
                                </div>
                            </div>
                        </div>

                        <!-- Right Side - Action -->
                        <div class="text-center">
                            <form action="UserExamHistory" method="get">
                                <input type="hidden" name="id" value="${user.userID}">
                                <button type="submit" 
                                        class="inline-flex items-center px-8 py-4 bg-emerald-600 hover:bg-emerald-700 text-white font-semibold rounded-xl transition-all duration-200 shadow-lg hover:shadow-xl transform hover:-translate-y-1">
                                    <i class="fas fa-chart-bar mr-3 text-lg"></i>
                                    <div class="text-left">
                                        <div class="text-base">View Exam History</div>
                                    </div>
                                </button>
                            </form>
                        </div>
                    </div>

                    <!-- Additional Info Section -->
                    <div class="mt-8 pt-6 border-t border-gray-200">
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                            <div class="bg-blue-50 rounded-lg p-4 text-center">
                                <i class="fas fa-file-alt text-blue-600 text-2xl mb-2"></i>
                                <div class="text-sm font-semibold text-blue-800">Exam Results</div>
                                <div class="text-xs text-blue-600">Detailed scores</div>
                            </div>
                            <div class="bg-purple-50 rounded-lg p-4 text-center">
                                <i class="fas fa-trophy text-purple-600 text-2xl mb-2"></i>
                                <div class="text-sm font-semibold text-purple-800">Performance</div>
                                <div class="text-xs text-purple-600">Analytics & trends</div>
                            </div>
                            <div class="bg-orange-50 rounded-lg p-4 text-center">
                                <i class="fas fa-calendar-alt text-orange-600 text-2xl mb-2"></i>
                                <div class="text-sm font-semibold text-orange-800">Timeline</div>
                                <div class="text-xs text-orange-600">Chronological view</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            // Toggle password visibility
            document.getElementById('togglePassword').addEventListener('click', function () {
                const passwordInput = document.getElementById('password');
                const icon = this.querySelector('i');

                if (passwordInput.type === 'password') {
                    passwordInput.type = 'text';
                    icon.classList.remove('fa-eye');
                    icon.classList.add('fa-eye-slash');
                } else {
                    passwordInput.type = 'password';
                    icon.classList.remove('fa-eye-slash');
                    icon.classList.add('fa-eye');
                }
            });
        </script>
    </body>
</html>
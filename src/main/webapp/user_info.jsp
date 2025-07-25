<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Examination System User Profile</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            @import url('https://fonts.googleapis.com/css?family=Inter:wght@300;400;500;600;700&display=swap');
            body {
                font-family: 'Inter', sans-serif;
                background-color: #f5f7fa;
            }
            .sidebar {
                transition: all 0.3s ease;
            }
            .navbar-gradient {
                height: 81px;
            }
            .navbar-gradient h1{
                justify-content: center;
            }
            .p-4{
                margin-top: 17px;
            }
            .flex-1{
                margin-top: 17px;
            }
            @media (max-width: 768px) {
                .sidebar {
                    transform: translateX(-100%);
                }
                .sidebar.active {
                    transform: translateX(0);
                }
            }
            .form-input:focus {
                border-color: #4f46e5;
                box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.2);
            }
            .navbar-gradient {
                background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
            }
            .sidebar-item {
                transition: all 0.3s ease;
            }
            .sidebar-item:hover {
                background-color: #f8fafc;
                border-radius: 8px;
            }
            .sidebar-item.active {
                background-color: #e0e7ff;
                border-radius: 8px;
                color: #6366f1;
            }
        </style>
    </head>
    <body>
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
                    <link href="css/index.css" rel="stylesheet" type="text/css"/>
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


        <!-- Main Container -->
        <div class="flex pt-16 min-h-screen">
            <!-- Sidebar -->
            <aside id="sidebar" class="sidebar bg-white w-64 fixed h-full shadow-lg z-40 border-r border-gray-200">
                <div class="p-4">
                    <!-- Navigation Header -->
                    <div class="mb-8 mt-2">
                        <h2 class="text-lg font-semibold text-gray-700 mb-4">Navigation</h2>
                    </div>

                    <nav>
                        <ul class="space-y-2">
                            <li>
                                <a href="Home" class="sidebar-item flex items-center px-4 py-3 text-gray-700 font-medium">
                                    <i class="fas fa-home w-5 mr-4 text-lg"></i>
                                    Home 
                                </a>
                            </li>
                            <li>
                                <!-- Đây là trang hiện tại nên có class active -->
                                <a href="UserProfile" class="sidebar-item active flex items-center px-4 py-3 text-gray-700 font-medium">
                                    <i class="fas fa-user-edit w-5 mr-4 text-lg"></i>
                                    Update Information
                                </a>
                            </li>
                            <li>
                                <a href="ExamHistory" class="sidebar-item flex items-center px-4 py-3 text-gray-700 font-medium">
                                    <i class="fas fa-history w-5 mr-4 text-lg"></i>
                                    Exam History
                                </a>
                            </li>
                            <li>
                                <a href="ChangePassword" class="sidebar-item flex items-center px-4 py-3 text-gray-700 font-medium">
                                    <i class="fas fa-lock w-5 mr-4 text-lg"></i>
                                    Change Password
                                </a>
                            </li>
                        </ul>
                    </nav>

                    <div class="mt-12 pt-6 border-t border-gray-200">
                        <ul class="space-y-2">
                            <li>
                                <a href="logout" class="sidebar-item flex items-center px-4 py-3 text-gray-700 font-medium">
                                    <i class="fas fa-sign-out-alt w-5 mr-4 text-lg"></i>
                                    Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </aside>

            <!-- Main Content -->
            <main class="flex-1 ml-64 p-6 md:p-8 bg-gray-50">
                <div class="max-w-3xl mx-auto">
                    <!-- Page Header -->
                    <div class="mb-8">
                        <h1 class="text-2xl font-bold text-gray-800 flex items-center">
                            <i class="fas fa-user-edit mr-3 text-indigo-600"></i> User Information
                        </h1>
                        <p class="text-gray-600 mt-1">Update your personal information below</p>
                    </div>

                    <!-- User Profile Form -->
                    <div class="bg-white rounded-lg shadow-sm p-6 border border-gray-200">
                        <form action="UserProfile" method="post" class="space-y-6">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                <div>
                                    <label for="firstName" class="block text-sm font-medium text-gray-700 mb-1 flex items-center">
                                        <i class="fas fa-user mr-2 text-indigo-500"></i> First Name
                                    </label>
                                    <input type="text" 
                                           id="firstName" 
                                           name="firstName" 
                                           value="${user.firstName}" 
                                           placeholder="Enter your first name"
                                           class="form-input w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none transition"
                                           required />
                                </div>

                                <div>
                                    <label for="lastName" class="block text-sm font-medium text-gray-700 mb-1 flex items-center">
                                        <i class="fas fa-user mr-2 text-indigo-500"></i> Last Name
                                    </label>
                                    <input type="text" 
                                           id="lastName" 
                                           name="lastName" 
                                           value="${user.lastName}" 
                                           placeholder="Enter your last name"
                                           class="form-input w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none transition"
                                           required />
                                </div>
                            </div>

                            <div>
                                <label for="email" class="block text-sm font-medium text-gray-700 mb-1 flex items-center">
                                    <i class="fas fa-envelope mr-2 text-indigo-500"></i> Email Address
                                </label>
                                <input type="email" 
                                       id="email" 
                                       name="email" 
                                       value="${user.email}" 
                                       placeholder="Enter your email address"
                                       class="form-input w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none transition"
                                       required />
                            </div>

                            <div class="pt-4">
                                <button type="submit" 
                                        id="submitUpdate"
                                        class="w-full bg-indigo-600 hover:bg-indigo-700 text-white font-medium py-3 px-4 rounded-md transition flex items-center justify-center">
                                    <i class="fas fa-save mr-2"></i> Update Information
                                </button>
                            </div>  
                        </form>
                    </div>

                    <!-- Additional Information Card -->
                    <div class="mt-8 bg-white rounded-lg shadow-sm p-6 border border-gray-200">
                        <h2 class="text-lg font-semibold text-gray-800 mb-4 flex items-center">
                            <i class="fas fa-info-circle mr-2 text-indigo-500"></i> Account Information
                        </h2>

                        <div class="space-y-4">
                            <div class="flex border-b border-gray-100 pb-3">
                                <div class="w-1/3 text-gray-600">Account Type:</div>
                                <div class="w-2/3 font-medium">Student</div>
                            </div>

                            <div class="flex border-b border-gray-100 pb-3">
                                <div class="w-1/3 text-gray-600">Member Since:</div>
                                <div class="w-2/3 font-medium">January 15, 2023</div>
                            </div>

                            <div class="flex border-b border-gray-100 pb-3">
                                <div class="w-1/3 text-gray-600">Last Login:</div>
                                <div class="w-2/3 font-medium">Today at 9:30 AM</div>
                            </div>

                            <div class="flex">
                                <div class="w-1/3 text-gray-600">Status:</div>
                                <div class="w-2/3 font-medium">
                                    <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                        <span class="w-1.5 h-1.5 inline-block bg-green-500 rounded-full mr-1.5"></span>
                                        Active
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <script>
            // Mobile menu toggle
            document.getElementById('mobile-menu-button').addEventListener('click', function () {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('active');
            });

            // Không cần script để set active state nữa vì đã hardcode trong HTML
            // Class 'active' chỉ được đặt ở trang hiện
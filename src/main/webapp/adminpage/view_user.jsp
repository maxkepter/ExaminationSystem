<%-- 
    Document   : view_user
    Created on : Jun 25, 2025, 11:05:54 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
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

        <div class="container mx-auto px-4 py-8" style="margin-top: 100px;" >
            <!-- Header -->
            <div class="mb-8">
                <div class="flex items-center justify-between flex-wrap gap-4">
                    <h1 class="text-3xl font-bold text-gray-800">
                        <i class="fas fa-users text-indigo-600 mr-3"></i>
                        User Management
                    </h1>
                    <a href="adminhome"
                       class="back-button bg-gray-100 hover:bg-gray-200 text-gray-700 font-medium py-2 px-4 rounded-md transition flex items-center">
                        <i class="fas fa-arrow-left mr-2"></i>
                        Back to History
                    </a>
                </div>
                <p class="text-gray-600 mt-2">Manage and view user information</p>
            </div>


            <!-- Error Message -->
            <c:if test="${not empty errorMessage}">
                <div class="mb-6 p-4 bg-red-100 border border-red-400 text-red-700 rounded-lg shadow-sm">
                    <i class="fas fa-exclamation-triangle mr-2"></i>
                    <span>${errorMessage}</span>
                </div>
            </c:if>

            <!-- Users Table Card -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden">
                <!-- Table Header -->
                <div class="bg-gradient-to-r from-indigo-600 to-purple-600 px-6 py-4">
                    <h2 class="text-xl font-semibold text-white">
                        <i class="fas fa-table mr-2"></i>
                        Users List
                    </h2>
                </div>

                <!-- Table Content -->
                <c:choose>
                    <c:when test="${not empty userList}">
                        <div class="overflow-x-auto">
                            <table class="w-full">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            <i class="fas fa-id-badge mr-2"></i>User ID
                                        </th>
                                        <th class="px-6 py-4 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            <i class="fas fa-user mr-2"></i>Full Name
                                        </th>
                                        <th class="px-6 py-4 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            <i class="fas fa-eye mr-2"></i>View Info
                                        </th>
                                        <th class="px-6 py-4 text-center text-xs font-medium text-gray-500 uppercase tracking-wider">
                                            <i class="fas fa-trash mr-2"></i>Delete
                                        </th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <c:forEach var="user" items="${userList}" varStatus="status">
                                        <tr class="hover:bg-gray-50 transition-colors duration-200">
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="flex items-center">
                                                    <div class="w-8 h-8 bg-indigo-100 rounded-full flex items-center justify-center mr-3">
                                                        <span class="text-indigo-600 font-semibold text-sm">${status.index + 1}</span>
                                                    </div>
                                                    <span class="text-sm font-medium text-gray-900">${user.userID}</span>
                                                </div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap">
                                                <div class="flex items-center">
                                                    <div>
                                                        <div class="text-xl font-semibold text-gray-900">${user.fullName}</div>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-center">
                                                <form action="User" method="get" style="display: inline;">
                                                    <input type="hidden" name="userId" value="${user.userID}">
                                                    <button type="submit" class="inline-flex items-center px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white text-sm font-medium rounded-lg transition-colors duration-200 shadow-sm hover:shadow-md">
                                                        <i class="fas fa-eye mr-2"></i>
                                                        View
                                                    </button>
                                                </form>
                                            </td>
                                            <td class="px-6 py-4 whitespace-nowrap text-center">
                                                <button onclick="confirmDelete('${user.userID}', '${user.fullName}')" class="inline-flex items-center px-4 py-2 bg-red-600 hover:bg-red-700 text-white text-sm font-medium rounded-lg transition-colors duration-200 shadow-sm hover:shadow-md">
                                                    <i class="fas fa-trash mr-2"></i>
                                                    Delete
                                                </button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Empty State -->
                        <div class="text-center py-12">
                            <i class="fas fa-users text-gray-300 text-6xl mb-4"></i>
                            <h3 class="text-lg font-medium text-gray-900 mb-2">No users found</h3>
                            <p class="text-gray-500">There are no users to display at the moment.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Delete Confirmation Modal -->
            <div id="deleteModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
                <div class="bg-white rounded-xl shadow-2xl max-w-md w-full mx-4 transform transition-all">
                    <div class="p-6">
                        <div class="flex items-center mb-4">
                            <div class="w-12 h-12 bg-red-100 rounded-full flex items-center justify-center mr-4">
                                <i class="fas fa-exclamation-triangle text-red-600 text-xl"></i>
                            </div>
                            <h3 class="text-lg font-semibold text-gray-900">Confirm Delete</h3>
                        </div>
                        <p class="text-gray-600 mb-6">
                            Are you sure you want to delete user <span id="deleteUserName" class="font-semibold"></span>? This action cannot be undone.
                        </p>
                        <div class="flex space-x-3">
                            <button onclick="closeDeleteModal()" class="flex-1 px-4 py-2 bg-gray-200 hover:bg-gray-300 text-gray-800 font-medium rounded-lg transition-colors duration-200">
                                Cancel
                            </button>
                            <button onclick="deleteUser()" class="flex-1 px-4 py-2 bg-red-600 hover:bg-red-700 text-white font-medium rounded-lg transition-colors duration-200">
                                Delete
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <script>
                let currentDeleteUserId = null;

                function confirmDelete(userId, userName) {
                    currentDeleteUserId = userId;
                    document.getElementById('deleteUserName').textContent = userName;
                    document.getElementById('deleteModal').classList.remove('hidden');
                    document.getElementById('deleteModal').classList.add('flex');
                }

                function closeDeleteModal() {
                    document.getElementById('deleteModal').classList.add('hidden');
                    document.getElementById('deleteModal').classList.remove('flex');
                    currentDeleteUserId = null;
                }

                function deleteUser() {
                    if (currentDeleteUserId) {
                        // Create form and submit for deleting user
                        const form = document.createElement('form');
                        form.method = 'post';
                        form.action = 'DeleteUser';

                        const input = document.createElement('input');
                        input.type = 'hidden';
                        input.name = 'userId';
                        input.value = currentDeleteUserId;

                        form.appendChild(input);
                        document.body.appendChild(form);
                        form.submit();
                    }
                    closeDeleteModal();
                }

                // Close modal when clicking outside
                document.getElementById('deleteModal').addEventListener('click', function (e) {
                    if (e.target === this) {
                        closeDeleteModal();
                    }
                });

                // Close modal with Escape key
                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape') {
                        closeDeleteModal();
                    }
                });
            </script>
    </body>
</html>
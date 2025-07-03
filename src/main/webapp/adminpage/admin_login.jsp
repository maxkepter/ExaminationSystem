<%-- 
    Document   : admin_login
    Created on : Jun 2, 2025, 11:31:10 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Admin Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <% String error = (String) request.getAttribute("error"); %>
    </head>
    <body class="min-h-screen bg-gradient-to-r from-red-400 to-orange-500 flex items-center justify-center">
        <div class="bg-white rounded-2xl shadow-xl w-full max-w-md p-8">
            <div class="flex flex-col items-center mb-6">
                <div class="bg-red-600 p-4 rounded-full flex items-center justify-center">
                    <a href="../index.jsp">
                        <svg class="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"></path>
                        </svg>
                    </a>
                </div>

                <h2 class="text-2xl font-bold mt-4 text-red-600">Admin Access</h2>
                <p class="text-sm text-gray-500">Sign in to admin panel</p>
            </div>

            <form action="HandleAdminLogin" method="post" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Username</label>
                    <input id="username" name="username" required type="text" placeholder="Enter admin username" class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Password</label>
                    <input id="password" name="password" required type="password" placeholder="Enter admin password" class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-red-400" />
                </div>

                <div class="flex items-center">
                    <label class="text-sm text-gray-700"><input type="checkbox" name="remember" class="mr-2"> Remember me</label>
                </div>

                <% if (error != null) { %>
                <div class="error text-red-500 text-sm"><%= error %></div>
                <% } %>

                <input type="submit" value="Login" class="w-full bg-gradient-to-r from-red-500 to-orange-500 text-white py-2 rounded-lg hover:opacity-90 transition cursor-pointer" />
            </form>

            <p class="text-center text-sm text-gray-600 mt-4">
                <a href="Login" class="text-red-600 hover:underline">← Back to User Login</a>
            </p>
        </div>
    </body>
</html>
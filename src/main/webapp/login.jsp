<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.lang.String" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <% String error = (String) request.getAttribute("error"); %>
    </head>
    <body class="min-h-screen bg-gradient-to-r from-indigo-400 to-purple-500 flex items-center justify-center">
        <div class="bg-white rounded-2xl shadow-xl w-full max-w-md p-8">
            <div class="flex flex-col items-center mb-6">


                <div class="bg-indigo-600 p-4 rounded-full flex items-center justify-center">
                    <a href="index.jsp">
                        <img src="./img/purple.png" alt="Ảnh tím" style="border-radius: 15px; width: 50px; height: 50px; object-fit: cover;" />
                    </a>
                </div>

                <h2 class="text-2xl font-bold mt-4">Welcome Back</h2>
                <p class="text-sm text-gray-500">Sign in to your account</p>
            </div>

            <form action="Login" method="POST" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Username</label>
                    <input id="username" name="username" required type="text" placeholder="Enter your username" class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" />
                </div>

                <div>
                    <div class="flex justify-between items-center">
                        <label class="block text-sm font-medium text-gray-700">Password</label>
                        <a href="asstrox.html" class="text-sm text-indigo-600 hover:underline">Forgot password?</a>
                    </div>
                    <input id="password" name="password" required type="password" placeholder="Enter your password" class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" />
                </div>
                <div class="flex items-center">
                    <label class="text-sm text-gray-700"><input type="checkbox" name="remember" class="mr-2"> Remember me</label>
                </div>
                <% if (error != null) { %>
                <div class="error text-red-500 text-sm"><%= error %></div>
                <% } %>

                <input type="submit" value="Login" class="w-full bg-gradient-to-r from-indigo-500 to-purple-500 text-white py-2 rounded-lg hover:opacity-90 transition cursor-pointer" />
            </form>

            <p class="text-center text-sm text-gray-600 mt-4">
                Don't have an account?
                <a href="Register" class="text-indigo-600 hover:underline">Sign up</a>
            </p>
        </div>
    </body>
</html>

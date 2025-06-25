<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Register Page</title>
        <script src="https://cdn.tailwindcss.com"></script>

        <%
            String error = (String) request.getAttribute("error");
        %>
    </head>
    <body class="min-h-screen bg-gradient-to-r from-indigo-400 to-purple-500 flex items-center justify-center py-8">
        <div class="bg-white rounded-2xl shadow-xl w-full max-w-md p-8">
            <div class="flex flex-col items-center mb-6">
                <h2 class="text-2xl font-bold mt-4">Create Account</h2>
                <p class="text-sm text-gray-500">Sign up for a new account</p>
            </div>
            <form id="registerForm" action="Register" method="post" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Username</label>
                    <input id="username" name="userName" required type="text" placeholder="Enter your username" class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" />
                </div>
                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700">First Name</label>
                        <input id="firstName" name="firstName" required type="text" placeholder="First name" class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Last Name</label>
                        <input id="lastName" name="lastName" required type="text" placeholder="Last name" class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" />
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Email</label>
                    <input id="email" name="email" required type="email" placeholder="Enter your email" class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" />
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Password</label>
                    <input id="password" name="password" required type="password" placeholder="Enter your password" class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" />
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Confirm Password</label>
                    <input id="confirmPassword" name="confirmPassword" required type="password" placeholder="Confirm your password" class="w-full mt-1 px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-indigo-400" />
                    <div id="passwordError" class="text-red-500 text-sm mt-1 hidden"></div>
                </div>
                <% if (error != null) { %>
                <div class="error text-red-500 text-sm"><%= error %></div>
                <% } %>
                <input type="submit" value="Register" class="w-full bg-gradient-to-r from-indigo-500 to-purple-500 text-white py-2 rounded-lg hover:opacity-90 transition cursor-pointer" />
            </form>
            <p class="text-center text-sm text-gray-600 mt-4">
                Already have an account?
                <a href="Login" class="text-indigo-600 hover:underline">Sign in</a>
            </p>
        </div>
        <script>
            // DOM Ready
            document.addEventListener('DOMContentLoaded', function () {
                const form = document.getElementById('registerForm');
                const password = document.getElementById('password');
                const confirmPassword = document.getElementById('confirmPassword');
                const errorDiv = document.getElementById('passwordError'); // Ensure this ID exists in HTML

                form.addEventListener('submit', function (e) {
                    const pass = password.value;
                    const confirm = confirmPassword.value;

                    if (pass !== confirm) {
                        e.preventDefault(); // Prevent form submission
                        errorDiv.textContent = 'Password confirmation does not match.';
                        errorDiv.classList.remove('hidden');
                        confirmPassword.focus();
                    } else {
                        errorDiv.classList.add('hidden'); // Hide error if passwords match
                    }
                });

                // Hide error message when user re-types
                confirmPassword.addEventListener('input', function () {
                    if (!errorDiv.classList.contains('hidden')) {
                        errorDiv.classList.add('hidden');
                    }
                });
            });
        </script>
    </body>
</html>

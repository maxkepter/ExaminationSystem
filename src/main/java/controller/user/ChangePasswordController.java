/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import java.io.IOException;

import exception.login.AuthenticationException;
import jakarta.mail.Header;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.user.User;
import service.user.ChangePasswordService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChangePasswordController", urlPatterns = { "/ChangePassword" })
public class ChangePasswordController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getCookies();

        // Get the current user from the session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // If user is not logged in, redirect to login page
            response.sendRedirect("Login");
            return;
        }

        request.getRequestDispatcher("change_password.jsp").forward(request, response);
        return;

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the current user from the session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            // If user is not logged in, redirect to login page
            response.sendRedirect("login.jsp");
            return;
        }
        // Get the new password from the request
        String newPassword = request.getParameter("newPassword");
        String oldPassword = request.getParameter("currentPassword");
        ChangePasswordService changePasswordService = new ChangePasswordService();
        try {
            // Change the password
            changePasswordService.changePassword(user.getUserID(), oldPassword, newPassword);
            // If successful, redirect to the user profile page
            request.setAttribute("success", "Password changed successfully!");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
            return;
        } catch (IllegalArgumentException e) {
            // If there is an error with the input data, set an error message and forward
            // to the change password page
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
            return;
        } catch (AuthenticationException e) {
            // If the old password is incorrect, set an error message and forward to the
            // change password page
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
            return;
        } catch (Exception e) {
            // Handle any other unexpected exceptions
            request.setAttribute("error", "An unexpected error occurred. Please try again.");
            request.getRequestDispatcher("change_password.jsp").forward(request, response);
            return;
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

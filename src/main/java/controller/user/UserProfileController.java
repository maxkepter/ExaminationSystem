/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.user;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.user.User;
import service.user.UpdateUserInfoService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UserUserProfileController", urlPatterns = { "/UserProfile" })
public class UserProfileController extends HttpServlet {

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
        // get user information
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        if (user == null) {
            // If user is not logged in, redirect to login page
            response.sendRedirect("Login");
            return;
        }
        // Set user information as request attributes
        request.setAttribute(User.USER_FIRSTNAME, user.getFirstName());
        request.setAttribute(User.USER_LASTNAME, user.getLastName());
        request.setAttribute(User.USER_EMAIL, user.getEmail());

        request.getRequestDispatcher("user_info.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            // If user is not logged in, redirect to login page
            response.sendRedirect("login.jsp");
            return;
        }

        // get user information from request
        String newFirstName = request.getParameter(User.USER_FIRSTNAME);
        String newLastName = request.getParameter(User.USER_LASTNAME);
        String newEmail = request.getParameter(User.USER_EMAIL);

        UpdateUserInfoService updateUserInfoService = new UpdateUserInfoService();

        try {
            updateUserInfoService.update(user.getUserID(), newFirstName, newLastName, newEmail);
        } catch (IllegalArgumentException e) {
            // If there is an error, set the error message in the request and forward to the
            // user info page
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("user_info.jsp").forward(request, response);
            return;
        }
        response.sendRedirect(request.getContextPath() + "/UserProfile");
        return;

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

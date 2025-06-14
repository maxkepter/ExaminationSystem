/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.login;

import java.io.IOException;

import exception.login.AccountBannedException;
import exception.login.AuthenticationException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.user.User;
import service.authentication.LoginService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminLoginController", urlPatterns = { "/AdminLogin" })
public class AdminLoginController extends HttpServlet {

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
        request.getRequestDispatcher("adminpage/admin_login.jsp").forward(request, response);

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
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginService loginService = new LoginService();
        User user = null;
        try {
            user = loginService.adminLogin(username, password);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Username or password cannot be blank !");
            request.getRequestDispatcher("adminpage/admin_login.jsp").forward(request, response);
            return;
        } catch (AuthenticationException e) {
            response.sendRedirect(request.getContextPath() + "/Home");
            return;
        } catch (AccountBannedException e) {
            request.setAttribute("error", "This account is banned !");
            request.getRequestDispatcher("adminpage/admin_login.jsp").forward(request, response);
            return;
        }
        // Create session and storge user info
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        // If login is successful, redirect to the home page
        response.sendRedirect(request.getContextPath() + "/AdminHome");

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

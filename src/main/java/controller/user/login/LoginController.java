/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.login;

import java.io.IOException;

import exception.login.AccountBannedException;
import exception.login.AuthenticationException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.user.User;
import service.authentication.LoginService;
import utils.Validate;

/**
 *
 * @author Admin
 */
@WebServlet(name = "LoginController", urlPatterns = { "/Login" })
public class LoginController extends HttpServlet {

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
        if (request.getSession() != null && (User) request.getSession().getAttribute("user") != null) {
            response.sendRedirect(request.getContextPath() + "/Home");
            return;
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        String rememberLogin = request.getParameter("remember");
        LoginService loginService = new LoginService();
        User user = null;
        try {
            user = loginService.login(username, password);
        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Username or password cannot be blank !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        } catch (AuthenticationException e) {
            request.setAttribute("error", "Username or password is incorrect !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        } catch (AccountBannedException e) {
            request.setAttribute("error", "This account is banned !");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Create session and storge user info
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        System.out.println(rememberLogin);

        if (Validate.validateString(rememberLogin)) {
            Cookie cookie = new Cookie("rememberUser", user.getUserID().toString());
            cookie.setMaxAge(60 * 60 * 24 * 30); // 30 ngày
            cookie.setPath("/");
            response.addCookie(cookie);
        }
        // If login is successful, redirect to the home page
        response.sendRedirect(request.getContextPath() + "/Home");

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

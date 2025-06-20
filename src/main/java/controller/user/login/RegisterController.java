/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.login;

import java.io.IOException;

import exception.register.UserNameDuplicatedException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.PrintWriter;
import model.user.User;
import service.authentication.RegisterService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ResgisterController", urlPatterns = {"/Register"})
public class RegisterController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        RegisterService registerService = new RegisterService();
        User user = null;
        try {
            System.out.println("Test");
            user = registerService.register(userName, password, new User(firstName, lastName, 1, email));
            System.out.println("Register Test");

        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        } catch (UserNameDuplicatedException e) {
            e.printStackTrace();
            request.setAttribute("error", "Username already exists. Please choose a different username.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        // Create session and storge user info
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        // If registration is successful, redirect to the home page
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

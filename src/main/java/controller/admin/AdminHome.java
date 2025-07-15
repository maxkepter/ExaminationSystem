/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import java.io.IOException;

import factory.DAOFactory;
import filter.RoleFilter;
//import filter.RoleFilter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.user.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminHome", urlPatterns = { "/AdminHome" })
public class AdminHome extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */

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
        User user = (User) request.getSession().getAttribute("user");
        if (!RoleFilter.isAdmin(user)) {
            response.sendRedirect(request.getContextPath() + "/Home");
            return;
        }
        long countExam = DAOFactory.getExamDao().count();
        long countUser = DAOFactory.getUserDao().count();
        long countQuestion = DAOFactory.getQuestionDao().count();
        long countSubject = DAOFactory.getSubjectDao().count();

        System.out.println("Count Exam: " + countExam);
        System.out.println("Count User: " + countUser);
        System.out.println("Count Question: " + countQuestion);
        System.out.println("Count Subject: " + countSubject);

        request.setAttribute("countExam", countExam);
        request.setAttribute("countUser", countUser);
        request.setAttribute("countQuestion", countQuestion);
        request.setAttribute("countSubject", countSubject);

        request.getRequestDispatcher("adminpage/admin_home.jsp").forward(request, response);
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

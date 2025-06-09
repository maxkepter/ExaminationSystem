/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.exam;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.user.User;
import repository.exam.ExamDAO;

/**
 *
 * @author MasterLong
 */
public class HandleUpdateAndDeleteExam extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HandleUpdateAndDeleteExam</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleUpdateAndDeleteExam at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        boolean update = request.getParameter("update") != null;
        boolean delete = request.getParameter("delete") != null;
        ExamDAO examDAO = new ExamDAO();
        if (update) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                Integer id = Integer.valueOf(request.getParameter("id"));
                String examName = request.getParameter("examName");
                Integer duration = Integer.valueOf(request.getParameter("duration"));
                User user = (User) session.getAttribute("user");
                examDAO.updateExam(id, examName, duration, user);
            }
             response.sendRedirect(request.getContextPath() + "/HandleViewAllExam");
        }
        if (delete) {
            int id = Integer.parseInt(request.getParameter("id"));
            examDAO.deleteExamById(id);
            response.sendRedirect(request.getContextPath() + "/HandleViewAllExam");
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

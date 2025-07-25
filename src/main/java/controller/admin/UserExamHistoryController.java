/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.exam.student.StudentExam;
import service.student.exam.ExamHistoryService;
import utils.Validate;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UserExamHistoryController", urlPatterns = { "/UserExamHistory" })
public class UserExamHistoryController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserExamHistoryController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserExamHistoryController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
        String userIdStr = request.getParameter("userId");
        String numPageStr = request.getParameter("numPage");
        int[] maxPage = { 0 };
        int numPage = 0;
        if (Validate.validateInteger(numPageStr)) {
            numPage = Integer.parseInt(numPageStr);
        }
        List<StudentExam> studentExamms = null;
        try {
            int userId = Integer.parseInt(userIdStr);
            ExamHistoryService examHistoryService = new ExamHistoryService();
            studentExamms = examHistoryService.getHistory(userId, numPage, maxPage);

        } catch (Exception e) {
            String error = e.getMessage();
            request.setAttribute("error", error);
            request.getRequestDispatcher("/student/exam_history.jsp").forward(request, response);
            return;
        }
        request.setAttribute("numPage", numPage);
        request.setAttribute("maxNumPage", maxPage[0]);
        request.setAttribute("studentExams", studentExamms);
        request.getRequestDispatcher("/student/exam_history.jsp").forward(request, response);
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
        processRequest(request, response);
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

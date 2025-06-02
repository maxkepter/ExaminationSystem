/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.exam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.exam.Exam;
import repository.exam.ExamDao;

/**
 *
 * @author FPT SHOP
 */
public class ExamController extends HttpServlet {

    @PersistenceUnit(unitName = "quizPU")
    private ExamDao examDAO;

    @Override
    public void init() {
        examDAO = new ExamDao();
    }

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
            out.println("<title>Servlet ExamServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExamServlet at " + request.getContextPath() + "</h1>");
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
         String action = request.getParameter("action");

        if ("search".equals(action)) {
            String examID = request.getParameter("examID");

            Exam exam = examDAO.findExamById(examID);
            if (exam != null) {
                request.getSession().setAttribute("examResult", exam);
                response.sendRedirect(request.getContextPath() + "/student/exam.jsp");
            } else {
                request.setAttribute("message", "Không tìm thấy đề thi.");
                request.getRequestDispatcher("/student/findCode.jsp").forward(request, response);
            }
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * 🗿🤌🗿🗿🗿✍️(◔◡◔)╰(*°▽°*)╯(❁´◡`❁)(●'◡'●)(づ￣ 3￣)づ
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("search".equals(action)) {
            String examID = request.getParameter("examID");

            Exam exam = examDAO.findExamById(examID);
            if (exam != null) {
                request.getSession().setAttribute("examResult", exam);
                response.sendRedirect(request.getContextPath() + "/student/exam.jsp");
            } else {
                request.setAttribute("message", "Không tìm thấy đề thi.");
                request.getRequestDispatcher("/student/findCode.jsp").forward(request, response);
            }
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

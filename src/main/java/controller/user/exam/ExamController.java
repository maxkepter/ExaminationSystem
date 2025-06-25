/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.exam;

import factory.EntityManagerFactoryProvider;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceUnit;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import model.exam.Exam;
import repository.exam.ExamDao;
import service.exam.ExamService;

/**
 *
 * @author FPT SHOP
 */
public class ExamController extends HttpServlet {

    @PersistenceUnit(unitName = "quizPU")
    // private ExamDao examDAO;
    private EntityManagerFactory emf;
    private ExamService examService;

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
            out.println("<title>Servlet ExamServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExamServlet at " + request.getContextPath() + "</h1>");
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
    /**
     * Handles the HTTP <code>POST</code> method.
     * 🗿🤌🗿🗿🗿✍️(◔◡◔)╰(*°▽°*)╯(❁´◡`❁)(●'◡'●)(づ￣ 3￣)づ
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        ExamDao examDAO = new ExamDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Exam.class);
        String action = request.getParameter("action");
        if ("search".equals(action)) {
            String examCode = request.getParameter("examCode");
            List<Exam> exams = examDAO.findByProperty("examCode", examCode);
            if (!exams.isEmpty()) {
                request.setAttribute("exams", exams);
                request.setAttribute("message", "Tìm thấy mã đề thi: " + examCode);
            } else {
                request.setAttribute("message", "Không tìm thấy đề thi với mã: " + examCode);
            }
        }

        request.getRequestDispatcher("/student/findCode.jsp").forward(request, response);
    }
}

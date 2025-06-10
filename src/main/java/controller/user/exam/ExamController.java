/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user.exam;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceUnit;
import jakarta.persistence.TypedQuery;
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
//    private ExamDao examDAO;
    private EntityManagerFactory emf;

    @Override
    public void init() {
        emf = Persistence.createEntityManagerFactory("ExamManagement");
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
//        EntityManager em = emf.createEntityManager();
//
//        String action = request.getParameter("action");
//        if ("search".equals(action)) {
//            String examCode = request.getParameter("examCode");
//
//            if (examCode != null && !examCode.isEmpty()) {
//                // Truy vấn trực tiếp Exam bằng examCode
//                TypedQuery<Exam> query = em.createQuery(
//                        "SELECT e FROM Exam e WHERE e.examCode = :code", Exam.class);
//                query.setParameter("code", examCode);
//
//                Exam exam = query.getResultStream().findFirst().orElse(null);
//
//                if (exam != null) {
//                    request.setAttribute("examResult", exam);
//                    request.setAttribute("message", "Tìm thấy mã đề thi: " + examCode);
//                } else {
//                    request.setAttribute("message", "Không tìm thấy đề thi với mã: " + examCode);
//                }
//            }
//        }
//
//        em.close();
//        request.getRequestDispatcher("/student/findCode.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * 🗿🤌🗿🗿🗿✍️(◔◡◔)╰(*°▽°*)╯(❁´◡`❁)(●'◡'●)(づ￣ 3￣)づ
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EntityManager em = emf.createEntityManager();

        String action = request.getParameter("action");
        if ("search".equals(action)) {
            String examCode = request.getParameter("examCode");

            if (examCode != null && !examCode.isEmpty()) {

                TypedQuery<Exam> query = em.createQuery(
                        "SELECT e FROM Exam e WHERE e.examCode = :code", Exam.class);
                query.setParameter("code", examCode);

                Exam exam = query.getResultStream().findFirst().orElse(null);

                if (exam != null) {
                    request.setAttribute("exam", exam);
                    request.setAttribute("message", "Tìm thấy mã đề thi: " + examCode);
                } else {
                    request.setAttribute("message", "Không tìm thấy đề thi với mã: " + examCode);
                }
            }
        }

        em.close();
        request.getRequestDispatcher("/student/findCode.jsp").forward(request, response);
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

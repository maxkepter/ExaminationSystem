/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.exam;

import factory.EntityManagerFactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.exam.Exam;
import model.exam.Question;
import model.exam.QuestionExam;
import model.exam.QuestionOption;
import model.user.User;
import repository.exam.ExamDao;
import repository.exam.QuestionExamDao;
import repository.exam.QuestionOptionDao;

/**
 *
 * @author MasterLong
 */
public class HandleViewAllExam extends HttpServlet {

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
            out.println("<title>Servlet HandleViewAllExam</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleViewAllExam at " + request.getContextPath() + "</h1>");
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

        boolean update = request.getParameter("update") != null;
        boolean delete = request.getParameter("delete") != null;
        boolean viewDetail = request.getParameter("viewDetail") != null;
        boolean viewStatus = request.getParameter("viewStatus") != null;
        ExamDao examDAO = new ExamDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Exam.class);
        QuestionExamDao QuestionExamDao = new QuestionExamDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                QuestionExam.class);
        QuestionOptionDao questionOptionDao = new QuestionOptionDao(
                EntityManagerFactoryProvider.getEntityManagerFactory(), QuestionOption.class);
        if (update) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                Integer id = Integer.valueOf(request.getParameter("id"));
                String examName = request.getParameter("examName");
                Integer duration = Integer.valueOf(request.getParameter("duration"));
                User user = (User) session.getAttribute("user");
                String examCode = request.getParameter("examCode");
                Exam newExam = new Exam(id, duration, examName, user, examCode);
                examDAO.update(newExam, id);
            }
            response.sendRedirect(request.getContextPath() + "/adminhome/all_exam");
        }
        if (delete) {
            int id = Integer.parseInt(request.getParameter("id"));
            examDAO.deleteById(id);
            response.sendRedirect(request.getContextPath() + "/adminhome/all_exam");
            return;
        }
        if (viewDetail) {
            int id = Integer.parseInt(request.getParameter("id"));
            List<Question> questionExamList = QuestionExamDao.findQuestionByProperty("exam.examID", id);
            request.setAttribute("allQuestion", questionExamList);
            request.getRequestDispatcher("/functionpage/examdetail.jsp").forward(request, response);
            return;
        }
        if (viewStatus) {
            String examID = request.getParameter("id");
            response.sendRedirect(request.getContextPath() + "/adminhome/exam_status?examID=" + examID);
            return;
        }

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

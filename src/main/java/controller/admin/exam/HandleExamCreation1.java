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
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ThreadLocalRandom;
import model.exam.Exam;
import model.exam.Question;
import model.exam.QuestionExam;
import model.user.User;
import repository.exam.ExamDao;
import repository.exam.QuestionDao;
import repository.exam.QuestionExamDao;
import repository.user.UserDao;

/**
 *
 * @author MasterLong
 */
public class HandleExamCreation1 extends HttpServlet {

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
            out.println("<title>Servlet HandleExamCreation1</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleExamCreation1 at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession(false);
        if (session != null) {
            ExamDao examDAO = new ExamDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Exam.class);
            QuestionExamDao questionExamDAO = new QuestionExamDao(
                    EntityManagerFactoryProvider.getEntityManagerFactory(), QuestionExam.class);
            QuestionDao questionDAO = new QuestionDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                    Question.class);
            UserDao userDAO = new UserDao(EntityManagerFactoryProvider.getEntityManagerFactory(), User.class);
            // Create new Exam
            Object value = session.getAttribute("user");
            User user = (User) value;
            User managedUser = userDAO.findById(user.getUserID());
            int examId = (int) examDAO.count() + 1;
            String examName = request.getParameter("examName");
            Integer duration = Integer.valueOf(request.getParameter("duration"));
            Exam newExam = new Exam(examId, duration, examName, managedUser);
            examDAO.create(newExam);
            // Set question to exam
            String[] chapterId = request.getParameterValues("chapterID");
            int numberEasy = Integer.parseInt(request.getParameter("numberEasy"));
            int numberNormal = Integer.parseInt(request.getParameter("numberNormal"));
            int numberHard = Integer.parseInt(request.getParameter("numberHard"));

            List<Question> allEasyQuest = new ArrayList();
            List<Question> allNormalQuest = new ArrayList();
            List<Question> allHardQuest = new ArrayList();
            for (String chapter : chapterId) {
                allEasyQuest.addAll(questionDAO.findByProperties("difficulty", "1", "chapter.chapterID", chapter));
                allNormalQuest.addAll(questionDAO.findByProperties("difficulty", "2", "chapter.chapterID", chapter));
                allHardQuest.addAll(questionDAO.findByProperties("difficulty", "3", "chapter.chapterID", chapter));
            }

            List<Integer> examEasyQuest = new ArrayList();
            List<Integer> examNormalQuest = new ArrayList();
            List<Integer> examHardQuest = new ArrayList();

            for (int i = 1; i <= numberEasy; i++) {
                int randomNum = (int) Math.floor(Math.random() * allEasyQuest.size());
                while (examEasyQuest.contains(randomNum)) {
                    randomNum = (int) Math.floor(Math.random() * allEasyQuest.size());
                }
                examEasyQuest.add(randomNum);
                QuestionExam questionExam = new QuestionExam(examId, allEasyQuest.get(randomNum).getQuestionId());
                questionExamDAO.create(questionExam);
            }
            for (int i = 1; i <= numberNormal; i++) {
                int randomNum = (int) Math.floor(Math.random() * allNormalQuest.size());
                while (examNormalQuest.contains(randomNum)) {
                    randomNum = (int) Math.floor(Math.random() * allNormalQuest.size());
                }
                examNormalQuest.add(randomNum);
                QuestionExam questionExam = new QuestionExam(examId, allNormalQuest.get(randomNum).getQuestionId());
                questionExamDAO.create(questionExam);
            }
            for (int i = 1; i <= numberHard; i++) {
                int randomNum = (int) Math.floor(Math.random() * allHardQuest.size());
                while (examHardQuest.contains(randomNum)) {
                    randomNum = (int) Math.floor(Math.random() * allHardQuest.size());
                }
                examHardQuest.add(randomNum);
                QuestionExam questionExam = new QuestionExam(examId, allHardQuest.get(randomNum).getQuestionId());
                questionExamDAO.create(questionExam);
            }

            // examDAO.createExam(examName, duration, user);
            response.sendRedirect(request.getContextPath() + "/functionpage/examcreation1.jsp");
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

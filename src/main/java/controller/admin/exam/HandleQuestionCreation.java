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
import java.util.ArrayList;
import java.util.List;
import model.exam.Chapter;
import model.exam.Question;
import model.exam.QuestionOption;
import repository.exam.ChapterDao;
import repository.exam.QuestionDao;
import repository.exam.QuestionOptionDao;

/**
 *
 * @author MasterLong
 */
public class HandleQuestionCreation extends HttpServlet {

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
            out.println("<title>Servlet HandleAddMoreAnswer</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleAddMoreAnswer at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        ChapterDao chapterDAO = new ChapterDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Chapter.class);
        QuestionDao questionDAO = new QuestionDao(EntityManagerFactoryProvider.getEntityManagerFactory(),
                Question.class);
        QuestionOptionDao questionOptionDAO = new QuestionOptionDao(
                EntityManagerFactoryProvider.getEntityManagerFactory(), QuestionOption.class);

        // Creat new question
        String questionContent = request.getParameter("question");
        int chapterId = Integer.parseInt(request.getParameter("chapterId"));
        Chapter newChapter = chapterDAO.findById(chapterId);
        int difficulty = Integer.parseInt(request.getParameter("difficulty"));
        Question newQuestion = new Question((int) questionDAO.count() + 1, questionContent, false, difficulty,
                newChapter);
        questionDAO.create(newQuestion);

        // Create question option
        String[] correctAnswer = request.getParameterValues("isTrue");
        if (correctAnswer==null || correctAnswer.length ==0){
            request.setAttribute("createQuestionError", "At least 1 correct answer required");
            response.sendRedirect(request.getContextPath() + "/adminhome/question_creation");
            return;
        }
        List<QuestionOption> allOption = new ArrayList();
        int i = 1;
        while (true) {
            String optionContent = request.getParameter("answer" + i);
            if (optionContent == null)
                break;
            QuestionOption newQuestionOption = new QuestionOption((int) questionOptionDAO.count() + i, false,
                    optionContent, newQuestion);
            allOption.add(newQuestionOption);
            i++;
        }
        for (int j = 1; j <= correctAnswer.length; j++) {
            int trueIndex = Integer.parseInt(correctAnswer[j - 1]);
            allOption.get(trueIndex - 1).setIsCorrect(true);
        }
        for (QuestionOption c : allOption) {
            questionOptionDAO.create(c);
        }
        // Forward back to the JSP
        response.sendRedirect(request.getContextPath() + "/adminhome/question_creation");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}

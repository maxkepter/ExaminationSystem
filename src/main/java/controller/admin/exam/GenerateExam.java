package controller.admin.exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.exam.Question;
import model.exam.QuestionTemplate;
import model.user.User;
import repository.exam.student.GenerateExamDao;
import service.exam.GenerateExamService;

/**
 *
 * @author FPT SHOP
 */
public class GenerateExam extends HttpServlet {

    private EntityManagerFactory emf;
    GenerateExamService generateExamService;

    @Override
    public void init() throws ServletException {
        emf = Persistence.createEntityManagerFactory("ExamManagement");
        GenerateExamDao generateExamDao = new GenerateExamDao(emf);
        generateExamService = new GenerateExamService(generateExamDao);

    }

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
            out.println("<title>Servlet GenerrateExam</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GenerrateExam at " + request.getContextPath()
                    + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on
    // the + sign on the left to edit the code
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
        String[] chapterNos = request.getParameterValues("chapterNo");
        String[] difficulties = request.getParameterValues("difficulty");
        String[] amounts = request.getParameterValues("amount");

        List<QuestionTemplate> templates = new ArrayList<>();
        for (int i = 0; i < chapterNos.length; i++) {
            try {
                int amount = Integer.parseInt(amounts[i]);
                templates.add(new QuestionTemplate(chapterNos[i], difficulties[i], amount));
            } catch (Exception e) {
            }
        }

        List<Question> questions = generateExamService.generateExam(templates);
        request.setAttribute("questions", questions);
        request.getRequestDispatcher("/student/questionList.jsp").forward(request, response);
    }

}

/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */

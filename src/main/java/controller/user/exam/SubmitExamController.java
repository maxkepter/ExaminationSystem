/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.user.exam;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.exam.student.StudentExam;
import service.student.exam.SubmitExamService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SubmitExamController", urlPatterns = { "/submitexam" })
public class SubmitExamController extends HttpServlet {

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
            out.println("<title>Servlet SubmitExamController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubmitExamController at " + request.getContextPath() + "</h1>");
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
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */

    private Map<Integer, Set<Integer>> getChoiceList(HttpServletRequest request)
            throws NumberFormatException, NullPointerException {

        int size = Integer.parseInt(request.getParameter("sizeQuestion"));
        Map<Integer, Set<Integer>> studentChoice = new HashMap<>();

        for (int i = 0; i < size; i++) {
            String[] options = request.getParameterValues("answers[" + i + "]");
            Set<Integer> choices = new HashSet<>();

            if (options != null) {
                for (String option : options) {
                    try {
                        choices.add(Integer.parseInt(option));
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }
                }
            }
            studentChoice.put(i, choices);
        }
        return studentChoice;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Map<Integer, Set<Integer>> studentChoice = getChoiceList(request);
        String studentExamid = request.getParameter("studentExamId");

        SubmitExamService submitExamService = new SubmitExamService();
        StudentExam studentExam = null;
        try {
            studentExam = submitExamService.submitExam(studentChoice, studentExamid);

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("student/submit_exam.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        if (session.getAttribute("currentExamId") != null) {
            request.getSession().removeAttribute("currentExamId");
        }

        float score = studentExam.getScore();
        request.setAttribute("score", score);
        request.getRequestDispatcher("student/submit_exam.jsp").forward(request, response);
        return;

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

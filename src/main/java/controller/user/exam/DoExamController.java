/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.user.exam;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.ZoneId;

import factory.DAOFactory;
import model.exam.student.StudentExam;
import model.user.User;
import service.student.exam.DoExamService;
import service.student.exam.GenerateStudentExamService;
import service.student.exam.ReloadExamService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DoExamController", urlPatterns = { "/DoExam" })
public class DoExamController extends HttpServlet {

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
            out.println("<title>Servlet DoExamController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DoExamController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        String examId = request.getParameter("examId");
        GenerateStudentExamService generateStudentExamService = new GenerateStudentExamService();
        ReloadExamService reloadExamService = new ReloadExamService();
        StudentExam studentExam = null;
        String test = "Test";
        try {
            studentExam = reloadExamService.reloadExam(user, Integer.parseInt(examId));

            // if not there is no examin progess generate new exam
            if (studentExam == null) {
                test = "Test--1";
                studentExam = generateStudentExamService.generateExam(user, Integer.parseInt(examId));
            }

        } catch (Exception e) {
            String error = e.getMessage();
            request.setAttribute("error", error + test);
            request.getRequestDispatcher("/student/view_exam.jsp").forward(request, response);
            return;
        }

        request.setAttribute("examDetail", studentExam.getExamDetail());// list type
        request.setAttribute("questionSize", studentExam.getExamDetail().size());
        request.setAttribute("studentExam", studentExam);
        request.setAttribute(StudentExam.STUDENT_CHOICE, studentExam.getStudentChoice());

        session.setAttribute("currentExamId", examId);

        long endTimeMillis = studentExam.getStartTime().plusMinutes(studentExam.getExam().getDuration())
                .atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
        request.setAttribute("endTimeMillis", endTimeMillis);
        request.getRequestDispatcher("/student/do_exam.jsp").forward(request, response);
        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

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
import model.exam.student.StudentExam;
import model.user.User;
import service.student.exam.ViewStudentExamService;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ViewStudentExamController", urlPatterns = { "/ExamHistory/viewexam" })
public class ViewStudentExamController extends HttpServlet {

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
            out.println("<title>Servlet ViewStudentExamController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewStudentExamController at " + request.getContextPath() + "</h1>");
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
        String studentExamIdStr = request.getParameter(StudentExam.STUDENT_EXAM_ID);
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        StudentExam studentExam = null;
        try {
            ViewStudentExamService examService = new ViewStudentExamService();
            studentExam = examService.getExam(user.getUserID(), Integer.parseInt(studentExamIdStr));
        } catch (Exception e) {
            String error = e.getMessage();
            request.setAttribute("error", error);
            request.getRequestDispatcher("/student/view_student_exam.jsp").forward(request, response);
            return;
        }

        request.setAttribute("examDetail", studentExam.getExamDetail());// list type
        request.setAttribute("questionSize", studentExam.getExamDetail().size());
        request.setAttribute("studentExam", studentExam);
        request.setAttribute(StudentExam.STUDENT_CHOICE, studentExam.getStudentChoice());

        request.getRequestDispatcher("/student/view_student_exam.jsp").forward(request, response);

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

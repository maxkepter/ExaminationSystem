/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package router;

import factory.EntityManagerFactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import model.exam.student.StudentExam;
import repository.exam.student.StudentExamDao;
import service.student.exam.GetExamRemainingTime;

/**
 *
 * @author MasterLong
 */
public class toExamStatus extends HttpServlet {

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
            out.println("<title>Servlet toExamStatus</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet toExamStatus at " + request.getContextPath() + "</h1>");
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
        StudentExamDao studentExamDAO = new StudentExamDao(EntityManagerFactoryProvider.getEntityManagerFactory(), StudentExam.class);
        String examID = request.getParameter("examID");
        if (examID == null) {
            response.sendRedirect(request.getContextPath() + "/adminhome");
            return;
        }
        List<StudentExam> listStudentExam = studentExamDAO.findByProperty("exam.examID", examID);
        
        listStudentExam.forEach((a) -> {
            System.out.println(a.getStudent() == null);
        });
        
        List<String> listRemainingTime = new ArrayList();
        if (listStudentExam == null || listStudentExam.isEmpty()) {
            request.setAttribute("error", "No students have taken this exam yet.");
            request.getRequestDispatcher("/functionpage/examstatus.jsp").forward(request, response);
            return;
        }
        //Format Remaining Time
        for (StudentExam c : listStudentExam) {
            Duration duration = GetExamRemainingTime.getRemainingTime(c);
            long hours = duration.toHours();
            long minutes = duration.toMinutes() % 60;
            long seconds = duration.getSeconds() % 60;
            
            String remaining = String.format("%02d:%02d:%02d", hours, minutes, seconds);
            listRemainingTime.add(remaining);
        }
        request.setAttribute("listStudentExam", listStudentExam);
        request.setAttribute("listRemainingTime", listRemainingTime);
        request.getRequestDispatcher("/functionpage/examstatus.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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

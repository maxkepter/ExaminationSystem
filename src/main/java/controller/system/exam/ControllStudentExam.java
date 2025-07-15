/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.system.exam;

import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.student.exam.SubmitExamService;
import utils.Validate;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ControllStudentExam", urlPatterns = { "/ControllStudentExam" })
public class ControllStudentExam extends HttpServlet {

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
            out.println("<title>Servlet ControllStudentExam</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControllStudentExam at " + request.getContextPath() + "</h1>");
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
        ServletContext context = getServletContext();
        String idStr = request.getParameter("studentExamId");
        String message = (String) context.getAttribute("message" + idStr);
        String url = (String) context.getAttribute("url" + idStr);

        SubmitExamService submitExamService = new SubmitExamService();

        System.out.println("ControllStudentExam: idStr = " + idStr + ", message = " + message + ", url = " + url);

        if (Validate.validateInteger(idStr) && Validate.validateString(message) && Validate.validateString(url)) {
            int studentExamId = Integer.parseInt(idStr);

            // url is "force" when admin just wants to submit the exam without redirecting
            // use when admin wants to redircet student to the other page
            if (url.compareTo("force") != 0) {
                // submit the exam
                submitExamService.submitExam(studentExamId);
            }

            // remove attributes after retrieving them to avoid stale data
            context.removeAttribute("message" + idStr);
            context.removeAttribute("url" + idStr);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            String content = "{\"message\":\"" + message + "\""
                    + ",\"url\":\"" + url + "\""
                    + "}";
            response.getWriter().write(content);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid studentExamId");
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
        ServletContext context = getServletContext();

        String studentExamId = request.getParameter("studentExamId");
        String message = request.getParameter("message");
        String url = request.getParameter("url");

        if (!Validate.validateString(url)) {
            url = "force"; // default to "force" if url is not provided
        }

        // set unique attributes for each studentExamId
        if (Validate.validateString(message) && Validate.validateInteger(studentExamId)) {
            context.setAttribute("message" + studentExamId, message);
            context.setAttribute("url" + studentExamId, url);
        }

        // Redirect to the same servlet to handle the GET request

        response.sendRedirect(request.getContextPath() + "/adminhome/all_exam");
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

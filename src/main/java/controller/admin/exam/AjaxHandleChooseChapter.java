/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin.exam;

import factory.EntityManagerFactoryProvider;
import jakarta.json.bind.Jsonb;
import jakarta.json.bind.JsonbBuilder;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.exam.Chapter;
import model.exam.Subject;
import model.exam.SubjectMajor;
import repository.exam.ChapterDao;
import repository.exam.SubjectDao;
import repository.exam.SubjectMajorDao;

/**
 *
 * @author MasterLong
 */
public class AjaxHandleChooseChapter extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet AjaxHandleChooseChapter</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AjaxHandleChooseChapter at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        SubjectDao subjectDAO = new SubjectDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Subject.class);
        SubjectMajorDao subjectmajorDAO = new SubjectMajorDao(EntityManagerFactoryProvider.getEntityManagerFactory(), SubjectMajor.class);
        ChapterDao chapterDAO = new ChapterDao(EntityManagerFactoryProvider.getEntityManagerFactory(), Chapter.class);
        //request.setAttribute("listMajor", allMajor);
        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        if ("getSubjects".equals(action)){
            List<Subject> allSubject = new ArrayList();
            int majorId = Integer.parseInt(request.getParameter("majorId"));
            List<SubjectMajor> allSubjectMajor = subjectmajorDAO.findByProperty("major.id", majorId);
            for (SubjectMajor c : allSubjectMajor){
                Subject newSubject = subjectDAO.findById(c.getSubject().getSubID());
                allSubject.add(newSubject);
            }
            Jsonb jsonb = JsonbBuilder.create();
            String json = jsonb.toJson(allSubject);
            out.print(json);
            out.flush();
        } if("getChapters".equals(action)){
            int subjectId = Integer.parseInt(request.getParameter("subjectId"));
            List<Chapter> allChapter = chapterDAO.findByProperty("subject.id",subjectId);
            Jsonb jsonb = JsonbBuilder.create();
            String json = jsonb.toJson(allChapter);
            out.print(json);
            out.flush();
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

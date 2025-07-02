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
import model.exam.Chapter;
import model.exam.Major;
import model.exam.Subject;
import model.exam.SubjectMajor;
import repository.exam.ChapterDao;
import repository.exam.MajorDao;
import repository.exam.SubjectDao;
import repository.exam.SubjectMajorDao;

/**
 *
 * @author MasterLong
 */
public class HandleSubjectAndChapterCreation extends HttpServlet {
   
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
            out.println("<title>Servlet HandleSubjectAndChapterCreation</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleSubjectAndChapterCreation at " + request.getContextPath () + "</h1>");
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
        MajorDao majorDAO = new MajorDao(EntityManagerFactoryProvider.getEntityManagerFactory(),Major.class);
        SubjectDao subjectDAO = new SubjectDao(EntityManagerFactoryProvider.getEntityManagerFactory(),Subject.class);
        SubjectMajorDao subjectMajorDAO = new SubjectMajorDao(EntityManagerFactoryProvider.getEntityManagerFactory(), SubjectMajor.class);
        ChapterDao chapterDAO = new ChapterDao(EntityManagerFactoryProvider.getEntityManagerFactory(),Chapter.class);
        
        String subjectName = request.getParameter("subjectName");
        Subject newSubject = new Subject(subjectDAO.findAll().size()+1,subjectName, false);
        subjectDAO.create(newSubject);
        
        int majorId = Integer.parseInt(request.getParameter("majorId"));
        Major newMajor = majorDAO.findById(majorId);
        SubjectMajor.SubjectMajorId newSubjectMajorId = new SubjectMajor.SubjectMajorId(majorId, newSubject.getSubID());
        SubjectMajor newSubjectMajor = new SubjectMajor(newSubjectMajorId,newMajor , newSubject);
        subjectMajorDAO.create(newSubjectMajor);
        
        int numberChapter = Integer.parseInt(request.getParameter("numberOfChapter"));
        for (int i =1; i<=numberChapter; i++){
            Chapter newChapter = new Chapter(chapterDAO.findAll().size()+1 ,i, false, newSubject);
            chapterDAO.create(newChapter);
        }
        
        response.sendRedirect(request.getContextPath() + "/adminhome/subject_creation");
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

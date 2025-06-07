/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

<<<<<<<< HEAD:src/main/java/router/toAdminHome.java
package router;
========
package controller.admin;
>>>>>>>> 55b6b9b72730e385dd14c97d1183077b0d4deba2:src/main/java/controller/admin/AdminHome.java

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author MasterLong
 */
public class toAdminHome extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("adminpage/admin_home.jsp").forward(request, response);
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
<<<<<<<< HEAD:src/main/java/router/toAdminHome.java
    throws ServletException, IOException {
        processRequest(request, response);
    } 
========
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (!RoleFilter.isAdmin(user)) {
            response.sendRedirect(request.getContextPath() + "/Home");
            return;
        }
        request.getRequestDispatcher("adminpage/admin_home.jsp").forward(request, response);
    }
>>>>>>>> 55b6b9b72730e385dd14c97d1183077b0d4deba2:src/main/java/controller/admin/AdminHome.java

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

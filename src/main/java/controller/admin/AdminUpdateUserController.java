/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.admin.management.user.AdminChangePasswordService;
import service.admin.management.user.AdminUpdateUserInfoService;

/**
 *
 * @author Admin
 */
@WebServlet(name="AdminUpdateUserController", urlPatterns={"/AdminUpdateUser"})
public class AdminUpdateUserController extends HttpServlet {
   
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
            out.println("<title>Servlet AdminUpdateUserController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminUpdateUserController at " + request.getContextPath () + "</h1>");
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
          response.sendRedirect(request.getContextPath() + "/UserManagement");
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
         String command = request.getParameter("command");
        String userIdStr = request.getParameter("userId");
        try {
            int userId = Integer.parseInt(userIdStr);
            switch (command) {
                case "updateInfo":
                    AdminUpdateUserInfoService userInfoService = new AdminUpdateUserInfoService();

                    String firstName = request.getParameter("firstName");
                    String lastName = request.getParameter("lastName");
                    String email = request.getParameter("email");
                    String roleStr = request.getParameter("role");
                    int role = Integer.parseInt(roleStr);

                    userInfoService.update(userId, firstName, lastName, email, role);

                    break;
                case "updatePassword":
                    AdminChangePasswordService changePasswordService = new AdminChangePasswordService();
                    String newPassword = request.getParameter("password");
                    changePasswordService.changePassword(userId, newPassword, newPassword);
                    break;
                default:
                    throw new AssertionError();
            }
        } catch (Exception e) {
            String errorMessage = e.getMessage();
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("adminpage/view_user.jsp").forward(request, response);
            return;
        }
        response.sendRedirect(request.getContextPath() + "/User?userId=" + userIdStr);
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

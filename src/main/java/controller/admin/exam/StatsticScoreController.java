/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin.exam;

import factory.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import model.exam.Exam;

/**
 *
 * @author Admin
 */
@WebServlet(name = "StatsticScoreController", urlPatterns = { "/StatsticScore" })
public class StatsticScoreController extends HttpServlet {

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
            out.println("<title>Servlet StatsticScoreController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StatsticScoreController at " + request.getContextPath() + "</h1>");
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
        String examId = request.getParameter("examId");

        try {
            List<Exam> examList = DAOFactory.getExamDao().findAll();
            if (examId != null && !examId.isEmpty()) {
                Map<Float, Long> map = (HashMap<Float, Long>) DAOFactory.getStudentExamDao()
                        .countScoreByExam(Integer.parseInt(examId));
                Map<Integer, Long> intervalMap = new HashMap<>();
                for (int i = 0; i < 11; i++) {
                    intervalMap.put(i, 0L);
                }
                for (Map.Entry<Float, Long> entry : map.entrySet()) {
                    float score = entry.getKey();
                    long count = entry.getValue();

                    if (score >= 0.0f && score < 10.0f) {
                        int index = (int) score; // ép về int sẽ tự động thành 0..9
                        intervalMap.put(index, intervalMap.get(index) + count);
                    }
                }
                request.setAttribute("intervalMap", intervalMap);
                request.setAttribute("scoreMap", map);
                request.setAttribute("examId", examId);
                float highestScore = -1f;
                float lowestScore = 11f;

                for (Map.Entry<Float, Long> entry : map.entrySet()) {
                    float score = entry.getKey();
                    long count = entry.getValue();

                    if (count > 0) {
                        if (score > highestScore) {
                            highestScore = score;
                        }
                        if (score < lowestScore) {
                            lowestScore = score;
                        }
                    }
                }

                // Nếu không có điểm nào hợp lệ (trường hợp map rỗng), fallback về 0
                if (highestScore == -1f) {
                    highestScore = 0f;
                }
                if (lowestScore == 11f) {
                    lowestScore = 0f;
                }
                request.setAttribute("highestScore", highestScore);
                request.setAttribute("lowestScore", lowestScore);
                System.out.println(highestScore);
            }

            request.setAttribute("examList", examList);
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
        }

        request.getRequestDispatcher("functionpage/statics.jsp").forward(request, response);
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

///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
// */
//package controller.exam;
//
//import jakarta.persistence.EntityManagerFactory;
//import java.io.IOException;
//import java.io.PrintWriter;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.util.ArrayList;
//import java.util.List;
//import model.exam.Exam;
//import model.exam.Question;
//import model.exam.Template;
//import model.user.User;
//import repository.exam.TemplateDao;
//
///**
// *
// * @author FPT SHOP
// */
//public class GenerateExam extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet GenerrateExam</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet GenerrateExam at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
////        String code = request.getParameter("code");
////        User user = (User) request.getSession().getAttribute("currentUser");
////        EntityManagerFactory emf = null;
////        TemplateDao templateDao = new TemplateDao(emf, Template.class);
////        Template template = templateDao.findByCode(code);
////        if (template != null) {
////            // Tạo bài thi mới từ template
////            Exam newExam = new Exam();
////            newExam.setDuration(60); // ví dụ: 60 phút
////            newExam.setUser(user);
////
////            // Copy câu hỏi từ template -> bài thi mới
////            List<Question> questions = new ArrayList<>();
////            for (Question q : template.getquestion()) {
////                Question newQ = new Question();
////                newQ.setContent(q.getContent());
////                newQ.setOptions(q.getOptions());
////                newQ.setCorrectAnswer(q.getCorrectAnswer());
////                newQ.setExam(newExam); // liên kết câu hỏi với bài thi mới
////                questions.add(newQ);
////            }
////            newExam.setQuestions(questions);
////
////            // Lưu vào DB
////            examDAO.save(newExam);
////
////            // Gửi bài thi về cho người dùng
////            request.setAttribute("exam", newExam);
////            request.getRequestDispatcher("/student/doExam.jsp").forward(request, response);
////        } else {
////            request.setAttribute("message", "Không tìm thấy đề thi.");
////            request.getRequestDispatcher("/student/findCode.jsp").forward(request, response);
////        }
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}

///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Filter.java to edit this template
// */
//package filter;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.io.StringWriter;
//
//import factory.DAOFactory;
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import model.exam.student.StudentExam;
//import model.user.User;
//import service.log.ExamLogService;
//
///**
// *
// * @author Admin
// */
//@WebFilter(filterName = "ExamInProgressFilter", urlPatterns = { "/*" })
//public class ExamInProgressFilter implements Filter {
//
//    private static final boolean debug = true;
//
//    // The filter configuration object we are associated with. If
//    // this value is null, this filter instance is not currently
//    // configured.
//    private FilterConfig filterConfig = null;
//
//    public ExamInProgressFilter() {
//    }
//
//    /**
//     *
//     * @param request  The servlet request we are processing
//     * @param response The servlet response we are creating
//     * @param chain    The filter chain we are processing
//     *
//     * @exception IOException      if an input/output error occurs
//     * @exception ServletException if a servlet error occurs
//     */
//    public void doFilter(ServletRequest request, ServletResponse response,
//            FilterChain chain)
//            throws IOException, ServletException {
//        HttpServletRequest req = (HttpServletRequest) request;
//        HttpServletResponse res = (HttpServletResponse) response;
//
//        HttpSession session = req.getSession(false);
//        String path = req.getServletPath();
//
//        if (path.startsWith("/Login") || path.startsWith("/Register") || path.startsWith("/static/")
//                || path.endsWith(".css") || path.endsWith(".js")) {
//            chain.doFilter(request, response);
//            return;
//        }
//
//        if (path.startsWith("/Login") || path.startsWith("/Register")) {
//            return;
//        }
//
//        if (session == null) {
//            res.sendRedirect(req.getContextPath() + "/Login");
//            return;
//        }
//        // check login and is student
//        User user = (User) session.getAttribute("user");
//        if (user == null) {
//            res.sendRedirect(req.getContextPath() + "/Login");
//            return;
//        }
//
//        if (RoleFilter.isAdmin(user)) {
//            chain.doFilter(request, response);
//            return;
//        }
//
//        Integer currentExamId = (Integer) session.getAttribute("currentExamId");
//        if (currentExamId == null) {
//            try {
//                // Get doing exam if currentExam is null
//                StudentExam studentExam = DAOFactory.getStudentExamDao().getDoingExam(user);
//
//                ExamLogService examLogService = new ExamLogService();
//                examLogService.createLog(studentExam.getStudentExamID(), "Test Filter " + studentExam.getExamStatus());
//
//                if (studentExam != null) {
//                    currentExamId = studentExam.getExam().getExamID();
//                    session.setAttribute("currentExamId", currentExamId);
//                } else {
//                    return;
//                }
//            } catch (Exception e) {
//                res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "System error !");
//                return;
//            }
//        }
//
//        if (currentExamId != null && !path.equals("/DoExam")) {
//            res.sendRedirect(req.getContextPath() + "/DoExam?examId=" + currentExamId);
//            return;
//        }
//
//        chain.doFilter(request, response);
//
//    }
//
//    /**
//     * Return the filter configuration object for this filter.
//     */
//    public FilterConfig getFilterConfig() {
//        return (this.filterConfig);
//    }
//
//    /**
//     * Set the filter configuration object for this filter.
//     *
//     * @param filterConfig The filter configuration object
//     */
//    public void setFilterConfig(FilterConfig filterConfig) {
//        this.filterConfig = filterConfig;
//    }
//
//    /**
//     * Destroy method for this filter
//     */
//    public void destroy() {
//    }
//
//    /**
//     * Init method for this filter
//     */
//    public void init(FilterConfig filterConfig) {
//        this.filterConfig = filterConfig;
//        if (filterConfig != null) {
//            if (debug) {
//                log("ExamInProgressFilter:Initializing filter");
//            }
//        }
//    }
//
//    /**
//     * Return a String representation of this object.
//     */
//    @Override
//    public String toString() {
//        if (filterConfig == null) {
//            return ("ExamInProgressFilter()");
//        }
//        StringBuffer sb = new StringBuffer("ExamInProgressFilter(");
//        sb.append(filterConfig);
//        sb.append(")");
//        return (sb.toString());
//    }
//
//    public static String getStackTrace(Throwable t) {
//        String stackTrace = null;
//        try {
//            StringWriter sw = new StringWriter();
//            PrintWriter pw = new PrintWriter(sw);
//            t.printStackTrace(pw);
//            pw.close();
//            sw.close();
//            stackTrace = sw.getBuffer().toString();
//        } catch (Exception ex) {
//        }
//        return stackTrace;
//    }
//
//    public void log(String msg) {
//        filterConfig.getServletContext().log(msg);
//    }
//
//}

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.system.chatbot;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Properties;
import java.util.stream.Collectors;

/**
 *
 * @author FPT SHOP
 */
public class ChatServlet extends HttpServlet {

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
            out.println("<title>Servlet ChatServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChatServlet at " + request.getContextPath() + "</h1>");
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

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String apiKey;

    @Override
    public void init() throws ServletException {
        try (InputStream input = getServletContext().getResourceAsStream("/WEB-INF/config.properties")) {
            if (input == null) {
                throw new FileNotFoundException("Không tìm thấy file config.properties tại /WEB-INF/");
            }
            Properties prop = new Properties();
            prop.load(input);
            apiKey = prop.getProperty("gemini.api.key");
            System.out.println("API Key đã đọc: " + apiKey);
        } catch (IOException e) {
            throw new ServletException("Không thể load config.properties", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("---- DEBUG LOG ----");
        System.out.println("1. Đang đọc body từ client...");

        String body = new BufferedReader(new InputStreamReader(request.getInputStream()))
                .lines().collect(Collectors.joining("\n"));

        System.out.println("Nội dung nhận được:");
        System.out.println(body);

        System.out.println("2. Gửi đến Gemini với API Key: " + apiKey);

        try {
            URL url = new URL("https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoOutput(true);
            conn.setRequestMethod("POST");

// ✅ Đặt headers đúng format
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("X-goog-api-key", apiKey);

// Gửi JSON body (ví dụ: lấy từ biến `body`)
            try (OutputStream os = conn.getOutputStream()) {
                os.write(body.getBytes(StandardCharsets.UTF_8));
            }

            InputStream is;
            int responseCode = conn.getResponseCode();
            System.out.println("3. Phản hồi từ Gemini, mã: " + responseCode);

            if (responseCode >= 400) {
                is = conn.getErrorStream();
                response.setStatus(responseCode);
                System.out.println("Lỗi từ Gemini:");
                try (BufferedReader br = new BufferedReader(new InputStreamReader(is))) {
                    String errorLine;
                    while ((errorLine = br.readLine()) != null) {
                        System.out.println(errorLine);
                    }
                }
                response.setContentType("application/json;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.print("{\"error\": \"Gemini trả về mã lỗi " + responseCode + "\"}");
                }
                return;
            } else {
                is = conn.getInputStream();
                response.setStatus(200);
            }

            response.setContentType("application/json;charset=UTF-8");
            try (OutputStream out = response.getOutputStream()) {
                is.transferTo(out);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            response.setStatus(500);
            response.setContentType("application/json;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                out.print("{\"error\": \"Lỗi nội bộ trong ChatServlet: " + ex.getMessage() + "\"}");
            }
        }

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
